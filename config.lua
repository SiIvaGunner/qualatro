SMODS.current_mod.config_tab = assert(SMODS.load_file('config_tab.lua'))
local mod_description = assert(SMODS.load_file('mod_description.lua'))()
SMODS.current_mod.custom_ui = function(nodes)
  nodes[1] = nil
  nodes[2]['nodes'] = mod_description['nodes']
end
return {
  ['music_layers'] = true,
  ['resph_mode'] = false,
  ['resph_textures'] = false,
}