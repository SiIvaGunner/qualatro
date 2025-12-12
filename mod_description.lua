-- watch config_tab Mods/Qualatro/mod_description.lua
local debug = false

local P = {
	dda = 'DDA',
	party_rock = '.party_rock',
	psych = 'PsychLantern',
	keeby = 'Keeby',
	zc = '123zc',
	ahmayk = 'Ahmaykmewsik',
	yazawaakios = 'YazawaAkiOS',
	pixelsword = 'pixelsword_',
	maggie = 'Maggie',
	alan = 'alan',
	blob = 'BigBadBlob',
	bob = 'BobTheTacocat',
	tattleamelia = 'Tattleamelia',
	csg = 'ChickenSuitGuy',
	lazer = '601billionlazer',
	mth = 'MtH',
	mikroscopic = 'Mikroscopic',
	gram = 'Grambam36',
	nava = 'Navag8r',
	tina = 'Tina the Cyclops girl',
	athena = 'athenamite',
	tdstr = 'tdstr',
	leye = 'l4ureleye',
	roozi = 'Netyasha Roozi',
	gene = 'Gene',
	omknee = 'omni',
	splurgy = 'splurgy',
	snakeman = 'SnakeManvsArbok'
}
local minor_contributor = 0.3
local tester = 0.25
local thanks = 0.25
local title_large = 0.65
local title_small = 0.4

local function credit(person, scale)
	return {
		n = G.UIT.R,
		config = { align = "tm" },
		nodes = {
			{
				n = G.UIT.T,
				config = { text = person, colour = G.C.WHITE, scale = scale or 0.4 }
			},
		}
	}
end

-- Debug colors for creating UI table
local function dc(colour)
	if debug then
		return colour
	else
		return G.C.CLEAR
	end
end

return {
	n = G.UIT.ROOT,
	config = { align = "cm", colour = G.C.CLEAR },
	nodes = {
		{
			n = G.UIT.C,
			config = { colour = dc(G.C.MONEY) },
			nodes = {
				{
					n = G.UIT.R,
					config = { minh = 1, colour = dc(G.C.BLACK), align = "tm" },
					nodes = {
						{
							n = G.UIT.C,
							config = { minh = 1, colour = dc(G.C.BLACK), align = "tm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "tm", colour = dc(G.C.MONEY) },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = "Qualatro", colour = G.C.WHITE, scale = 1.2, }
										},
									}
								},
								{
									n = G.UIT.R,
									config = { align = "tm", colour = dc(G.C.MONEY), padding = 0.1  },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_subtitle"), colour = G.C.WHITE, scale = title_small },
										},
									}
								},
							}
						},
					}
				},
				{
					n = G.UIT.R,
					config = { minh = 1, colour = dc(G.C.BLACK) },
					nodes = {
						{
							n = G.UIT.C,
							config = { minw = 4, minh = 4, colour = dc(G.C.RED), padding = 0.15, align = "tm" },
							nodes = {
								{
									n = G.UIT.R,
									config = {},
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_developed"), colour = G.C.WHITE, scale = title_large }
										},
									}
								},
								credit(P.zc),
								credit(P.ahmayk),
								credit(P.dda),
								credit(P.pixelsword, minor_contributor),
								credit(P.alan, minor_contributor),
								credit(P.nava, minor_contributor),

								{
									n = G.UIT.R,
									config = { align = "bm", minh = 1 },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_testing"), colour = G.C.WHITE, scale = title_small }
										},
									}
								},
								credit(P.blob, tester),
								credit(P.bob, tester),
								credit(P.tattleamelia, tester),
								credit(P.csg, tester),
								credit(P.lazer, tester),
								credit(P.omknee, tester),
								credit(P.gene, tester),
								credit(P.splurgy, tester),
								credit(P.snakeman, tester),
							},
						},
						{
							n = G.UIT.C,
							config = { minw = 4, minh = 4, colour = dc(G.C.BLUE), padding = 0.15, align = "tm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "tm" },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_music"), colour = G.C.WHITE, scale = title_large }
										},
									}
								},
								credit(P.ahmayk),
								credit(P.mth, minor_contributor),
								credit(P.leye, minor_contributor),
								credit(P.roozi, minor_contributor),
								credit(P.tdstr, minor_contributor),

								{
									n = G.UIT.R,
									config = { align = "bm", minh = 0.8 },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_thanks"), colour = G.C.WHITE, scale = title_small }
										},
									}
								},
								credit("localthunk & LouisF", thanks),
								credit("SMODS Team (Steamodded)", thanks),
								credit("Lovely Team", thanks),
								credit("WilsontheWolf (DebugPlus)", thanks),
								credit("Cryptid Team", thanks),
								credit("Balatro University", thanks),
								
								{
									n = G.UIT.R,
									config = { align = "bm", minh = 0.8 },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_unthanks"), colour = G.C.WHITE, scale = title_small }
										},
									}
								},
								credit(localize("qua_credits_arrays"), thanks),
								credit(localize("qua_credits_contains"), thanks),
							},
						},
						{
							n = G.UIT.C,
							config = { minw = 4, minh = 4, colour = dc(G.C.GREEN), padding = 0.15, align = "tm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "tm" },
									nodes = {
										{
											n = G.UIT.T,
											config = { text = localize("qua_credits_art"), colour = G.C.WHITE, scale = title_large }
										},
									}
								},
								credit(P.party_rock),
								credit(P.yazawaakios),
								credit(P.psych),
								credit(P.keeby),
								credit(P.mikroscopic),
								credit(P.dda, minor_contributor),
								credit(P.gram, minor_contributor),
								credit(P.mth, minor_contributor),
								credit(P.maggie, minor_contributor),
								credit(P.lazer, minor_contributor),
								credit(P.tina, minor_contributor),
								credit(P.athena, minor_contributor),
							},
						},
					}
				},
			}
		},
	}
}
