SMODS.current_mod.config_tab = assert(SMODS.load_file('config_tab.lua'))
local mod_description = assert(SMODS.load_file('mod_description.lua'))
SMODS.Mods.Qualatro.custom_ui = function(nodes)
	local desc =  mod_description()
	nodes[1] = nil
	nodes[2]['nodes'] = desc.nodes
end
return {
  ['music_layers'] = true,
  ['resph_mode'] = false,
  ['resph_textures'] = false,
}

