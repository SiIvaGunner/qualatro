return {
  n = G.UIT.ROOT,
  config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
  nodes = {
    create_toggle({ 
      label = "Custom Music",
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'music_layers',
      info = {"Enables custom music for many Qualatro Jokers"},
	  default = true,
    }) or nil,
    create_toggle({ 
      label = "RE:SPH Textures",
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'resph_textures',
	  default = false,
      info = {
		  "Jokers from the RE:SPH release use their original textures",
		  "(Requires restart for this toggle to take effect)",
	  },
    }) or nil,
    create_toggle({ 
      label = "ARG Mode",
      ref_table = SMODS.Mods.Qualatro.config,
      ref_value = 'resph_mode',
	  default = false,
      info = {
		  "Play the original RE:SPH release (December 2024)",
		  "(Requires restart for this toggle to take effect)",
		  "(Previous game will not be compatible)",
	  },
    }) or nil,
  },
}
