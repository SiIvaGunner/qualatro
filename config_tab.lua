return {
  n = G.UIT.ROOT,
  config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
  nodes = {
    create_toggle({ 
      label = localize("qua_config_custom"),
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'music_layers',
      info = {localize("qua_config_custom_desc")},
	  default = true,
    }) or nil,
    create_toggle({ 
      label = localize("qua_config_resph_textures"),
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'resph_textures',
	  default = false,
      info = {
		  localize("qua_config_resph_textures_desc"),
		  localize("qua_config_restart"),
	  },
    }) or nil,
    create_toggle({ 
      label = localize("qua_config_arg"),
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'resph_mode',
	  default = false,
      info = {
		  localize("qua_config_arg_desc"),
		  localize("qua_config_restart"),
		  localize("qua_config_previous_game"),
	  },
    }) or nil,
  },
}
