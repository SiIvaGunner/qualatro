#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

number hue(number s, number t, number h)
{
	number hs = mod(h, 1.)*6.;
	if (hs < 1.) return (t-s) * hs + s;
	if (hs < 3.) return t;
	if (hs < 4.) return (t-s) * (4.-hs) + s;
	return s;
}

vec4 RGB(vec4 c)
{
	if (c.y < 0.0001)
		return vec4(vec3(c.z), c.a);

	number t = (c.z < .5) ? c.y*c.z + c.z : -c.y*c.z + (c.y+c.z);
	number s = 2.0 * c.z - t;
	return vec4(hue(s,t,c.x + 1./3.), hue(s,t,c.x), hue(s,t,c.x - 1./3.), c.w);
}

vec4 HSL(vec4 c)
{
	number low = min(c.r, min(c.g, c.b));
	number high = max(c.r, max(c.g, c.b));
	number delta = high - low;
	number sum = high+low;

	vec4 hsl = vec4(.0, .0, .5 * sum, c.a);
	if (delta == .0)
		return hsl;

	hsl.y = (hsl.z < .5) ? delta / sum : delta / (2.0 - sum);

	if (high == c.r)
		hsl.x = (c.g - c.b) / delta;
	else if (high == c.g)
		hsl.x = (c.b - c.r) / delta + 2.0;
	else
		hsl.x = (c.r - c.g) / delta + 4.0;

	hsl.x = mod(hsl.x / 6., 1.);
	return hsl;
}

// watch shader Mods/Qualatro/assets/shaders/glitched.fs

extern MY_HIGHP_OR_MEDIUMP vec2 glitched;

float hash11(float x){ return fract(sin(x*12.9898)*43758.5453); }
float hash21(vec2 p){ return fract(sin(dot(p, vec2(127.1,311.7)))*43758.5453); }

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 base = Texel(texture, texture_coords);

    vec2 origin = texture_details.xy * texture_details.ba;
    vec2 scale  = texture_details.ba;
    vec2 uv     = ((texture_coords * image_details) - origin) / scale;
    vec2 uv2tc  = scale / image_details;

    float t = mod(time, 600.0);
    vec2 seed = glitched;

    float cols   = mix(64.0, 160.0, fract(seed.x*0.61 + 0.27));
    float colId  = floor(uv.x * cols);

    const float periodC = 0.35;
    float tq     = (mod(time + seed.x*0.21, periodC*1024.0)) / periodC;
    float tickC  = floor(tq);
    float phase  = fract(tq);
    float sm     = phase*phase*(3.0 - 2.0*phase);

    float tickW  = mod(tickC, 1024.0);
    float r0     = hash11(colId + tickW*17.0 + seed.y*31.0);
    float r1n    = hash11(colId + mod(tickW+1.0,1024.0)*17.0 + seed.y*31.0);

    float colShift = (mix(r0, r1n, sm) - 0.5) * (0.016 + 0.012*abs(seed.x));

    float rapidY = 0.0012 * (sin(colId*3.7 + t*32.0) + sin(uv.x*820.0 + t*54.0));
    rapidY      += (hash11(colId + floor(mod(t,60.0))) - 0.5)*0.0026;

    float wobbleX = 0.0014 * sin(t*10.0 + uv.y*180.0);

    vec2 baseOff = vec2(wobbleX, colShift + rapidY);

    float bleed = 0.0015 + 0.0010*sin(t*0.7 + uv.y*9.0);
    vec2 offR = baseOff + vec2( bleed, 0.0);
    vec2 offG = baseOff;
    vec2 offB = baseOff + vec2(-bleed, 0.0);

    const float periodB = 1.6;
    float tqB   = (mod(time + seed.x*0.3, periodB*1024.0)) / periodB;
    float tickB = floor(tqB);
    float tickBw= mod(tickB, 1024.0);

    float coarse = mix(6.0, 10.0, hash11(tickBw + seed.x*13.0));
    vec2  cell   = floor(uv * coarse);
    vec2  cellUV = fract(uv * coarse);

    float pick    = hash21(cell + vec2(tickBw, seed.y*19.0));
    float arctive  = step(0.92, pick);
    float amp     = 0.018 + 0.012*abs(seed.x);

    float r1b = hash21(cell + vec2(tickBw*1.7, seed.x*7.0));
    float r2b = hash21(cell.yx + vec2(seed.y*5.0, tickBw*0.9));
    vec2  blkShift = vec2(r1b-0.5, r2b-0.5) * amp;

    float sq = step(0.12, cellUV.x) * step(cellUV.x, 0.88)
             * step(0.12, cellUV.y) * step(cellUV.y, 0.88);
    float blkMask = arctive * sq;

    vec2 tcBaseR = clamp(texture_coords + offR * uv2tc, 0.0, 1.0);
    vec2 tcBaseG = clamp(texture_coords + offG * uv2tc, 0.0, 1.0);
    vec2 tcBaseB = clamp(texture_coords + offB * uv2tc, 0.0, 1.0);

    vec2 tcBlkR  = clamp(texture_coords + (offR + blkShift) * uv2tc, 0.0, 1.0);
    vec2 tcBlkG  = clamp(texture_coords + (offG + blkShift) * uv2tc, 0.0, 1.0);
    vec2 tcBlkB  = clamp(texture_coords + (offB + blkShift) * uv2tc, 0.0, 1.0);

    float r = mix(Texel(texture, tcBaseR).r, Texel(texture, tcBlkR).r, blkMask);
    float g = mix(Texel(texture, tcBaseG).g, Texel(texture, tcBlkG).g, blkMask);
    float b = mix(Texel(texture, tcBaseB).b, Texel(texture, tcBlkB).b, blkMask);

    vec3 col = vec3(r, g, b);
    float slFreq = 760.0 + 120.0*sin(t*0.4);
    float sl     = sin(uv.y*slFreq + t*38.0);
    float slAmt  = 0.05 + 0.04*sin(t*0.6); 
    col *= (1.0 + slAmt * sl); 
    float jitterX = (hash11(floor(uv.y*520.0) + floor(mod(t,30.0))) - 0.5)*0.0024;
    vec2  tcJ     = clamp(texture_coords + vec2(jitterX, 0.0) * uv2tc, 0.0, 1.0);
    col = mix(col, Texel(texture, tcJ).rgb, 0.14);
    float grain = (hash21(uv*vec2(900.0,520.0) + vec2(t*120.0, t*96.0)) - 0.5)*0.06;
    col = clamp(col + grain, 0.0, 1.0);

    vec4 outCol = vec4(col, base.a);
    return dissolve_mask(outCol * colour, texture_coords, uv);
}


extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif