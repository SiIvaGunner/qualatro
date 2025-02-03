--Class
MultiSprite = Sprite:extend()

--Class Methods
function MultiSprite:init(X, Y, W, H, new_sprite_atlas, multi_sprite_poss)
    Sprite.init(self, X, Y, W, H, new_sprite_atlas, multi_sprite_poss[1])
    self.multi_sprite_poss = multi_sprite_poss
end

function MultiSprite:draw_self(overlay)
    if not self.states.visible then return end
    if self.sprite_pos.x ~= self.sprite_pos_copy.x or self.sprite_pos.y ~= self.sprite_pos_copy.y then
        self:set_sprite_pos(self.sprite_pos)
    end
    prep_draw(self, 1)
    love.graphics.scale(1/(self.scale.x/self.VT.w), 1/(self.scale.y/self.VT.h))
    love.graphics.setColor(overlay or G.BRUTE_OVERLAY or G.C.WHITE)
    for _, ps in pairs(self.multi_sprite_poss) do
        local sprite = love.graphics.newQuad(
            ps.x*self.atlas.px,
            ps.y*self.atlas.py,
            self.scale.x,
            self.scale.y, self.atlas.image:getDimensions()
        )

        love.graphics.draw(
            self.atlas.image,
            sprite,
            0 ,0,
            0,
            self.VT.w/(self.T.w),
            self.VT.h/(self.T.h)
        )
    end
    love.graphics.pop()
    add_to_drawhash(self)
    self:draw_boundingrect()
    if self.shader_tab then love.graphics.setShader() end
end
