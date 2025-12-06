is_debug = false

assert(SMODS.shallow_copy, "You are running an outdated version of Steamodded. Please update to continue.")

SMODS.optional_features.quantum_enhancements = true
SMODS.optional_features.post_trigger = true
SMODS.optional_features.retrigger_joker = true
-- Causes bad slowdown
-- SMODS.optional_features.cardareas.deck = true

SMODS.Atlas {
	key = "balatro",
		raw_key = true,
	path = "Qualatro.png",
	px=366,
	py=208,
}

local hasTalisman = next(SMODS.find_mod("Talisman"))
if not hasTalisman then
	function to_big(val) return val end
	function to_number(val) return val end
end

-- MultiSprite class extension for Crazy Bus animation
local multiSprite = assert(SMODS.load_file("MultiSprite.lua"))
multiSprite()

local ATLAS = "QualatroJokers"
SMODS.Atlas {
	key = ATLAS,
	path = "QualatroJokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "QualatroTarot",
	path = "QualatroTarot.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "QualatroBooster",
	path = "QualatroBooster.png",
	px = 71,
	py = 95
}
SMODS.Atlas {
	key = "QualatroSpectral",
	path = "QualatroSpectral.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "QualatroStickers",
	path = "QualatroStickers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "RESPH",
	path = "RESPHJokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "RESPHVS",
	path = "RESPHVS.png",
	px = 34,
	py = 34,
	atlas_table = "ANIMATION_ATLAS",
	frames = 1
}

SMODS.Atlas {
	key = "QualatroCrazyBusText",
	path = "QualatroCrazyBusText.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "QualatroEtika",
	path = "QualatroEtika.png",
	px = 71,
	py = 95
}

SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 29*2,
	py = 24*2
})

local _jokers = {
	'jokex',
	'jokex_lost_media',
	'smashup',
	'jokex_replica',
	'susie',
	'grand_dad',
	'coconut_gun',
	'slip_n_slide',
	'familiar_photo',
	'reader',
	'jerome',
	'beader_and_berome',
	'fools_spirit',
	'christmas_spirit',
	'siivagunner',
	'inspector_gadget',
	'ogg',
	'haruka',
	'twob',
	'golden_necklace',
	'dimensional_cape',
	'siiva_ai',
	'genocide_chad',
	'spectrogram',
	'cat_mask',
	'word_whammer',
	'final_goodbye',
	'hypercam',
	'eight_bit_beast',
	'hot_cross_buns',
	'galaxia',
	'dr_andonuts',
	'dian_shi_ma_li',
	'king_for_eternity',
	'lady',
	'slider',
	'ride_the_raft',
	'circus',
	'beta_mix',
	'papyrus',
	'cryptid_hunt',
	'stingy',
	'get_lucky',
	'antonymph',
	'haltmann',
	'othello_world',
	'boykisser',
	'pomni',
	'gegagedigedagedago',
	'gadget_room',
	'nico_nico',
	'reverb',
	'polar_star',
	'brainless',
	'evil_brainless',
	'onetwo_jump',
	'crazy_bus',
	'tax_fraud',
	'jazz_cats_shades',
	'jazz_cats_tom',
	'jazz_cats_sphelonious',
	'wii_shop_channel',
	'cartoon_gunner',
	'siiva_swim',
	'missingno',
	'poke_party',
	'joker_inside_your_head',
	'interior_joker',
	'kazoo',
	'katamari_on_the_rocks',
	'planet_b_ball',
	'color_war',
	'dancing_mad',
	'circus',
	'pizza_roll',
	'takeover_doover',
	'mm2wood',
	'the_bean',
	'christmas_in_july',
	'joper',
	'nobodys_hero',
	'together_now',
	'smoke_explainer',
	'caramelldansen',
	'limited_liability_partnership',
	'ajit_pai',
	'nozomi',
	'bites_the_dust',
	'etika_reveal',
	'kingly_mask',
	'nintendo_power',
	'donut1',
	'donut2',
	'donut3',
	'donut4',
	'donut5',
	'donut6',
	'donut7',
	'donut8',
	'djpk',
	'weezer'
}

local jokers = {}
jokerkey = {}
for _,_j in ipairs(_jokers) do
	jokers[_j] = _j
	jokerkey[_j] = 'j_qualatro_'.._j
end
j = jokers

local SOUL = '_soul'

local _jokerpos = {
	{'', j.grand_dad, j.siivagunner, j.siivagunner..SOUL, j.susie, j.mm2wood, j.jokex, j.jokex_lost_media, '', j.jokex_replica},
	{j.haruka, j.genocide_chad, j.siiva_ai, j.twob, j.dimensional_cape, j.galaxia, j.color_war, j.smoke_explainer, j.dr_andonuts, j.smashup},
	{j.inspector_gadget, j.ogg, j.reader, j.jerome, j.beader_and_berome, j.beader_and_berome..SOUL, j.donut1, j.donut2, j.donut3, j.donut4},
	{j.slip_n_slide, j.christmas_spirit, j.fools_spirit, j.coconut_gun, j.golden_necklace, j.familiar_photo, j.donut5, j.donut6, j.donut7, j.donut8},
	{j.spectrogram, j.cat_mask, j.word_whammer, j.final_goodbye, j.tax_fraud, j.eight_bit_beast, j.king_for_eternity, j.hypercam, j.djpk, j.nintendo_power},
	{j.antonymph, j.beta_mix, j.onetwo_jump, j.slider, j.stingy, j.haltmann, j.papyrus, j.cryptid_hunt, j.nico_nico, j.polar_star},
	{j.reverb, j.ride_the_raft, j.crazy_bus, j.the_bean, j.othello_world, j.weezer, j.jazz_cats_shades, j.jazz_cats_tom, j.jazz_cats_sphelonious, j.jazz_cats_sphelonious..SOUL},
	{j.get_lucky, j.dancing_mad, j.wii_shop_channel, j.cartoon_gunner, j.siiva_swim, j.gadget_room, j.kingly_mask, j.limited_liability_partnership, j.ajit_pai, j.etika_reveal},
	{j.brainless, j.evil_brainless, j.boykisser, j.pomni, j.gegagedigedagedago, j.lady, j.interior_joker, j.kazoo, j.joker_inside_your_head, j.joker_inside_your_head..SOUL},
	{j.hot_cross_buns, j.dian_shi_ma_li, j.planet_b_ball, j.katamari_on_the_rocks, j.christmas_in_july, j.circus, '', j.nobodys_hero, j.together_now, j.nozomi..SOUL},
	{j.caramelldansen..'1', j.caramelldansen..'2', j.caramelldansen..'3', j.caramelldansen..'4', j.pizza_roll, j.takeover_doover, j.joper, j.poke_party, j.bites_the_dust, j.nozomi},
}

local function get_jokerpos()
	local jokerpos_res = {}
	for y,r in ipairs(_jokerpos) do
		for x,c in ipairs(r) do
			if c == nil then
				
			end
			if c ~= '' then
				jokerpos_res[string.gsub(c, '^j_', '')] = {
					x = x-1,
					y = y-1
				}
			end
		end
	end
	return jokerpos_res
end
jokerpos = get_jokerpos()

--NOTE: (Ahmayk) do not allow continue if ARG mode does not match save file
local _super_can_continue = G.FUNCS.can_continue
G.FUNCS.can_continue = function(e)
	local _can_continue = _super_can_continue(e)
	if 
		_can_continue and
		G.SAVED_GAME and
		SMODS.Mods.Qualatro and
		(
			(G.SAVED_GAME.GAME.resph_mode and not G.qualatro_resph_mode_loaded) or 
			(not G.SAVED_GAME.GAME.resph_mode and G.qualatro_resph_mode_loaded)
		)
	then
		_can_continue = false
	end

	if not _can_continue then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
	end

	return _can_continue
end

local _super_start_run = Game.start_run
function Game:start_run(args)
  local ret = _super_start_run(self, args)
  if G.GAME.resph_mode == nil then 
	  G.GAME.resph_mode = G.qualatro_resph_mode_loaded
  end

  if not args.savetext then
	  if G.GAME.modifiers.qualatro_seven_challenge then
		  G.GAME.probabilities.normal = 7
		  G.GAME.interest_cap = 7 * 5
		  G.GAME.base_reroll_cost = 7
		  --G.GAME.bankrupt_at = -7
		  for k, v in pairs(G.GAME.hands) do
			G.GAME.hands[k].chips = 7
			G.GAME.hands[k].mult = 7
			G.GAME.hands[k].s_mult = 7
			G.GAME.hands[k].s_chips = 7
			G.GAME.hands[k].l_mult = 7
			G.GAME.hands[k].l_chips = 7
		  end
	  end

	  if G.GAME.modifiers.win_ante then
		  G.GAME.win_ante = G.GAME.modifiers.win_ante
	  end
  end


  return ret
end

local resph = assert(SMODS.load_file('RESPH.lua'))
resph()

G.qualatro_resph_mode_loaded = false
if SMODS.Mods.Qualatro.config.resph_mode then
	G.qualatro_resph_mode_loaded = true
	run_resph()
	return
end

assert(SMODS.load_file('challenges.lua'))()

function UPDATE_ATLAS()
	local _update_jokerpos, _update_atlas = nil, nil
	if SMODS.Mods.Qualatro.config.resph_textures then
		_update_jokerpos = get_resph_jokerpos()
		_update_atlas = 'qualatro_RESPH'
	else
		_update_jokerpos = get_jokerpos()
		_update_atlas = 'qualatro_QualatroJokers'
	end

	for _,j in pairs(resph_jokers) do
		local _joker = G.P_CENTERS['j_qualatro_'..j]
		if _joker then
			_joker.atlas = _update_atlas
			_joker.pos.x = _update_jokerpos[j].x
			_joker.pos.y = _update_jokerpos[j].y

			_joker_soul = _update_jokerpos[j..SOUL]
			if _joker_soul then
				if not _joker.soul_pos then _joker.soul_pos = {x=0,y=0} end
				_joker.soul_pos.x = _joker_soul.x
				_joker.soul_pos.y = _joker_soul.y
			else
				_joker.soul_pos = nil
			end
		end
	end
end

if SMODS.Mods.Qualatro.config.resph_textures then
	-- Not sure why it has to be in an event
	G.E_MANAGER:add_event(Event({
		func = function()
			UPDATE_ATLAS()
			return true
		end
	}))
end

-- local first_shop_jokers = {
--   jokers.jokex,
--   jokers.grand_dad,
--   jokers.coconut_gun,
--   jokers.slip_n_slide,
--   jokers.familiar_photo,
--   jokers.reader,
--   jokers.jerome,
--   jokers.fools_spirit,
--   jokers.christmas_spirit,
--   jokers.inspector_gadget,
--   jokers.ogg,
--   jokers.haruka,
--   jokers.twob,
--   jokers.golden_necklace,
--   jokers.dimensional_cape,
--   jokers.siiva_ai,
--   jokers.genocide_chad,
--   jokers.spectrogram,
-- }

local rarity = {
	COMMON = 1,
	UNCOMMON = 2,
	RARE = 3,
	LEGENDARY = 4,
	-- CONTESTANT = 'qualatro_contestant'
}

local RANKS = {'Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King'}

local PERSON = {
	dda = 'DDA',
	party_rock = '.party_rock',
	psych = 'PsychLantern',
	keeby = 'Keeby',
	zc = '123zc',
	ahmayk = 'Ahmaykmewsik',
	yazawaakios = 'YazawaAkiOS',
	maggie = 'Maggie',
	alan = 'alan',
	blob = 'BigBadBlob',
	bob = 'BobTheTacocat',
	tattleamelia = 'Tattleamelia',
	csg = 'ChickenSuitGuy',				
	lazer = '601billionlazer',
	mth = 'MtH'
}
local P = PERSON
QUALATRO_PERSON = PERSON

local function contains(t, v)
	for _, j in pairs(t) do
		if j == v then
			return true
		end
	end
	return false
end

local function indexof(t, v)
	for i, tv in ipairs(t) do
		if tv == v then
			return i
		end
	end
end

-- Randomize letters in chars to a random other letter in chars
local function randomize(st, chars, chance)
	if chance then
		if pseudorandom("random_chance_"..st) > (G.GAME.probabilities.normal * chance) then
			return st
		end
	end

	local upper_chars = {}
	local lower_chars = {}
	for i,ch in ipairs(chars) do
		upper_chars[i] = string.upper(ch)
		lower_chars[i] = string.lower(ch)
	end

	local ret = ""
	for i=1, #st do
		local ch = st:sub(i,i)
		if not ch then break end
		if contains(upper_chars, ch) then
			ch = string.upper(pseudorandom_element(chars, "random_chance_"..st))
		elseif contains(lower_chars, ch) then
			ch = string.lower(pseudorandom_element(chars, "random_chance_"..st))
		end
		ret = ret..ch
	end
	return ret
end

-- Reset game globals here
function SMODS.current_mod.reset_game_globals(run_start)
    G.susie_cardarea = { cards = {} } 	-- Susie
end

-- JokeXplainer 7000
local function joke_explainer()
	SMODS.Joker {
		key = jokers.jokex,
		atlas = ATLAS,
		pos = jokerpos.jokex,
		loc_txt = {
			name = 'JokeXplainer 7000',
			text = {
				"Unenhanced {C:attention}7{}s",
				"become {C:attention}Steel{} cards",
				"when played",
			}
		},
		config = { extra = {} },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_steel
			return { vars = {} }
		end,
		rarity = rarity.COMMON,
		cost = 3,
		calculate = function(_, card, context)
			if context.before then
				local intriguing
				for k, v in ipairs(context.full_hand) do
					if v:get_id() == 7 and v.config.center == G.P_CENTERS.c_base and not v.debuff and not v.getting_steeled then
						intriguing = true
						v.getting_steeled = true
						G.E_MANAGER:add_event(Event({
							func = function()
								v:set_ability(G.P_CENTERS.m_steel, nil, false)
								v:juice_up()
								v.getting_steeled = false
								return true
							end
						}))
					end
				end
				if intriguing then
					return {
						message = localize('qua_steel'),
						colour = G.C.JOKER_GREY,
						card = card
					}
				end
			end
		end
	}
end

local function susie_force_update_cardarea(card)
	local num_cards = card.ability.extra.deck_hand_size
	local lower_index = #G.deck.cards - num_cards + 1
	if lower_index < 1 then
		lower_index = 1
	end

	G.susie_cardarea.cards = {}
	local j = 1
	for i = #G.deck.cards, lower_index, -1 do
		G.susie_cardarea.cards[j] = G.deck.cards[i]
		j = j + 1
	end
end

-- Susie
local function susie()
	G.susie_cardarea = { cards = {} }

	local function susie_update_cardarea_event(card, adding_susie)
		if not adding_susie and not next(SMODS.find_card(jokerkey.susie)) then
			G.susie_cardarea.cards = {}
		else
			SMODS.drawn_cards = SMODS.drawn_cards or {}
			if #SMODS.drawn_cards > 0 then return false end
			susie_force_update_cardarea(card)
		end
		return true
	end

	SMODS.Joker {
		key = jokers.susie,
		atlas = ATLAS,
		loc_txt = {
			name = 'Susie',
			text = {
				"Trigger {C:attention}held in hand{}",
				"effects for the top",
				"{C:attention}#1#{} cards in deck"
			}
		},
		config = { extra = { deck_hand_size = 5 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.deck_hand_size } }
		end,
		rarity = rarity.RARE,
		pos = jokerpos.susie,
		cost = 8,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			susie_update_cardarea_event(card, true)
		end,
		remove_from_deck = function(_, card, from_debuff)
			susie_update_cardarea_event(card)
		end,
		in_pool = function(_, args)
			return not (G.GAME.used_jokers[jokerkey.haltmann] or next(SMODS.find_card(jokerkey.haltmann)))
		end,
		calculate = function(_, card, context)
			if (context.first_hand_drawn or context.hand_drawn) and not context.blueprint then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.3,
					blockable = false,
					func = function ()
						return susie_update_cardarea_event(card)
					end
				}))
				-- sendDebugMessage("carmds...", "Susie")
			elseif context.end_of_round and not context.individual and not context.repetition then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.3,
					blockable = false,
					func = function ()
						G.susie_cardarea = { cards = {} }
						return true
					end
				}))
				-- sendDebugMessage("no more...", "Susie")
			end
		end
	}
end

---NOTE: (Ahmayk) Gives back a pitch value of the flintstones given the frequency of the scaled sound effect
---melody will be independent for each base_pitch supplied
local _get_granddad_pitch = function(base_pitch)
	local grand_dad_melody = {
		7, 0, 12, 9, 7, 0, 7, 5, 4, 4, 5, 7, 0, 2, 4,
		7, 0, 12, 9, 7, 0, 7, 5, 4, 4, 5, 7, 0, 2, 0,
		11, 4, 12, 11, 11, 9, 9, 11, 9,
		9, 2, 11, 9, 9, 7, 7, 9, 7,
		7, 0, 12, 9, 7, 0, 7, 5, 4, 4, 5, 7, 0, 2,
		4, 5, 7, 0, 2,
		4, 5, 7, 12, 14, 12
	}
	if not G.GAME.grand_dad_melody_index then
		G.GAME.grand_dad_melody_index = {}
	end
	local index = G.GAME.grand_dad_melody_index[base_pitch] or 0
	--NOTE: (Ahmayk) Some bullshit math we have to do to get this to convert to pitch correctly
	---given balatro's weird pitch scaling system.
	---going from "pitch" 1 to 2 is actually just adding 88hz
	---We have to account for both that and the frequency of the sound we're scaling
	local note = (grand_dad_melody[index + 1])
	local desired = base_pitch * (2 ^ (note / 12))
	local pitch = (desired - base_pitch) / 88.0
	G.GAME.grand_dad_melody_index[base_pitch] = (index + 1) % (#grand_dad_melody)
	return pitch
end

local _reset_grand_dad_melodies = function()
	if G.GAME.grand_dad_melody_index then
		for k, v in ipairs(G.GAME.grand_dad_melody_index) do
			G.GAME.grand_dad_melody_index[k] = 0
		end
	end
end

-- Grand Dad
local function grand_dad()
	SMODS.Joker {
		key = jokers.grand_dad,
		pos = jokerpos.grand_dad,
		loc_txt = {
			name = 'Grand Dad',
			text = {
				"Gains {C:red}+#1#{} Mult when each",
				"played {C:attention}7{} is scored,",
				"resets if played hand",
				"doesn't contain a {C:attention}7{}",
				"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
			}
		},
		config = { extra = { bonus = 7 }, mult = 0 },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.bonus, card.ability.mult } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)

			local base_pitch_default = 523.25
			local base_pitch_mult = 329.63

			if context.cardarea == G.jokers and context.before and not context.blueprint and card.ability.mult > 0 then
				local has_seven = false
				for i = 1, #context.full_hand do
					if SMODS.Ranks[context.full_hand[i].base.value].key == "7" then
						has_seven = true
						break
					end
				end
				if not has_seven then
					card.ability.mult = 0
					_reset_grand_dad_melodies()
					return {
						message = localize('k_reset'),
						colour = G.C.RED
					}
				end
			end

			if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card:get_id() == 7 then
				card.ability.mult = card.ability.mult + card.ability.extra.bonus
				card_eval_status_text(card, 'extra', nil, nil, nil,
					{colour = G.C.RED, message = localize('k_upgrade_ex'), pitch=_get_granddad_pitch(base_pitch_default)}
				)
				return nil, true
			elseif context.joker_main and card.ability.mult > 0 then
				local pitch = _get_granddad_pitch(base_pitch_mult)
				return {
					message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
					mult_mod = card.ability.mult,
					pitch = pitch
				}
			end
		end
	}
end

-- Coconut Gun
local function coconut_gun()
	SMODS.Joker {
		key = jokers["coconut_gun"],
		loc_txt = {
			name = 'Coconut Gun',
			text = {
				"Fires {C:chips}#1#{} Chips in spurts",
				"{C:green}#3# in #4#{} chance to fire",
				"{S:0.8}(If not, stores them)",
				"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
			}
		},
		config = { extra = { chips = 100, stored = 0, odds = 3 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips,
				card.ability.extra.stored or 0,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.odds or 0
			}}
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		pos = jokerpos.coconut_gun,
		cost = 4,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				local spurt = pseudorandom('cg') < G.GAME.probabilities.normal / card.ability.extra.odds
				if (card.ability.extra.stored == 0 or not spurt) and not context.blueprint then
					card.ability.extra.stored = card.ability.extra.stored + card.ability.extra.chips
				elseif spurt then
					local ch = card.ability.extra.stored
					card.ability.extra.stored = card.ability.extra.chips
					return {
						message = localize{type='variable',key='a_chips',vars={ch}},
						chip_mod = ch
					}
				end
			end
		end
	}
end

-- Slip n' Slide
local function slip_n_slide()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.slip_n_slide,
		pos = jokerpos.slip_n_slide,
		loc_txt = {
			name = "Slip n' Slide",
			text = {
				"{X:mult,C:white} X#1# {} Mult if played hand",
				"contains exactly {C:attention}1{} card"
			}
		},
		config = { extra = { xmult = 4 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.xmult } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				if #context.full_hand == 1 then
					return {
						message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
						colour = G.C.RED,
						Xmult_mod = card.ability.extra.xmult
					}
				end
			end
		end
	}
end

-- Familiar Photo
local function familiar_photo()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.familiar_photo,
		pos = jokerpos.familiar_photo,
		pixel_size = {
			w = 71,
			h = 80
		},
		loc_txt = {
			name = "Familiar Photo",
			text = {
				"{X:mult,C:white} X#1# {} Mult if there are",
				"exactly {C:attention}3{} other Jokers"
			}
		},
		config = {
			extra = { xmult = 3 }
		},
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.xmult } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				if #G.jokers.cards == 4 then
					return {
						message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
						colour = G.C.RED,
						Xmult_mod = card.ability.extra.xmult
					}
				end
			end
		end
	}
end

-- Reader
local function reader()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.reader,
		pos = jokerpos.reader,
		loc_txt = {
			name = "Reader",
			text = {
				"Played {C:attention}3{}s and {C:attention}4{}s",
				"give {C:chips}+#1#{} Chips",
				"{C:chips,s:0.8}Best {}{C:purple,s:0.8}bro{}{s:0.8} of {}{C:green,s:0.8}Jerome{}"
			}
		},
		no_pool_flag = 'reader_and_jerome_fused',
		config = { extra = { chips = 30, odds = 8 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips } }
		end,
		rarity = rarity.COMMON,
		cost = 3,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 3 or context.other_card:get_id() == 4) then
				return {
					chips = card.ability.extra.chips,
					card = card
				}
			elseif context.ending_shop and not context.blueprint then
				if pseudorandom('readerjeromefusion') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return
				end

				local _,v = next(SMODS.find_card(jokerkey.jerome))

				if v then
					local edition = {}
					if card.edition or v.edition then
						if (card.edition and card.edition.negative) or (v.edition and v.edition.negative) then
							edition.negative = true
						elseif (card.edition and card.edition.polychrome) or (v.edition and v.edition.polychrome) then
							edition.polychrome = true
						elseif (card.edition and card.edition.holo) or (v.edition and v.edition.holo) then
							edition.holo = true
						elseif (card.edition and card.edition.foil) or (v.edition and v.edition.foil) then
							edition.foil = true
						end
					end

					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('slice1')
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = 'after', 
								delay = 0.3, 
								blockable = false,
								func = function()
									G.jokers:remove_card(card)
									card:remove()
									G.E_MANAGER:add_event(Event({
										trigger = 'after',
										delay = 1,
										blockable = false,
										func = function()
											local b = SMODS.create_card({
												set = 'Joker',
												area = G.jokers,
												key = jokerkey.beader_and_berome,
												edition = edition
											})
											if SMODS.is_eternal(card) or SMODS.is_eternal(v) then
												b.ability.eternal = true
											elseif card.ability.perishable or v.ability.perishable then
												b.ability.perishable = true
											end

											if card.ability.rental or v.ability.rental then
												b.ability.rental = true
											end
											b:add_to_deck()
											G.jokers:emplace(b)
											play_sound('holo1')
											card_eval_status_text(b, 'extra', nil, nil, nil, {message = localize("qua_fused_ex"), colour = G.C.PURPLE})
											return true;
										end
									}))
									return true;
								end
							}))

							v.T.r = -0.2
							v:juice_up(0.3, 0.4)
							v.states.drag.is = true
							v.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({
								trigger = 'after', 
								delay = 0.3, 
								blockable = false,
								func = function()
									G.jokers:remove_card(v)
									v:remove()
									return true;
								end
							}))
							return true
						end
					}))
					G.GAME.pool_flags.reader_and_jerome_fused = true
					return {
						message = localize("qua_fused_ex")
					}
				end
			end
		end
	}
end

-- Jerome
local function jerome()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.jerome,
		pos = jokerpos.jerome,
		loc_txt = {
			name = "Jerome",
			text = {
				"Played {C:attention}3{}s and {C:attention}4{}s",
				"give {C:mult}+#1#{} Mult",
				"{C:green,s:0.8}Actual brother{}{s:0.8} of {}{C:chips,s:0.8}Rea{}{C:purple,s:0.8}der{}"
			}
		},
		no_pool_flag = 'reader_and_jerome_fused',
		config = { extra = { mult = 4 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.mult } }
		end,
		rarity = rarity.COMMON,
		cost = 4,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 3 or context.other_card:get_id() == 4) then
				return {
					mult = card.ability.extra.mult,
					card = card
				}
			end
		end
	}
end

local function beader_and_berome()
	-- Beader and Berome
	SMODS.Joker {
		key = jokers.beader_and_berome,
		pos = jokerpos.beader_and_berome,
		soul_pos = jokerpos.beader_and_berome_soul,
		loc_txt = {
			name = "Beader and Berome",
			text = {
				"{C:green}#2# in #1#{} chance to",
				"keep used consumable"
			},
			unlock = {
				"Embrace the power of being",
				"best bros and actual brothers"
			}
		},
		unlocked = false,
		yes_pool_flag = 'never',
		config = { extra = { temp_created = 0, odds = 7 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.odds or 7, G.GAME.probabilities.normal or 1 } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 20,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.qualatro_using_consumeable then
				if pseudorandom('beaderandberome') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return {dont_dissolve = false}
				end
				return {dont_dissolve = true}
			end
		end
	}
end

local function fools_spirit()
	-- Fools' Spirit
	SMODS.Joker {
		key = jokers.fools_spirit,
		pos = jokerpos.fools_spirit,
		loc_txt = {
			name = "Fools' Spirit",
			text = {
				"When {C:attention}Blind{} is selected,",
				"{C:green}#2# in #1#{} chance to create the",
				"last {C:tarot}Tarot{} or {C:planet}Planet{} card",
				"used during this run"
			}
		},
		config = { extra = { odds = 2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.odds or 2, G.GAME.probabilities.normal or 1 } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.setting_blind and not card.getting_sliced then
				if pseudorandom('foolsspirit') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return
				end

				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					if G.consumeables.config.card_limit > #G.consumeables.cards then
						play_sound('timpani')
						local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.last_tarot_planet and G.GAME.last_tarot_planet or "c_fool", 'fools')
						card:add_to_deck()
						G.consumeables:emplace(card)
						card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
					end
					return true end }))
			end
		end
	}
end

-- SiIva
local function siiva()
	SMODS.Joker {
		key = jokers.siivagunner,
		pos = jokerpos.siivagunner,
		soul_pos = jokerpos.siivagunner_soul,
		loc_txt = {
			name = "SiIvaGunner",
			text = {
				"{C:attention}Stone{} cards give",
				"{C:red}+#1#{} Mult and {X:mult,C:white} X#2# {} Mult"
			},
			unlock = {
				"{E:1,s:1.3}?????"
			}
		},
		config = { extra = { mult = 7, xmult = 3 } },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_stone
			return { vars = { card.ability.extra.mult, card.ability.extra.xmult } }
		end,
		rarity = rarity.LEGENDARY,
		unlocked = false,
		atlas = ATLAS,
		cost = 20,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and context.other_card.ability.effect == 'Stone Card' then
				return {
					mult = card.ability.extra.mult,
					x_mult = card.ability.extra.xmult,
					colour = G.C.RED,
					card = card
				}
			end
		end
	}
end

-- 2B
local function twob()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.twob,
		pos = jokerpos.twob,
		loc_txt = {
			name = "2B",
			text = {
				"Retrigger each",
				"played or held",
				"{C:attention}Steel Card{}"
			}
		},
		config = { extra = { } },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_steel
			return { vars = { } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.repetition and not context.repetition_only then
				if SMODS.has_enhancement(context.other_card, 'm_steel') and contains({G.hand, G.play}, context.cardarea) then
					return {
						message = localize("qua_loop_ex"),
						repetitions = 1,
						card = card
					}
				end
			end
		end
	}
end

-- Haruka
local function haruka()
	SMODS.Joker {
		key = jokers.haruka,
		pos = jokerpos.haruka,
		loc_txt = {
			name = "Haruka Amami",
			text = {
				"Retrigger",
				"each played",
				"{C:attention}7{}, {C:attention}6{}, or {C:attention}5{}"
			}
		},
		config = { extra = { } },
		loc_vars = function(_, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.cardarea == G.play and context.repetition and not context.repetition_only then
				if contains({7, 6, 5}, context.other_card:get_id()) then
					return {
						message = localize("k_again_ex"),
						repetitions = 1,
						card = card
					}
				end
			end
		end
	}
end

-- Christmas Spirit
local function christmas_spirit()
	SMODS.Joker {
		key = jokers.christmas_spirit,
		pos = jokerpos.christmas_spirit,
		loc_txt = {
			name = "Christmas Spirit",
			text = {
				"Add {C:money}$#1#{} of {C:attention}sell value",
				"to other {C:attention}Jokers{}",
				"if played hand contains",
				"a {C:attention}Full House",
			}
		},
		config = { extra = { money = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.money } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main and next(context.poker_hands['Full House']) then
				-- local text,_ = G.FUNCS.get_poker_hand_info(context.full_hand)
				-- if text == 'Full House' or text == 'Flush House' then
				local c = context.blueprint_card or card
				local cost_set = false
				for _,other in ipairs(G.jokers.cards) do
					if other ~= c then
						if other.set_cost then
							other.ability.extra_value = (other.ability.extra_value or 0) + card.ability.extra.money
							other:set_cost()
							cost_set = true
						end
					end
				end

				if cost_set then
					return {
						message = localize('k_val_up'),
						colour = G.C.MONEY,
						card = c
					}
				end
			end
		end
	}
end

local function dimensional_cape()
	-- Dimensional Cape
	SMODS.Joker {
		key = jokers.dimensional_cape,
		pos = jokerpos.dimensional_cape,
		loc_txt = {
			name = "Dimensional Cape",
			text = {
				"Played {C:attention}Enhanced{} cards",
				"earn {C:money}$#1#{} when scored",
			}
		},
		config = { extra = { money = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.money } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play then
				if context.other_card.config.center ~= G.P_CENTERS.c_base and not context.other_card.debuff then
					G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
					G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
					return {
						dollars = card.ability.extra.money,
						card = card
					}
				end
			end
		end
	}
end

local function siiva_ai()
	-- SiIva AI
	SMODS.Joker {
		key = jokers.siiva_ai,
		pos = jokerpos.siiva_ai,
		loc_txt = {
			name = "SiIvaGunner AI",
			text = {
				"{C:attention}Stone{} cards are",
				"considered {C:attention}Steel{} cards",
			}
		},
		config = { extra = { xmult = 1.5, chips = 50 } },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_stone
			info_queue[#info_queue+1] = G.P_CENTERS.m_steel
			return { vars = { } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = false,
		calculate = function(_, card, context)
			if context.check_enhancement then
				if not G.qualatro_enhancement_recursion_lock then
					G.qualatro_enhancement_recursion_lock = {}
				end
				if not G.qualatro_enhancement_recursion_lock[jokers.siiva_ai] then
					G.qualatro_enhancement_recursion_lock[jokers.siiva_ai] = true
					local is_stone = SMODS.has_enhancement(context.other_card, 'm_stone')
					G.qualatro_enhancement_recursion_lock[jokers.siiva_ai] = false
					if is_stone then
						return {
							m_steel = true
						}
					end
				end
			end
		end
	}
end

local function calc_min_played()
	local min_played = 99999
	for _,h in pairs(G.GAME.hands) do
		if h.visible and h.played < min_played then
			min_played = h.played
		end
	end
	return min_played
end

local function gadget_and_ogg_get_buffed_bonus(bonus, is_buffed)
	local buffed_bonus = bonus
	if is_buffed then
		buffed_bonus = bonus * 2
	end
	return buffed_bonus
end

local function gadget_apply_hands(card, mod)
	if mod ~= 0 then
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + mod
		ease_hands_played(mod)
		local message_key = 'qua_hand'
		if mod > 1 then
			message_key = 'a_hands'
		elseif mod == -1 then
			message_key = 'qua_hand_minus'
			mod = mod * -1
		elseif mod < -1 then
			message_key = 'qua_hands_minus'
			mod = mod * -1
		end
		card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.BLUE, message = localize{type = 'variable', key = message_key, vars = {mod}}})
	end
end

local function ogg_apply_discards(card, mod)
	if mod ~= 0 then
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + mod
		ease_discard(mod)
		local message_key = 'qua_discard'
		if mod > 1 then
			message_key = 'qua_discards'
		elseif mod == -1 then
			message_key = 'qua_discard_minus'
			mod = mod * -1
		elseif mod < -1 then
			message_key = 'qua_discards_minus'
			mod = mod * -1
		end
		card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = message_key, vars = {mod}}})
	end
end

local function gadget_and_ogg_update_all(min_played, is_buffed)
	for _, card in pairs(G.jokers.cards) do

		if card.config.center.key == jokerkey.inspector_gadget and not card.debuff then
			local extra = min_played * gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed)
			if extra ~= card.ability.extra.extra_hands then
				gadget_apply_hands(card, extra - card.ability.extra.extra_hands)
				card.ability.extra.extra_hands = extra
			end
		end

		if card.config.center.key == jokerkey.ogg and not card.debuff then
			local extra = min_played * gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed)
			if extra ~= card.ability.extra.extra_discards then
				ogg_apply_discards(card, extra - card.ability.extra.extra_discards)
				card.ability.extra.extra_discards = extra
			end
		end
	end
end

local function inspector_gadget()
	-- Inspector Gadget
	SMODS.Joker {
		key = jokers.inspector_gadget,
		pos = jokerpos.inspector_gadget,
		loc_txt = {
			name = "Inspector Gadget",
			text = {
				"{C:blue}+#1#{} hands for each",
				"time the least played",
				"Hand has been played",
				"{C:inactive,s:0.8}(Currently {}{C:blue,s:0.8}+#2#{}{C:inactive,s:0.8} Hands)",
				"{C:purple,s:0.8}#3#{}{C:inactive,s:0.8} #4# {C:attention,s:0.8}Ogg{}"
			}
		},
		config = { extra = { bonus = 1, extra_hands = 0 } },
		loc_vars = function(_, info_queue, card)
			local is_buffed = next(SMODS.find_card(jokerkey.ogg))
			return { vars = {
				gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed),
				card.ability.extra.extra_hands,
				--TODO: (Ahmayk) How to do localization here?
				is_buffed and "Buffed" or "Friends",
				is_buffed and "by" or "with"
			}
		}
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			local min_played = calc_min_played()
			local is_buffed = next(SMODS.find_card(jokerkey.ogg))
			card.ability.extra.extra_hands = min_played * gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed)
			gadget_apply_hands(card, card.ability.extra.extra_hands)
			gadget_and_ogg_update_all(min_played, is_buffed)
		end,
		remove_from_deck = function(_, card, from_debuff)
			gadget_apply_hands(card, -card.ability.extra.extra_hands)
			local is_buffed = next(SMODS.find_card(jokerkey.ogg)) and next(SMODS.find_card(jokerkey.inspector_gadget))
			gadget_and_ogg_update_all(calc_min_played(), is_buffed)
		end,
		calculate = function(_, card, context)
			if context.after then
				gadget_and_ogg_update_all(calc_min_played(), next(SMODS.find_card(jokerkey.ogg)))
			end
		end
	}
end

local function ogg()
	-- Ogg
	SMODS.Joker {
		key = jokers.ogg,
		pos = jokerpos.ogg,
		loc_txt = {
			name = "Ogg",
			text = {
				"{C:red}+#1#{} discards for each",
				"time the least played",
				"Hand has been played",
				"{C:inactive,s:0.8}(Currently {}{C:red,s:0.8}+#2#{}{C:inactive,s:0.8} Discards)",
				"{C:purple,s:0.8}#3#{}{C:inactive,s:0.8} #4# {C:attention,s:0.8}Inspector Gadget{}"
			}
		},
		config = { extra = { bonus = 1, extra_discards = 0 } },
		loc_vars = function(_, info_queue, card)
			local is_buffed = next(SMODS.find_card(jokerkey.inspector_gadget))
			return { vars = {
				gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed),
				card.ability.extra.extra_discards,
				--TODO: (Ahmayk) How to do localization here?
				is_buffed and "Buffed" or "Friends",
				is_buffed and "by" or "with"
			}}
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			local min_played = calc_min_played()
			local is_buffed = next(SMODS.find_card(jokerkey.inspector_gadget))
			card.ability.extra.extra_discards = min_played * gadget_and_ogg_get_buffed_bonus(card.ability.extra.bonus, is_buffed)
			ogg_apply_discards(card, card.ability.extra.extra_discards)
			gadget_and_ogg_update_all(min_played, is_buffed)
		end,
		remove_from_deck = function(_, card, from_debuff)
			ogg_apply_discards(card, -card.ability.extra.extra_discards)
			local is_buffed = next(SMODS.find_card(jokerkey.ogg)) and next(SMODS.find_card(jokerkey.inspector_gadget))
			gadget_and_ogg_update_all(calc_min_played(), is_buffed)
		end,
		calculate = function(_, card, context)
			if context.after then
				gadget_and_ogg_update_all(calc_min_played(), next(SMODS.find_card(jokerkey.inspector_gadget)))
			end
		end
	}
end

local function genocide_chad()
	-- Genocide Chad
	SMODS.Joker {
		key = jokers.genocide_chad,
		pos = jokerpos.genocide_chad,
		loc_txt = {
			name = "Chad Warden",
			text = {
				"After a {C:attention}Blind{} is skipped,",
				"{C:red}destroy{} all other Jokers",
				"at the start of next {C:attention}Blind",
				"and gain {X:mult,C:white} X#1# {} Mult for each",
				"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
			}
		},
		config = { extra = { bonus = 0.5, skipped = false }, x_mult = 1 },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.bonus, card.ability.x_mult } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.skip_blind and not context.blueprint then
				card.ability.extra.skipped = true
				G.E_MANAGER:add_event(Event({
					delay = 0.8,
					func = function()
						card:juice_up(0.8, 0.8)
						card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("qua_loaded"), colour = G.C.RED})
					return true
				end}))
			elseif context.setting_blind and card.ability.extra.skipped then
				card.ability.extra.skipped = false
				local destroyed = 0
				local c = context.blueprint_card or card
				for _,v in ipairs(G.jokers.cards) do
					if v.ability.name == jokerkey.genocide_chad then
						-- no op
					elseif v.ability.name == jokerkey.haruka then
						G.E_MANAGER:add_event(Event({
							delay = 1.6,
							func = function()
							c:juice_up(0.8, 0.8)
							card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize("qua_refused_ex"), colour = G.C.RED})
							return true
						end}))
					elseif SMODS.is_eternal(v) or v.getting_sliced then
						-- no op
					else
						v.getting_sliced = true
						G.E_MANAGER:add_event(Event({func = function()
							c:juice_up(0.8, 0.8)
							v:start_dissolve({G.C.RED}, nil, 1.6)
							return true
						end}))
						destroyed = destroyed + 1
					end
				end

				if destroyed > 0 and not c.getting_sliced then
					card.ability.x_mult = card.ability.x_mult + (card.ability.extra.bonus * destroyed)
					G.E_MANAGER:add_event(Event({
						delay = 1.6,
						func = function()
						card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.x_mult}}})
						return true
					end}))
				end
			end
		end
	}
end

local function golden_necklace()
	-- Golden Necklace
	SMODS.Joker {
		key = jokers.golden_necklace,
		pos = jokerpos.golden_necklace,
		loc_txt = {
			name = "Golden Necklace",
			text = {
				"Each played {C:attention}8{}",
				"gives {C:money}$#1#{} when scored",
			}
		},
		config = { extra = { money = 2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.money } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play then
				if context.other_card:get_id() == 8 and not context.other_card.debuff then
					G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
					G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
					return {
						dollars = card.ability.extra.money,
						card = card
					}
				end
			end
		end
	}
end

local function spectrogram()
	-- Spectrogram
	SMODS.Joker {
		key = jokers.spectrogram,
		pos = jokerpos.spectrogram,
		loc_txt = {
			name = "Spectrogram",
			text = {
				"This Joker gains {C:chips}#2#{} Chips",
				"every time a {C:attention}playing card{}",
				"is added to your deck",
				"{C:inactive}(Currently {C:chips}+#1#{} Chips)",
			}
		},
		config = { extra = { chips = 0, chip_mod = 10 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.playing_card_added and not card.getting_sliced and not context.blueprint and context.cards and context.cards[1] then
				local bonus = #context.cards * card.ability.extra.chip_mod
				card.ability.extra.chips = card.ability.extra.chips + bonus
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {bonus}}, colour = G.C.CHIPS})
				return nil, true
			elseif context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips
				}
			end
		end
	}
end

local function cat_mask()
	-- Cat Mask
	SMODS.Joker {
		key = jokers.cat_mask,
		pos = jokerpos.cat_mask,
		loc_txt = {
			name = "Cat Mask",
			text = {
				"Sell this card to cut",
				"the current {C:attention}Blind{}'s",
				"required {C:chips}Chips{} in {C:attention}half"
			}
		},
		cry_credits = {
			idea = { P.dda },
			art = { P.dda },
			code = { P.zc }
		},

		config = { chips = 0, extra = { bonus = 25 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.chips, card.ability.extra.bonus } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.selling_self and G.GAME.blind then
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "!", colour = G.C.RED})
				local ch = math.floor(G.GAME.blind.chips / 2)
				G.GAME.blind.chips = ch
				G.GAME.blind.chip_text = number_format(ch)
				play_sound('chips1')
				G.hand_text_area.blind_chips:juice_up()
			end
		end
	}
end

local function word_whammer()
	-- Word Whammer
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.word_whammer,
		pos = jokerpos.word_whammer,
		pixel_size = {
			w = 64,
			h = 95
		},
		loc_txt = {
			name = "LeapFrog Word Whammer Fridge Phonics Set",
			text = {
				"{C:red}+#1#{} Mult if scored cards",
				"in hand contains exactly {C:attention}3{}",
				"{C:attention}Aces{} and/or {C:attention}face{} cards"
			}
		},
		cry_credits = {
			idea = {},
			art = { P.party_rock },
			code = {}
		},

		config = { mult = 29 },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.mult } }
		end,
		rarity = rarity.COMMON,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main and context.cardarea == G.jokers and not context.before and not context.after and context.scoring_hand then
				local validCardsCount = 0 
				for i = 1, #context.scoring_hand do
					if (context.scoring_hand[i]:get_id() == 14 and not context.scoring_hand[i].debuff) or context.scoring_hand[i]:is_face() then
						validCardsCount = validCardsCount + 1
					end
				end
				if validCardsCount == 3 then
					return {
						message = localize({ type = "variable", key = "a_mult", vars = { card.ability.mult } }),
						colour = G.C.RED,
						mult_mod = card.ability.mult,
					}
				end
			end
		end
	}
end

local function final_goodbye()
	-- Good Night Undertale
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.final_goodbye,
		pos = jokerpos.final_goodbye,
		loc_txt = {
			name = "Final Goodbye",
			text = {
				"Before {C:red}death{}, gain",
				"{C:blue}+1{} hand and draw",
				"all cards in deck",
				"{S:1.1,C:red,E:2}permanently",
				"{S:1.1,C:red,E:2}self destructs",
			}
		},
		cry_credits = {
			idea = {},
			art = { P.party_rock },
			code = {}
		},

		config = { extra = { triggered = false } },
		loc_vars = function(_, info_queue, card)
			return { vars = {  } }
		end,
		rarity = rarity.RARE,
		cost = 8,
		blueprint_compat = false,
		eternal_compat = false,
		no_pool_flag = 'final_goodbye_triggered',
		calculate = function(_, card, context)
			--NOTE: (Ahmayk) uses custom context.death that triggers when death is detected but before end of round is triggered
			if context.death and not card.ability.extra.triggered then
				card.ability.extra.triggered = true
				ease_hands_played(1, true)
			elseif context.drawing_cards and card.ability.extra.triggered then
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize("qua_good_night"), colour = G.C.RED})
				return {
					cards_to_draw = #G.deck.cards,
					func = function()
						play_sound('tarot1')
						SMODS.destroy_cards(card)
						G.GAME.pool_flags.final_goodbye_triggered = true
						return true
					end
				}
			end
		end
	}
end

local _original_set_cost = Card.set_cost
function Card.set_cost(self)
	local old_cost = self.cost
	_original_set_cost(self)
	if next(SMODS.find_card(jokerkey.hypercam)) and self.config.center.rarity == rarity.COMMON then
		self.cost = 0
	end

	if next(SMODS.find_card(jokerkey.christmas_in_july)) then
		--NOTE: (Ahmayk) these are rounded numbers from hhgreg song 
		if self.cost > 5 then --489
			self.cost = 5
		elseif self.cost > 3 then --299
			self.cost = 3
		elseif self.cost > 1 then --99
			self.cost = 1
		end
	end

	if self.config.center.key == jokerkey.missingno then
		self.cost = -6
	end

  	if G.GAME.modifiers.qualatro_seven_challenge then
		self.cost = 7
	end

	--print("SET COST: " .. self.config.center.name .. " " .. old_cost .. " => " .. self.cost)
end

local function shop_rerun_set_cost()
	G.E_MANAGER:add_event(Event({func = function()
	if G.shop_jokers and G.shop_jokers.cards then
		for _,v in ipairs(G.shop_jokers.cards) do
			v:set_cost()
		end
	end
	if G.shop_vouchers and G.shop_vouchers.cards then
		for _,v in ipairs(G.shop_vouchers.cards) do
			v:set_cost()
		end
	end
	if G.shop_booster and G.shop_booster.cards then
		for _,v in ipairs(G.shop_booster.cards) do
			v:set_cost()
		end
	end
	return true end }))
end

local function hypercam()

	-- Unregistered Hypercam
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.hypercam,
		pos = jokerpos.hypercam,
		loc_txt = {
			name = "Unregistered HyperCam 2",
			text = {
				"all common jokers r free"
			}
		},
		cry_credits = {
			idea = {},
			art = { P.party_rock },
			code = {}
		},

		config = {  },
		loc_vars = function(_, info_queue, card)
			return { vars = {  } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 8,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			shop_rerun_set_cost()
		end,
		remove_from_deck = function(_, card, from_debuff)
			shop_rerun_set_cost()
		end,
		calculate = function(_, card, context)
			-- no op
		end
	}
end

local function christmas_in_july()

	SMODS.Joker {
		key = jokers.christmas_in_july,
		pos = jokerpos.christmas_in_july,
		loc_txt = {
			name = "Christmas in July",
			text = {
					"{C:attention}Everything's on sale!{}",
					"Debuffs when leaving",
					"the {C:attention}shop{} if nothing",
					"was {C:attention}purchased{}",
			}
		},
		config = { extra = { something_bought_this_shop = false } },
		loc_vars = function(self, info_queue, card)
			return { vars = {  }, }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			if not from_debuff then
				card.ability.extra.something_bought_this_shop = true
			end
			shop_rerun_set_cost()
			G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 1 
			calculate_reroll_cost(true)
		end,
		remove_from_deck = function(_, card, from_debuff)
			shop_rerun_set_cost()
			G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
			calculate_reroll_cost(true)
		end,
		calculate = function(_, card, context)
			if ((context.buying_card and not (context.card == card)) or context.open_booster or context.reroll_shop) then
				if not card.ability.extra.something_bought_this_shop then
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_safe_ex")})
				end
				card.ability.extra.something_bought_this_shop = true
			end

			if context.qualatro_start_shop then
				card.ability.extra.something_bought_this_shop = false
				local eval = function(c) 
					return G.STATE ~= G.STATES.BLIND_SELECT and not c.ability.extra.something_bought_this_shop
				end
				juice_card_until(card, eval, true)
			end

				if context.ending_shop then
				if not card.ability.extra.something_bought_this_shop then
					card:juice_up()
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("qua_out_of_buisness_ex")})
					SMODS.debuff_card(card, true, "outofbuisness")
				end
				card.ability.extra.something_bought_this_shop = false
			end
		end
	}
end


local function eight_bit_beast()
	-- 8-Bit Beast
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.eight_bit_beast,
		pos = jokerpos.eight_bit_beast,
		loc_txt = {
			name = "8-Bit Beast",
			text = {
				"Played cards gain",
				"a random {C:attention}Enhancement{}",
				"if hand contains",
				"a {C:attention}Full House"
			}
		},
		cry_credits = {
			idea = {},
			art = { P.party_rock },
			code = {}
		},

		config = {  },
		loc_vars = function(_, info_queue, card)
			return { vars = {  } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 8,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.before and next(context.poker_hands['Full House']) then
				local triggered = false
				for _, v in ipairs(context.full_hand) do
					if not v.debuff then
						local enhancement = G.P_CENTERS[SMODS.poll_enhancement({guaranteed = true})]
						v:set_ability(enhancement, nil, true)
						G.E_MANAGER:add_event(Event({
							func = function()
								v:juice_up()
								return true
							end
						}))
						triggered = true
					end
				end
				if triggered then
					local haunted_house_audio_pattern = {1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 2, 2, 3, 3}
					local index = G.haunted_house_audio_index or 0
					local audio = 'qualatro_hauntedhouse' .. tostring(haunted_house_audio_pattern[index + 1])
					G.haunted_house_audio_index = (index + 1) % (#haunted_house_audio_pattern)
					if context.blueprint then
						audio = audio .. 'b'
					end

					return {
						message = localize("qua_gadunk"),
						colour = G.C.BLUE,
						card = card,
						sound = audio,
						pitch = 1
					}
				end
			end
		end
	}
end

-- Hot Cross Buns
local function hot_cross_buns()
	SMODS.Joker {
		key = jokers.hot_cross_buns,
		pos = jokerpos.hot_cross_buns,
		loc_txt = {
			name = 'Hot Cross Buns',
			text = {
				"Next {C:attention}#2#{} scoring",
				"{C:attention}Aces{} and {C:attention}2{}s",
				"permanently gain {C:money}$#1#{}",
			}
		},
		config = { extra = { money = 1, left = 10 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { 
				card.ability.extra.money,
				card.ability.extra.left,
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and contains({14,2}, context.other_card:get_id()) then
				if not context.blueprint then
					card.ability.extra.left = card.ability.extra.left - 1
				end
				if card.ability.extra.left >= 0 then
					context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) + card.ability.extra.money
					card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {colour = G.C.MONEY, message = localize('k_upgrade_ex')})
					if card.ability.extra.left <= 0 and not context.blueprint then 
						local ret = {}
						ret.func = function()
							SMODS.destroy_cards(card, nil, nil, true)
							card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.MONEY, message = localize('k_eaten_ex')})
						end
						return ret 
					end
					return nil, true
				end
			end
		end
	}
end

local function beta_mix()
	-- Beta Mix
	SMODS.Joker {
		key = jokers.beta_mix,
		pos = jokerpos.beta_mix,
		loc_txt = {
			name = "(Beta Mix)",
			text = {
				"{C:chips}+#1#{} Chips"
			},
		},
		config = { extra = { chips = 40, x_mult = 4 } },
		loc_vars = function(self, info_queue, card)
			if
				card.rank and
				card.rank >= 2 and
				G.jokers and
				#G.jokers.cards >= 2 and
				G.jokers.cards[card.rank - 1].ability.name == 'Joker'
			then
				return { vars = {
					card.ability.extra.chips,
					card.ability.extra.x_mult,
				}, key = self.key..'_alt' }
			else
				return { vars = {
					card.ability.extra.chips,
				} }
			end
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 2,
		blueprint_compat = true,
		calculate = function(_, card, context)
			-- local index = indexof(G.jokers.cards, card)
			if context.joker_main then
				if card.rank >= 2 and G.jokers.cards[card.rank - 1].ability.name == 'Joker' then
					return {
						chips = card.ability.extra.chips,
						x_mult = card.ability.extra.x_mult
					}
				else
					return {
						chips = card.ability.extra.chips
					}
				end
			end
		end
	}
end

local function papyrus()
	-- Papyrus

	local inactive_quips = {
		"NO!!",
		"AUGH!!!",
		"URRRGH!!!",
		"NOOOOOOOO!!!",
		"THAT'S WRONG!",
		"WHAT THE HECK!",
		"HEY!!!",
		"WHAT ARE YOU DOING!!!",
		"JEEZ!!!",
		"OH NO!!!",
		"OH MY GOD!!",
		"WHOOPSIE DOOPSIE!",
		"QUIT MOVING!",
		"UGH!!!",
		"RIDICULOUS!",
		"ZOINKS!!!",
		"UH OH!!!",
		"DO YOU TREAT YOUR MOTHER THIS WAY?!?!??",
		"STOP, HUMAN!!!!",
		"YOU ARE BREAKING MY HEART!!!!",
		"I CAN'T BELIEVE YOU'VE DONE THIS!!!!!!",
	}
	local success_quips = {
		"NYEH HEH HEH!!!",
		"WOWIE!!",
		"YOU DID IT!!!",
		"I'M SO PROUD I COULD CRY!!!",
		"WOW!!!",
		"OHO!",
		"THAT'S THE SPIRIT!",
		"I'LL ALLOW IT!!!!",
		"I'M IMPRESSED!!",
		"(AUDIBLE WINK)",
		"KA-WOWIE!",
	}
	local cheat_quips = {
		"HUH????",
		"EXCUSE ME????",
		"HEY!!!!",
		"S-S-STOP!!!!!!",
		"UM!!!!!!!!!!!!!!!!!!",
		"WHAT!!!!!!",
		"STOP THAT!!!",
		"WHY!!!!",
		"YOU SHOULD NOT DO THAT!!!",
		"HELLO????",
		"WHY YOU!!!!!",
		"STOP!",
		"THAT'S NOT FUNNY!!!",
		"STOP, HUMAN!!!",
		"WHAT ARE YOU DOING!!!!",
	}

	local function papyrus_text(card, message, color, is_extra_quip)
		G.E_MANAGER:add_event(Event({
			trigger = 'before',
			delay = 0.5 + math.random() * 0.4,
			is_papyrus = true,
			func = function()
				if extrafunc then extrafunc() end
				attention_text({
					text = message,
					scale = 0.7,
					--NOTE: (Ahmayk) Cheat a little so that text can be read at fast animation speeds.
					hold = 0.5 + (G.SETTINGS.GAMESPEED * 0.3) + (#message * 0.08),
					backdrop_colour = color,
					align = 'bm',
					major = card,
					offset = {x = 0, y = 0.15*G.CARD_H}
				})
				play_sound('qualatro_papyrus', 1, 0.4)
				if not is_extra_quip then
					local generic_percent = 0.9 + 0.2*math.random()
					play_sound('generic1', 0.8+generic_percent*0.2, volume)
				end
				if is_extra_quip then
					G.GAME.sucks_at_papyrus = false
				end
				card:juice_up(0.6, 0.1)
				G.ROOM.jiggle = G.ROOM.jiggle + 0.7
				return true
			end
		}), 'other')
	end

	local function papyrus_activate(card, is_first_hand)
		local enabling = not card.ability.extra.active
		card.ability.extra.active = true
		if (enabling or is_first_hand) then
			local eval = function(c) return (c.ability.extra.active and not G.RESET_JIGGLES) end
			juice_card_until(card, eval, true)
			if enabling or not card.ability.extra.has_said_active_text_once then
				papyrus_text(card, "NO REORDERING!", G.C.BLUE)
				card.ability.extra.has_said_active_text_once = true
			end
		end
	end

	SMODS.Joker {
		key = jokers.papyrus,
		pos = jokerpos.papyrus,
		loc_txt = {
			name = "Papyrus",
			text = {
				"{C:red}+#1#{} Mult if cards in hand",
				"are not reordered",
				"{C:inactive}(Currently #2#){}",
			}
		},
		config = { mult = 15, extra = { active = true, has_said_active_text_once = false } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.mult,
				G.GAME.blind and card.ability.extra.active and 'Active' or 'Inactive',
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				local bonus = {
					message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
					colour = G.C.RED,
					mult_mod = card.ability.mult
				}

				if card.ability.extra.active then
					return bonus
				end
			end

			if context.first_hand_drawn or context.hand_drawn then
				papyrus_activate(card, context.first_hand_drawn)
			end

			if context.papyrus_mode and not context.blueprint then
				if context.papyrus_mode == 1 and not card.ability.extra.active then
					papyrus_activate(card)
				elseif context.papyrus_mode == 2 and card.ability.extra.active then
					if G.STATE == G.STATES.SELECTING_HAND then
						card.ability.extra.active = false
						local quip = pseudorandom_element(inactive_quips, pseudoseed("papyrus_inactive"))
						G.GAME.sucks_at_papyrus = true
						papyrus_text(card, quip, G.C.RED)
					elseif G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.DRAW_TO_HAND then
						card.ability.extra.active = false
						local quip = pseudorandom_element(cheat_quips, pseudoseed("papyrus_cheat"))
						papyrus_text(card, quip, G.C.RED, true)
					end
				end
			end

			if context.after and card.ability.extra.active and (G.GAME.sucks_at_papyrus or not G.GAME.papyrus_has_said_success_text_once) then
				local quip = pseudorandom_element(success_quips, pseudoseed("papyrus_success"))
				papyrus_text(card, quip, G.C.BLUE, true)
				G.GAME.papyrus_has_said_success_text_once = true
			end
		end,
	}

	local function copy_array(original)
		local copy = {}
		for i = 1, #original do
			copy[i] = original[i]
		end
		return copy
	end
	
	local function arrays_are_equal(arr1, arr2)
		if #arr1 ~= #arr2 then
			return false
		end
		for i = 1, #arr1 do
			if arr1[i] ~= arr2[i] then
				return false
			end
		end
		return true
	end

	local function update_papyrus(mode)
		if G and G.jokers and G.jokers.cards and not G.SETTINGS.paused then
			for i = 1, #G.jokers.cards do
				G.jokers.cards[i]:calculate_joker({papyrus_mode = mode})
			end
		end
	end

	local _original_cardArea_align_cards = CardArea.align_cards
	function CardArea.align_cards(self, discarded_only)
		local pre_align = {}
		local post_align = {}
		if self == G.hand and not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) then
			pre_align = copy_array(self.cards)
		end
		_original_cardArea_align_cards(self, discarded_only)
		if self == G.hand and not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.PLANET_PACK) then
			post_align = copy_array(self.cards)
			if not arrays_are_equal(pre_align, post_align) then
				update_papyrus(2)
			end
		end
	end

	local _original_sort_hand_suit = G.FUNCS.sort_hand_suit
	G.FUNCS.sort_hand_suit = function(e)
		_original_sort_hand_suit(e)
		update_papyrus(1)
	end

	local _original_sort_hand_value = G.FUNCS.sort_hand_value
	G.FUNCS.sort_hand_value = function(e)
		_original_sort_hand_value(e)
		update_papyrus(1)
	end
end

local function lady()
	-- Lady
	SMODS.Joker {
		key = jokers.lady,
		pos = jokerpos.lady,
		loc_txt = {
			name = "Lady",
			text = {
				"Unenhanced cards in hand",
				"become {C:attention}Gold{} if played hand",
				"has exactly three {C:attention}6{}s"
			}
		},
		cry_credits = {
			idea = {},
			art = { P.party_rock },
			code = {}
		},
		config = {  },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_gold
			return { vars = {  } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.before then
				local sixes = 0
				for k, v in ipairs(context.full_hand) do
					if v:get_id() == 6 then
						sixes = sixes + 1
					end
				end
				if sixes == 3 then
					for k, v in ipairs(G.hand.cards) do
						if v.config.center == G.P_CENTERS.c_base --[[and not v.debuff--]] then
							G.E_MANAGER:add_event(Event({
								func = function()
									v:set_ability(G.P_CENTERS.m_gold, nil, false)
									v:juice_up()
									return true
								end
							}))
						end
					end
					return {
						message = next(SMODS.find_card('j_lucky_cat')) and localize("qua_pussy_ex") or localize("qua_yankin_ex"),
						colour = G.C.MONEY,
						card = card
					}
				end
			end
		end
	}
end

local function cryptid_hunt()
	-- Cryptid Hunt
	SMODS.Joker {
		key = jokers.cryptid_hunt,
		pos = jokerpos.cryptid_hunt,
		loc_txt = {
			name = "Cryptid Hunt",
			text = {
				"{C:spectral}Spectral Packs{} appear {C:attention}#1#X{}",
				"more often in the shop",
				"{C:spectral}Cryptid{} is {C:attention}guaranteed{}",
				"in {C:spectral}Spectral Packs{}"
			}
		},
		-- Only one of these will be used, determined by balance.
		-- Multiplier: 3 Cryptid Hunts give 2 x 2 x 2 = 8x rate
		-- Add to Multiplier: 3 Cryptid Hunts give 1 base + 1 + 1 + 1 = 4x rate
		config = { extra = { multiplier = 6, add_to_multiplier = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.multiplier } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = false,
		calculate = function(_, card, context)
			
		end
	}

	SMODS.Booster:take_ownership_by_kind('Spectral', {
		get_weight = function(self)
			if next(SMODS.find_card(jokerkey.cryptid_hunt)) then
				-- Set to false to make effect multiplicative
				local additive = false
				local multiplier = 1
				for _,c in ipairs(SMODS.find_card(jokerkey.cryptid_hunt)) do
					if additive then
						multiplier = multiplier + c.ability.extra.add_to_multiplier
					else
						multiplier = multiplier * c.ability.extra.multiplier
					end
				end
				return self.weight * multiplier
			end

			return self.weight
		end,
		create_card = function(self, card, i)
			if i == 1 and next(SMODS.find_card(jokerkey.cryptid_hunt)) then
				return {set="Spectral", key="c_cryptid", soulable = false, skip_materialize = true}
			else
				return {set="Spectral", soulable = true, skip_materialize = true}
			end
		end
	}, true)
end

local function slider()
	-- Slider
	SMODS.Joker {
		key = jokers.slider,
		pos = jokerpos.slider,
		loc_txt = {
			name = "Slider",
			text = {
				-- "Non-retroactive scaling",
				-- "{C:blue}+Chips{} and {C:red}+Mult{} Jokers have a",
				-- "{C:green}#1# in #2#{} chance to scale again",
				"{C:green}#1# in #2#{} chance to",
				"retrigger a {C:attention}Joker{}",
				"when it gains",
				"{C:blue}+Chips{} or {C:red}+Mult{}"
			}
		},
		config = { extra = { odds = 3 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 10,
		blueprint_compat = true,
		calculate = function(_, card, context)
			--TODO: (Ahmayk) Have this functionality guarenteed to work for any joker 
			--either SMODS.scale_card becomes mandatory for other mods to use and we can do repetitions correctly
			--or we write our own logic detecting if a card's mult or chips have gone up a bit more manually than this
			if context.retrigger_joker_check and not context.retrigger_joker then
				local ocard = context.other_card
				if not (context.other_context and context.other_context.joker_main)
					and context.other_card.ability and ocard.ability.extra
					and
					(			-- +Chips
						(type(ocard.ability.extra) == 'table' and ocard.ability.extra.chips and (ocard.ability.extra.chips ~= 0) and ocard.ability.extra.chip_mod)
						or		-- +Mult
						(ocard.ability.mult ~= 0)
						-- or		-- xMult
						-- ((ocard.ability.x_mult > 1 or (ocard.ability.caino_xmult and (ocard.ability.caino_xmult > 1))) and ocard.ability.name ~= 'Throwback')
					)
					and pseudorandom("slider") < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
					card_eval_status_text(ocard, 'extra', nil, nil, nil, {message = localize("k_again_ex")})
					return {
						repetitions = 1,
					}
				end
			end
		end,
		calc_scaling = function(_, card, other_card, initial, scalar_value, args)
			-- TODO: In theory this is a better approach to detect scaling jokers,
			-- but this is currently limited to changing the scaling value and a few other small effects,
			-- can't insert a repetition because context is missing

			-- if pseudorandom("slider") < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
			-- 	return {
			-- 		post = {
			-- 			message = localize("k_again_ex"),
			-- 		}
			-- 	}
			-- end
		end
	}
end

local function stingy_add_valid_picks(valid_picks, area)
	if area and area.cards then 
		for k, v in pairs(area.cards) do
			if 
				v and
				type(v) == 'table' and
				v.ability and
				v:is(Card) and 
				(v.ability.set == 'Voucher' or v.ability.set == 'Enhanced' or v.ability.set == 'Default' or v.ability.set == 'Joker' or v.ability.consumeable)
			then
				valid_picks[#valid_picks + 1] = v
			end
		end
	end
end

local function stingy_choose()

	local result = nil

	local valid_picks = {}

	if G.STATE == G.STATES.SHOP then 
		stingy_add_valid_picks(valid_picks, G.shop_jokers) 
		stingy_add_valid_picks(valid_picks, G.shop_vouchers) 
		for k, v in pairs(G.shop_booster.cards) do
			valid_picks[#valid_picks + 1] = v
		end
	end

	stingy_add_valid_picks(valid_picks, G.pack_cards) 

	if #valid_picks then
		local takeable_picks = {}
		for k, v in pairs(valid_picks) do

			local is_takeable = false
			if G.STATE == G.STATES.SHOP then
				if v.ability.set == 'Voucher' or
					v.ability.set == 'Enhanced' or 
					v.ability.set == 'Default' or
					v.ability.set == 'Booster' or
					(v.ability.set == 'Joker' and #G.jokers.cards < G.jokers.config.card_limit + ((v.edition and v.edition.negative) and 1 or 0)) or
					(v.ability.consumeable and #G.consumeables.cards < G.consumeables.config.card_limit + ((v.edition and v.edition.negative) and 1 or 0))
				then
					is_takeable = true
				end
			else
				--NOTE: (Ahmayk) assume everything in a booster pack is "takeable"
				--(here take means use actually as we can't take in a booster pack)
				is_takeable = true
			end

			--NOTE: (Ahmayk) but do not pick consumeables we can't use rignt now without selecting anything 
			if v.ability.consumeable and not v:can_use_consumeable(true, true) then
				is_takeable = false
			end

			if is_takeable then
				takeable_picks[#takeable_picks + 1] = v
			end
		end

		--NOTE: (Ahmayk) i f we can't take anything, then try to get something anyway
		--in the shop, we we get the "no space" error
		--in a booster, he'll select it and it will do nothing
		if #takeable_picks == 0 then
			takeable_picks = valid_picks 
		end
		result = pseudorandom_element(takeable_picks, pseudoseed("stingy"))
	end

	return result
end

local function stingy_pitch(card) 
	local pitch = pseudorandom('minepitch') * 0.15 + 0.9
	if card.config.center.key ~= jokerkey.stingy then 
		pitch = pitch + 0.4 
	end
	return pitch
end

local function stingy_sound_mine(card, is_pack_open)
	local pitch = stingy_pitch(card) 
	local audio = 'qualatro_mine1'
	local volume = 0.35

	if is_pack_open and pseudorandom("stingypack") < 0.6 then
		audio = "qualatro_stingy_pack"
		volume = 0.6
	elseif pseudorandom('mineaudio') < 0.8 then
		local sound_index = math.floor((pseudorandom("minewhich") * 12) + 1)
		if sound_index > 4 then
			volume = 0.5
		end
		audio = "qualatro_mine"..sound_index
	end

	play_sound(audio, pitch, volume)
end

local function stingy_sound_miss(card)
	local pitch = stingy_pitch(card) 

	local pitch = stingy_pitch(card) 
	local audio = 'qualatro_stingy_miss1'
	local volume = 0.5

	if pseudorandom("stingywrong") < 0.07 then
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = (pseudorandom('stingymissdelay') * 0.5) + 2.0,
			func = function()
				play_sound("qualatro_stingy_wrong", pitch, volume)
				return true 
			end 
		}))
	elseif pseudorandom("stingydelay") < 0.5 then
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = (pseudorandom('stingymissdelay') * 0.5) + 1.2,
			func = function()
				local sound_index = math.floor((pseudorandom("minewhich") * 3) + 1)
				audio = "qualatro_stingy_missdelay"..sound_index
				play_sound(audio, pitch, volume)
				return true 
			end 
		}))
	else
		local sound_index = math.floor((pseudorandom("minewhich") * 3) + 1)
		audio = "qualatro_stingy_miss"..sound_index
		play_sound(audio, pitch, volume)
	end
end

local function stingy_end()
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		func = function()
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				func = function()
					G.qualatro_active_stingy = nil
					G.CONTROLLER.locks.use = false 
					return true 
				end 
			}))
			return true 
		end 
	}))
end

local check_for_buy_space_no_alert = function(card)
  if card.ability.set ~= 'Voucher' and
    card.ability.set ~= 'Enhanced' and
    card.ability.set ~= 'Default' and
        not (card.ability.set == 'Joker' and #G.jokers.cards < G.jokers.config.card_limit + card.ability.card_limit - card.ability.extra_slots_used) and
        not (card.ability.consumeable and #G.consumeables.cards < G.consumeables.config.card_limit + card.ability.card_limit - card.ability.extra_slots_used) then
    return false
  end
  return true
end

local function stingy_buy(card, to_buy) 
	--print("\nBUYING: " .. to_buy.config.center.name)

	local should_buy = false 
	local should_use = false 
	local has_space = check_for_buy_space_no_alert(to_buy)

	--NOTE: (Ahmayk) vouchers and consumeables must be used 
	if to_buy.ability.set == "Voucher" or to_buy.ability.consumeable then
		should_use = true 
	end

	if G.STATE == G.STATES.SHOP then
		should_buy = true 
		--NOTE: (Ahmayk) If there room for the consumeable buy it, don't use it
		if to_buy.config.center.consumeable then
			should_buy = has_space 
			should_use = not has_space 
		end
	else
		--NOTE: (Ahmayk) this codepath is called if we are in a booster pack
		--always "use" in boosters, regardless of what it is
		should_use = true

		--NOTE: (Ahmayk) except if it's a joker, jokers should be bought
		--"using" here progresses the booster pack state, we only want to do this
		--if there is room to buy the joker
		if to_buy.ability.set == "Joker" then
			should_buy = true 
			should_use = has_space 
		end
	end

	--NOTE: (Amayk) only use consumeable if we can't buy and
	--the game tells us we can use it right now
	if 
		to_buy.config.center.consumeable and
		not should_buy and
		should_use and
		not to_buy:can_use_consumeable(true, true)
	then
		should_use = false
	end

	card:juice_up(0.3, 0.5)
	if should_buy then
		if should_use then
			G.FUNCS.buy_from_shop({config={ref_table=to_buy, id = 'buy_and_use'}})
		else
			G.FUNCS.buy_from_shop({config={ref_table=to_buy}})
		end
	else 
		if should_use then
			G.FUNCS.use_card({config={ref_table=to_buy}})
		else
			play_sound('cancel', 1.0, 0.5)
			to_buy:juice_up()
		end
	end

	--print(to_buy.config.center.name .. ": should_buy: " .. tostring(should_buy) .. " should_use: " .. tostring(should_use))

	if (should_buy and has_space) or should_use then
		play_sound('tarot1')
		if to_buy.cost >= 10 then
			local pitch = stingy_pitch(card)
			play_sound('qualatro_stingy_best', pitch, 0.5)
		end
		stingy_sound_mine(card)
		to_buy:add_sticker("qualatro_stingy", true)
	else
		stingy_sound_miss(card)
	end

	stingy_end()
end

local function stingy_highlight(card, to_buy)
	G.E_MANAGER:add_event(Event({
		trigger = 'after',
		delay = 1,
		func = function()
			if to_buy.area then
				card:juice_up(0.3, 0.5)
				to_buy.area:add_to_highlighted(to_buy)
			end
			return true 
		end 
	}))
end

function stingy_start(card)
	local to_buy = stingy_choose()
	if to_buy then

		--NOTE: (Ahmayk) have to block input!
		G.CONTROLLER.locks.use = true

		stingy_highlight(card, to_buy)

		if to_buy.ability.set == 'Booster' then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1.3,
				func = function()
					card:juice_up(0.3, 0.5)
					stingy_sound_mine(card, true)
					G.FUNCS.use_card({config={ref_table=to_buy, 'buy_and_use' }})
					return true 
				end 
			}))
		else
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1,
				func = function()
					stingy_buy(card, to_buy)
					return true 
				end 
			}))
		end
	else
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 1,
			func = function()
				local pitch = stingy_pitch(card)
				play_sound('qualatro_stingy_dont', pitch, 0.5)
				card:juice_up(0.3, 0.5)
				stingy_end()
				return true 
			end 
		}))
	end
end

local function stingy()

	SMODS.Joker {
		key = jokers.stingy,
		pos = jokerpos.stingy,
		loc_txt = {
			name = "Stingy",
			text = {
				"When entering the {C:attention}shop{},",
				"something in it becomes {C:money}his{}",
				"{C:inactive}(Must have room){}",
			}
		},
		config = { extra = { queued_this_shop = false } },
		loc_vars = function(_, info_queue, card)
			return { vars = {} }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		add_to_deck = function(_, card, from_debuff)
			G.stingy_is_present = true
		end,
		load = function(_, card, card_table, other_card)
			G.stingy_is_present = true
		end,
		remove_from_deck = function(_, card, from_debuff)
			if not next(SMODS.find_card(jokerkey.stingy)) then
				G.stingy_is_present = false
			end
		end,
		calculate = function(_, card, context)
			local card_to_notify = context.blueprint_card or card
			if context.shop_loaded and not card.ability.extra.queued_this_shop then

				if not G.qualatro_stingy_queue then
					G.qualatro_stingy_queue = {}
				end
				G.qualatro_stingy_queue[#G.qualatro_stingy_queue + 1] = card_to_notify
				if not context.blueprint_card then
					card.ability.extra.queued_this_shop = true
				end
				--NOTE: (Ahmayk) global update function handles starting off stingy queue
			end
			if context.end_of_round then
				card.ability.extra.queued_this_shop = false 
			end
			if context.open_booster and G.qualatro_active_stingy == card_to_notify then
				--NOTE: (Ahmayk) have to block input!
				G.CONTROLLER.locks.use = true

				if pseudorandom("stingydelay") < 0.2 then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = (pseudorandom('stingymissdelay') * 0.5) + 1.2,
						func = function()
							local pitch = stingy_pitch(card)
							play_sound('qualatro_stingy_woah', pitch, 0.5)
							return true 
						end 
					}))
				end

				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								local to_buy = stingy_choose()
								if to_buy then

									stingy_highlight(card, to_buy)

									G.E_MANAGER:add_event(Event({
										trigger = 'after',
										delay = 1.3,
										func = function()
											stingy_buy(card_to_notify, to_buy)
											return true 
										end 
									}))
								else
									stingy_end()
								end
								return true 
							end 
						}))
						return true 
					end 
				}))
			end
		end
	}

	SMODS.Sticker {
		key = "stingy",
		loc_txt = {
			name = "Stingy's Card",
			text = {"This card", "is {C:attention}MINE!{}"}
		},
		atlas = "QualatroStickers",
		pos = { x = 0, y = 0 },
		sets = {
			Joker = true,
			Tarot = true,
			Spectral = true,
			base = true
		},
		default_compat = true,
		badge_colour = HEX('EEBA64')
	}
end

local _super_wipe_on = G.FUNCS.wipe_on
G.FUNCS.wipe_on = function(message, no_card, timefac, alt_colour)
	if G.stingy_is_present then
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.1,
			func = function()
				play_sound('qualatro_stingy_stop', 1, 0.5)
				G.stingy_is_present = false
				return true 
			end 
		}))
	end
	_super_wipe_on(message, no_card, timefac, alt_colour)
end

local function get_lucky()
	SMODS.Joker {
		key = jokers.get_lucky,
		pos = jokerpos.get_lucky,
		loc_txt = {
			name = "Get Lucky",
			text = {
				"{C:green}#2# in #1#{} chance to",
				"retrigger {C:attention}Lucky{} cards"
			}
		},
		config = { extra = { odds = 2 } },
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
			return { vars = { card.ability.extra.odds or 2, G.GAME.probabilities.normal or 1 } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.repetition and not context.repetition_only then
				if pseudorandom('getlucky') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return;
				end
				if SMODS.has_enhancement(context.other_card, 'm_lucky') then
					return {
						message = localize('qua_got_lucky_ex'),
						repetitions = 1,
						card = card
					}
				end
			end
		end
	}
end

local function antonymph()
	SMODS.Joker {
		key = jokers.antonymph,
		pos = jokerpos.antonymph,
		loc_txt = {
			name = "The Antonymph",
			text = {
				"{C:attention}Jokers{} and scored cards",
				"with {C:dark_edition}Editions{}",
				"give {C:chips}+#1#{} Chips"
			}
		},
		config = { extra = { chips = 60} },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips,
			}}
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and context.other_card.edition then
				return {
					chips = card.ability.extra.chips,
					colour = G.C.CHIPS,
					card = card,
				}
			end
			if context.other_joker and context.other_joker.edition then
				return {
					chips = card.ability.extra.chips,
					colour = G.C.CHIPS,
				}
			end
		end
	}
end

local function haltmann()
	-- Haltmann's Bill
	SMODS.Joker {
		key = jokers.haltmann,
		pos = jokerpos.haltmann,
		loc_txt = {
			name = "Haltmann's Bill",
			text = {
				"Earn {C:money}Blind reward{}",
				"{C:money}money{} again",
			}
		},
		config = { },
		loc_vars = function(_, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = false,
		calc_dollar_bonus = function(self, card)
			local bonus = math.floor((G.GAME.blind.dollars or 0))
			if bonus > 0 then
				return bonus
			end
		end,
		in_pool = function(_, args)
			return not (G.GAME.used_jokers[jokerkey.susie] or next(SMODS.find_card(jokerkey.susie)))
		end
	}
end

local function ride_the_raft()
	-- Ride the Raft 
	SMODS.Joker {
		key = jokers.ride_the_raft,
		pos = jokerpos.ride_the_raft,
		loc_txt = {
			name = "Ride the Raft",
			text = {
				"This Joker gains {C:chips}+#2#{} Chips",
				"per {C:attention}consecutive{} hand",
				"played without a",
				"scoring {C:attention}face{} card",
				"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
			}
		},
		config = { extra = { chips = 0, chip_mod = 6 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.before and not context.blueprint then
				local faces = false
				for i = 1, #context.scoring_hand do
					if context.scoring_hand[i]:is_face() then
						faces = true
						break
					end
				end
				if faces then
					local last_chips = card.ability.extra.chips
					card.ability.extra.chips = 0
					if last_chips > 0 then
						return {
							card = card,
							message = localize('k_reset')
						}
					end
				else
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
					return nil, true
				end
			end

			if (context.joker_main or context.retrigger_joker) and card.ability.extra.chips > 0 then
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips
				}
			end
		end
	}
end

local function get_missing_ranks()

	local missing_ranks_array = {}
	if G.GAME and G.playing_cards and #G.playing_cards > 0 then
		local ranksInDeck = {}
		for _, rank in ipairs(SMODS.Rank.obj_buffer) do
			ranksInDeck[rank] = false
			for _, playing_card in ipairs(G.playing_cards) do
				if playing_card.base.value == rank and not SMODS.has_no_rank(playing_card) then
					ranksInDeck[rank] = true
					break
				end
			end
		end

		for _, rank in ipairs(SMODS.Rank.obj_buffer) do
			if not ranksInDeck[rank] then
				table.insert(missing_ranks_array, rank)
			end
		end
	end

	return missing_ranks_array
end

local function update_lost_media(card, missing_ranks_array, is_notify)
	local xmult = 1 + (#missing_ranks_array * card.ability.extra.xmult_scale)
	if card.ability.extra.xmult ~= xmult then
		card.ability.extra.xmult = xmult
		if #missing_ranks_array > 0 then
			card.ability.extra.missing_ranks_string = table.concat(missing_ranks_array, ", ")
		else
			card.ability.extra.missing_ranks_string = "None"
		end
		if (is_notify) then
			card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}})
		end
	end

end

local function lost_media()

	SMODS.Joker {
		key = jokers.jokex_lost_media,
		pos = jokerpos.jokex_lost_media,
		loc_txt = {
			name = "Lost Media",
			text = {
				"This Joker gains {X:mult,C:white} X#1# {} Mult for",
				"every {C:attention}rank{} missing from your deck",
				"{C:inactive}(Currently{} {X:mult,C:white} X#2# {} {C:inactive}Mult){}",
				-- "{C:inactive,s:0.8}(Missing ranks: #3#){}",
				-- "This Joker is {C:red,E2}permanently removed{}",
				-- "from the shop when obtained",
			}
		},
		config = { extra = {
			xmult_scale = 0.5,
			xmult = 1,
			missing_ranks_string = "None",
		} },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.xmult_scale,
				card.ability.extra.xmult,
				card.ability.extra.missing_ranks_string or "None"
			} }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		set_ability = function(self, card, initial, delay_sprites)
			local missing_ranks = get_missing_ranks()
			update_lost_media(card, missing_ranks, false)
		end,
		calculate = function(_, card, context)
			if context.joker_main and card.ability.extra.xmult > 1 then
				return {
					message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
					colour = G.C.RED,
					Xmult_mod = card.ability.extra.xmult
				}
			end
		end
		--NOTE(Ahmayk): updating is handled in update function that runs every frame
	}
end

local function king_for_eternity()
	SMODS.Joker {
		key = jokers.king_for_eternity,
		pos = jokerpos.king_for_eternity,
		loc_txt = {
			name = "King for Eternity",
			text = {
				"Jokers with {C:dark_edition}editions{}",
				"give {X:mult,C:white} X#1# {} Mult",
				"and {C:attention}cannot be sold{}"
			}
		},
		config = { extra = { x_mult = 1.5 }},
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.x_mult } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 9,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.other_joker and context.other_joker.edition ~= nil then
				return {
					xmult = card.ability.extra.x_mult
				}
			end
		end
	}

end

local function galaxia()
	SMODS.Joker {
		key = jokers.galaxia,
		pos = jokerpos.galaxia,
		loc_txt = {
			name = "Galaxia",
			text = {
				"This Joker gains {X:mult,C:white} X#2# {} Mult",
				"when {C:attention}Boss Blind{} is defeated",
				"{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
			}
		},

		config = { x_mult = 1, extra = { xmult_scale = 0.5, } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.x_mult,
				card.ability.extra.xmult_scale,
			}}
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker and G.GAME.blind.boss then
				card.ability.x_mult = card.ability.x_mult + card.ability.extra.xmult_scale
				card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize('k_upgrade_ex')})
				return nil, true
			elseif context.joker_main and card.ability.x_mult > 1 then
				return {
					message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
					colour = G.C.RED,
					Xmult_mod = card.ability.x_mult
				}
			end
		end
	}
end

local function smashup()
	SMODS.Joker {
		key = jokers.smashup,
		pos = jokerpos.smashup,
		loc_txt = {
			name = 'SmashUp!',
			text = {
				"This {C:attention}Joker{} gains {C:red}+#1#{} Mult",
				"for every consumable {C:attention}sold{}",
				"during a {C:attention}Blind{}",
				"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
			}
		},
		config = { extra = { bonus = 3 }, mult = 0 },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.bonus, card.ability.mult } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)

			if context.selling_card and not context.blueprint and context.card.config.center.consumeable and G.STATE == G.STATES.SELECTING_HAND then
				card.ability.mult = card.ability.mult + card.ability.extra.bonus
				card_eval_status_text(card, 'extra', nil, nil, nil,
					{colour = G.C.RED, message = localize('k_upgrade_ex')}
				)
				return nil, true
			end

			if context.joker_main and card.ability.mult > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
					mult_mod = card.ability.mult,
				}
			end
		end
	}
end

local function othello_world()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.othello_world,
		pos = jokerpos.othello_world,
		loc_txt = {
			name = "Othello World",
			text = {
				"{X:mult,C:white} XMult {} equal to",
				"base {C:chips}Chips{} multiplier",
				"of current {C:attention}Blind{}",
				"{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
			}
		},
		config = { extra = { } },
		loc_vars = function(_, info_queue, card)
			local mult = 1
			if G.GAME and G.GAME.blind and G.GAME.blind.mult > 1 then
				mult = G.GAME.blind.mult
			end
			return { vars = { mult } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main and G.GAME.blind.mult > 1 then
				return {
					message = localize{type='variable',key='a_xmult',vars={G.GAME.blind.mult}},
					colour = G.C.RED,
					Xmult_mod = G.GAME.blind.mult
				}
			end
		end
	}
end

-- 1, 2, Joker!
local function onetwo_jump()
	SMODS.Joker {
		key = jokers.onetwo_jump,
		pos = jokerpos.onetwo_jump,
		loc_txt = {
			name = '1, 2, Joker!',
			text = {
				"Played {C:attention}Aces{} and {C:attention}2{}s",
				"give {X:mult,C:white} X#1# {} Mult",
			}
		},
		config = { extra = { xmult = 1.25 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.xmult } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play then
				if context.other_card:get_id() == 14 or context.other_card:get_id() == 2 and not context.other_card.debuff then
					return {
						message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
						colour = G.C.RED,
						Xmult_mod = card.ability.extra.xmult
					}
				end
			end
		end
	}
end

local function gegagedigedagedago()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.gegagedigedagedago,
		pos = jokerpos.gegagedigedagedago,
		loc_txt = {
			name = "Gegagedigedagedago",
			text = {
				"At end of hand, {C:green}#2# in #1#{}",
				"chance to add a random",
				"{C:dark_edition}edition{} to any random card",
				"{S:1.1,C:red,E:2}self destructs{}",
			}
		},
		config = { extra = { odds = 4 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.odds or 4, G.GAME.probabilities.normal or 1 } }
		end,
		rarity = rarity.COMMON,
		cost = 4,
		blueprint_compat = true,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.after then
				local card_to_notify = context.blueprint_card or card
				if pseudorandom('gegagedigedagedadie') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return
				end

				local triggered = false

				G.E_MANAGER:add_event(Event({
					trigger = "before",
					delay = 0.3,
					func = function()
						local visible_cards = {}
						for _, v in pairs(G.jokers.cards) do
							if v.ability.set == "Joker" and not v.edition and not v.getting_sliced then
								table.insert(visible_cards, v)
							end
						end
						for _, v in pairs(G.hand.cards) do
							if not v.edition and not v.getting_sliced then
								table.insert(visible_cards, v)
							end
						end
						for _, v in pairs(G.consumeables.cards) do
							if not v.edition and not v.getting_sliced then
								table.insert(visible_cards, v)
							end
						end

						if #visible_cards > 0 then
							local eligible_card = pseudorandom_element(visible_cards, pseudoseed("gegagedigedagedarandomjoker"))
							-- print(eligible_card.config.center.key.." "..eligible_card.rank)

							--NOTE: (Ahmayk) cards are only given editions which are possible for that card type in vanilla balatro
							--So consumbealbes can only be negative and playing cards cannot be negative
							local random_edition = nil
							if eligible_card.config.center.consumeable then
								random_edition = G.P_CENTERS.e_negative
							else
								while
									random_edition == nil or
									random_edition.key == "e_base" or
									((eligible_card.ability.set == "Default" or eligible_card.ability.set == "Enhanced") and random_edition.key == "e_negative")
								do
									random_edition = pseudorandom_element(G.P_CENTER_POOLS.Edition, pseudoseed("gegagedigedagedarandomedition"))
								end
							end

							card_eval_status_text(eligible_card, 'extra', nil, nil, nil, {message = localize("qua_helped_ex"), colour = G.C.RED, instant=true })
							eligible_card:set_edition({ [random_edition.key:sub(3)] = true }, true)
							card_to_notify:juice_up();

							triggered = true
							card_to_notify.getting_sliced = true
							return true
						else
							card_eval_status_text(card_to_notify, 'extra', nil, nil, nil, {message = localize("qua_help_me"), colour = G.C.RED, sound = 'qualatro_HELP_ME' })
							return true
						end
					end
				}))

				G.E_MANAGER:add_event(Event({
					trigger = "before",
					delay = 0.3,
					func = function()
						if (triggered) then
							card_to_notify.getting_sliced = false
							SMODS.destroy_cards(card_to_notify, nil, nil, true)
							card_eval_status_text(card_to_notify, 'extra', nil, nil, nil, {message = localize("qua_wh"), colour = G.C.RED, sound='qualatro_WHAT_REVERB'})
						end
						return true
					end
				}))
			end
		end
	}
end

local function nico_nico()

	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.nico_nico,
		pos = jokerpos.nico_nico,
		--NOTE: (Ahmayk) Stretch goal: have this info be displayed in the balatro japanese font with japanese title
		loc_txt = {
			name = "Nico Nico",
			text = {
				"{C:tarot}Tarot{} cards that",
				"{C:attention}enhance{} or {C:attention}convert{}",
				"can select {C:attention}+1{} card",
				"{C:inactive,s:0.7}(Death and Hanged Man excluded)",
			}
		},
		config = { extra = { } },
		loc_vars = function(_, info_queue, card)
			return { vars = {  } }
		end,
		rarity = rarity.RARE,
		cost = 4,
		blueprint_compat = false,
		calculate = function(_, card, context)

		end,
		--NOTE: (Ahmayk) ability is applied in hooked update function
	}
end

local function poke_party()
	local function get_poke_party_chips(card)
		return (G.GAME and G.GAME.poke_party_joker_usage) and (#G.GAME.poke_party_joker_usage * card.ability.extra.chips_mod) or 0
	end

	-- Poké Party
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.poke_party,
		pos = jokerpos.poke_party,
		loc_txt = {
			name = "Poké Party",
			text = {
				"{C:chips}+#1#{} Chips per {C:attention}unique{}",
				"Joker acquired this run",
				"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}",
			}
		},
		config = { extra = { chips_mod = 5 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips_mod,
				get_poke_party_chips(card),
			} }
		end,
		rarity = rarity.UNCOMMON,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				return {
					message = localize{type='variable',key='a_chips',vars={get_poke_party_chips(card)}},
					chip_mod = get_poke_party_chips(card),
				}
			end
		end,
	}

	local _original_card_add_to_deck = Card.add_to_deck
	function Card.add_to_deck(self, from_debuff)
		_original_card_add_to_deck(self, from_debuff)
		if self.ability.set == "Joker" and G.GAME then
			G.GAME.poke_party_joker_usage = G.GAME.poke_party_joker_usage or {}
			local already_acquired = false
			for i = 1, #G.GAME.poke_party_joker_usage do
				if G.GAME.poke_party_joker_usage[i] == self.ability.name then
					already_acquired = true
				end
			end
			if not already_acquired then
				G.GAME.poke_party_joker_usage[#G.GAME.poke_party_joker_usage + 1] = self.ability.name
				if G.jokers and G.jokers.cards and not G.SETTINGS.paused then
					for _, v in pairs(SMODS.find_card(jokerkey.poke_party)) do
						card_eval_status_text(v, "extra", nil, nil, nil, {
							message = localize({type = "variable", key = "a_chips", vars = {get_poke_party_chips(v)}}),
							colour = G.C.CHIPS,
						})
					end
				end
			end
		end
	end
end

local function reverb()
	-- Reverberation
	SMODS.Joker {
		key = jokers.reverb,
		pos = jokerpos.reverb,
		loc_txt = {
			name = 'Reverberation',
			text = {
				"{C:attention}Final{} played scoring card has a",
				"{C:green}#1# in #2#{} chance to retrigger",
				"{C:green,s:0.7}#1# in #3#{}{C:inactive,s:0.7} chance to retrigger{}",
				"{C:green,s:0.5}#1# in #4#{}{C:inactive,s:0.5} chance to retrigger{}",
				"{C:green,s:0.3}#1# in #5#{}{C:inactive,s:0.3} chance to retrigger{}",
				"{C:green,s:0.1}#1# in #6#{}{C:inactive,s:0.1} chance to retrigger{}",
			}
		},
		config = { extra = { base_odds = 2 } },
		loc_vars = function(_, info_queue, card)
			local odds = math.max(card.ability.extra.base_odds, 1 + 1e-5)
			return { vars = {
				G.GAME.probabilities.normal or 1,
				odds,
				odds ^ 2,
				odds ^ 3,
				odds ^ 4,
				odds ^ 5,
			} }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.cardarea == G.play and context.repetition and not context.repetition_only
				and context.other_card == context.scoring_hand[#context.scoring_hand] then
				local odds = math.max(card.ability.extra.base_odds, 1 + 1e-5)
				local prob = G.GAME.probabilities.normal or 1
				local roll = pseudorandom("reverb")
				local repetitions = math.floor(-math.log(roll / prob, odds))

				-- e.g. odds = 2, prob = 1
				-- roll = 0.23
				-- roll < 0.25 = 1/2^2 -> retrigger at least 2 times
				-- roll > 0.125 = 1/2^3 -> do not retrigger at least 3 times
				-- -> number of retrigger is floor(-log2(0.23/1)) = 2

				if repetitions > 0 then
					return {
						message = localize('k_again_ex'),
						repetitions = repetitions,
						card = card,
						sound = 'qualatro_genericreverb'
					}
				end
			end
		end,
	}
end

local function gadget_room()
	-- Gadget Room
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.gadget_room,
		pos = jokerpos.gadget_room,
		loc_txt = {
			name = "Gadget Room",
			text = {
				"Cards in {C:attention}first hand{}",
				"of round return to {C:attention}deck{}",
			}
		},
		config = { extra = { died = false } },
		loc_vars = function(self, info_queue, card)
			return { vars = { }, key = self.key .. (next(SMODS.find_card('j_popcorn')) and '_alt' or '') }
		end,
		rarity = rarity.UNCOMMON,
		cost = 7,
		blueprint_compat = false,
		calculate = function(_, card, context)
			if context.popcorn_exploded and not context.blueprint and not SMODS.is_eternal(card) then
				return {
					message = "Destroyed!",
					colour = G.C.RED,
					func = function()
						play_sound('tarot1')
						SMODS.destroy_cards(card)
						return true; 
					end
				}
			end
		end,
	}

	local _original_draw_from_play_to_discard = G.FUNCS.draw_from_play_to_discard
	G.FUNCS.draw_from_play_to_discard = function(e)
		if next(SMODS.find_card(jokerkey.gadget_room)) and G.GAME.current_round.hands_played == 0 then
			local play_count = #G.play.cards
			local it = 1
			for k, v in ipairs(G.play.cards) do
				if (not v.shattered) and (not v.destroyed) then 
					draw_card(G.play,G.deck, it*100/play_count,'down', false, v)
					it = it + 1
				end
			end
			G.deck:shuffle('gadget_room')
			for _, v in pairs(SMODS.find_card(jokerkey.susie)) do
				susie_force_update_cardarea(v)
			end
		else
			_original_draw_from_play_to_discard(e)
		end
	end
end

local function missingno()
	local codes = assert(SMODS.load_file('MCodes.lua'))
	
	if is_debug then
		function m(index)
			local missingnos = SMODS.find_card(jokerkey.missingno)
			if #missingnos > 0 then
				local ret = codes()[index](missingnos[1], nil)
				print(ret)
			else
				print("No missingno found!")
			end
		end
	end

	function repeat_code(ret, code, card, context, num)
		for i = 1, num do
			local retNew = code(card, context) 
			if type(ret) == 'table' and type(retNew) == 'table' then
				ret = SMODS.merge_effects(ret, retNew)
			end
		end
		return ret
	end

	SMODS.Shader {
		key = 'glitched',
		path = 'glitched.fs'
	}

	SMODS.Rarity {
		key = "bird",
		loc_txt = {
			name = "Bird",
		},
		pools = { ["Joker"] = true },
		default_weight = 0.002,
	}

	SMODS.Atlas {
		key = "M",
		path = "M.png",
		px = 71,
		py = 95
	}	

    for i=1,8 do
		local k = 'm_'..tostring(i)
		SMODS.JimboQuips[k] = {
			key = k, 
			type = 'missingno',
			play_sounds =  function(n)
				play_sound('voice'..math.random(1, 11), G.SPEEDFACTOR*(math.random()*0.2+0.2), 0.9)
			end
		} 
    end

	local function random_colour(key)
		local colour = pseudorandom_element(G.C, "missingno_colour_"..key)
		while (type(colour[1]) ~= "number") do
			colour = pseudorandom_element(G.C, "missingno_colour_"..key)
		end
		return colour
	end

	local function random_int(key)
		return math.ceil(G.GAME.probabilities.normal / pseudorandom("missingno_number_"..key))
	end

	local function random_int_or_translation(key)
		if (pseudorandom(key.."_int_or_translation") > (G.GAME.probabilities.normal*0.03)) then
			return random_int(key)
		else
			return pseudorandom_element(G.localization.misc.dictionary, key..'_word')
		end
	end

	SMODS.Joker {
		key = jokers.missingno,
		pos = {x=1,y=0},
		soul_pos = {x=3,y=1},
		loc_txt = {
			name = 'MissingNo.',
			text = {}
		},
		config = { extra = { 
			base_odds = 1,
			fuzz_amount = 7,
			play_limit_delta = 0,
		} },
		loc_vars = function(_, info_queue, card)
			local lines = {}
			local pos = 1
			for i = 1, 6 do
				card.config.center.loc_txt.text_parsed[i] = nil
				local random_desc = pseudorandom_element(G.localization.descriptions.Joker, "missingnoDesc")
				if random_desc.text and random_desc.text[i] and type(random_desc.text[i]) == "string" then
					local parsed_string = loc_parse_string(random_desc.text[i])
					if not parsed_string then break end
					for _,v in pairs(parsed_string) do
						if v.strings and #v.strings == 1 and type(v.strings[1]) == 'string' then
							v.strings[1] = randomize(v.strings[1], pseudorandom_element({
								{'a','e','i','o','u'},
								{'b','d','p','q'},
								{'i','l'},
							}, "random_letter_replacement"), 0.01)
						end
					end
					card.config.center.loc_txt.text_parsed[pos] = parsed_string
					pos = pos + 1
				end
			end
			return { vars = {random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"),random_int_or_translation("desc"), colours = { random_colour("desc"), random_colour("desc"), random_colour("desc"), random_colour("desc") }} }
		end,
		rarity = 'qualatro_bird',
		atlas = 'M',
		blueprint_compat = true,
		shader = 'qualatro_glitched',
		draw = function(_, card, layer)
			if not card.config.center.discovered and not card.bypass_discovery_center then
				return
			end
			local phase = math.sin(G.TIMERS.REAL * 100) 
			card.children.center:draw_shader('qualatro_glitched', nil, {
				 phase * card.ability.extra.fuzz_amount, phase * card.ability.extra.fuzz_amount
			}, nil, nil, nil, nil, nil, nil)
		end,
		calculate = function(_, card, context)
			if context.joker_main and pseudorandom('missingno') < (G.GAME.probabilities.normal / card.ability.extra.base_odds) then

				local card_to_notify = context.blueprint_card or card
				local is_blueprint = context.blueprint
				G.E_MANAGER:add_event(Event({
					trigger = "before",
					func = function()
						card_to_notify:juice_up()
						if not is_blueprint then
							card.config.center.pos.x = pseudorandom_element({0, 1, 2, 3}, "missingnoSpriteBase")
							card.config.center.soul_pos.x = pseudorandom_element({0, 1, 2, 3, 4, 5}, "missingnoSpriteSoul")
							card:set_sprites(card.config.center)
							card.ability.extra.fuzz_amount = pseudorandom("missingnoFuzz") * 14
							if pseudorandom("missingnoCrazyFuzzNothing") < 0.1 then
								card.ability.extra.fuzz_amount = 0 
							elseif pseudorandom("missingnoCrazyFuzz") < 0.3 then
								card.ability.extra.fuzz_amount = card.ability.extra.fuzz_amount * 100
							end

							if pseudorandom("missingno_atlas") < (0.01 * G.GAME.probabilities.normal) then
								card.config.center.atlas = pseudorandom_element({'Joker', 'Tarot', 'qualatro_QualatroJokers', 'qualatro_QualatroTarot', 'qualatro_M'}, "missingnoatlas")
							end

							--NOTE: (Ahmayk) reset the play limit after 1 hand, it's not fun for this to be too broken 
							if card.ability.extra.play_limit_delta ~= 0 then
								change_play_and_discard_limit(-card.ability.extra.play_limit_delta)
								card.ability.extra.play_limit_delta = 0
							end

							if pseudoseed("missingnoResetBlendmode") < 0.4 then
								love.graphics.setBlendMode('alpha')
							end
						end
						return true
					end
				}))

				local code = pseudorandom_element(codes(), pseudoseed("missingno_proc"))
				if not pcall(function()
					local ret = code(card, context)

					if pseudoseed("missingnoTWICE") < 0.3 * G.GAME.probabilities.normal then
						--print("TWICE")
						ret = repeat_code(ret , code, card, context, 1)
					end
					if pseudoseed("missingnoTHRICE") < 0.1 * G.GAME.probabilities.normal then
						--print("THRICE")
						ret = repeat_code(ret , code, card, context, 2)
					end
					if pseudoseed("missingnoINSANE") < 0.05 * G.GAME.probabilities.normal then
						--print("INSANE")
						ret = repeat_code(ret , code, card, context, pseudorandom("missingnoInsane") * 20)
					end
				end) then
					return {
						message = "ERROR",
						colour = random_colour("missingno_error")
					}
				end
			end
		end,
	}
end

local function wii_shop_channel()
	-- Wii Shop
	SMODS.Joker {
		key = jokers.wii_shop_channel,
		pos = jokerpos.wii_shop_channel,
		loc_txt = {
			name = "Wii Shop Channel",
			text = {
				"{C:chips}+#2#{} Chips per {C:attention}purchase{}",
				"in the {C:attention}shop{}, resets",
				"at end of round",
				"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips) ",
			}
		},
		config = { extra = { chips = 0, chip_mod = 15  }},
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips or 0, card.ability.extra.chip_mod or 25 } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function (_, card, context)
			if
				not context.blueprint and
				((context.buying_card and not (context.card == card)) or context.open_booster or context.reroll_shop)
			then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
				card_eval_status_text(card, "extra", nil, nil, nil, {
					message = localize({ type = "variable", key = "a_chips", vars = { card.ability.extra.chips } }),
					colour = G.C.CHIPS,
				})
				return nil, true
			end
			if context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips
				}

			end
			if context.end_of_round and card.ability.extra.chips > 0 then
				card.ability.extra.chips = 0
				return {
					message = localize('k_reset'),
					colour = G.C.BLUE
				}
			end
		end,
	}
end

local function joker_inside_your_head()
	SMODS.Joker {
		key = jokers.joker_inside_your_head,
		pos = jokerpos.joker_inside_your_head,
		soul_pos = jokerpos.joker_inside_your_head_soul,
		loc_txt = {
			name = 'The Joker Inside Your Head',
			text = {
				"If {C:attention}first hand{} of round",
				"has exactly {C:attention}2{} cards,",
				"convert the {C:attention}left{} card",
				"into the {C:attention}right{} card",
			},
			unlock = {
				"{E:1,s:1.3}?????"
			}
		},
		config = { extra = { two = 2, temp_left_card_copy = nil } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.two or 2 } }
		end,
		rarity = rarity.LEGENDARY,
		unlocked = false,
		atlas = ATLAS,
		cost = 20,
		blueprint_compat = false,
		calculate = function(_, card, context)
			if 
				context.cardarea == G.jokers and 
				G.GAME.current_round.hands_played == 0 and
				context.full_hand and
				#context.full_hand == 2 and
				not context.blueprint
			then
				if context.modify_playing_hand then
					card.ability.extra.temp_left_card_copy = copy_card(context.full_hand[1])
					copy_card(context.full_hand[2], context.full_hand[1])

					card_eval_status_text(card, "extra", nil, nil, nil, {
						message = localize("qua_purge"),
						colour = G.C.BLACK,
						sound = 'tarot1'
					})

					for i=1, #context.full_hand do
						local percent = 1.15 - (i-0.999)/(#context.full_hand-0.998)*0.3
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.15,
							func = function()
								context.full_hand[i]:flip();
								play_sound('card1', percent);
								context.full_hand[i]:juice_up(0.3, 0.3);
								return true 
							end 
						}))
					end

					delay(0.2)

					local rightmost = context.full_hand[2]
					for i=1, #context.full_hand do
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.1,
							func = function()
								if context.full_hand[i] ~= rightmost then
									copy_card(rightmost, context.full_hand[i])
								end
								return true 
							end 
						}))
					end  

					for i=1, #context.full_hand do
						local percent = 0.85 + (i-0.999)/(#context.full_hand-0.998)*0.3
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.15,
							func = function()
								context.full_hand[i]:flip();
								play_sound('tarot2', percent, 0.6);
								context.full_hand[i]:juice_up(0.3, 0.3);
								return true 
							end 
						}))
					end
					delay(1.5)
				end

				if context.after then
					copy_card(card.ability.extra.temp_left_card_copy, context.full_hand[1])
					card.ability.extra.temp_left_card_copy:remove() 
				end
			end
		end
	}
end

local function interior_joker()
	SMODS.Joker {
		key = jokers.interior_joker,
		pos = jokerpos.interior_joker,
		loc_txt = {
			name = "Interior Joker",
			text = {
				"{C:chips}+#1#{} Chips for each {C:money}$#2#{}",
				"short of {C:money}$#3#{} you have",
				"{C:inactive}(Currently {C:chips}#4#{C:inactive} Chips){}",
			}
		},
		config = { extra = {
			chips = 4, dollars = 1, max_dollars = 25
		} },
		loc_vars = function(_, info_queue, card)
			local chips_mod = math.floor((card.ability.extra.max_dollars - to_number(G.GAME.dollars) - (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars)
			if chips_mod < 0 then
				chips_mod = 0
			end
			return { vars = {
				card.ability.extra.chips,
				card.ability.extra.dollars,
				card.ability.extra.max_dollars,
				card.ability.extra.chips*chips_mod,
			}}
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main then
				local chips_mod = math.floor((card.ability.extra.max_dollars - to_number(G.GAME.dollars) - (G.GAME.dollar_buffer or 0))/card.ability.extra.dollars)
				if chips_mod > 0 then
					return {
						chips = card.ability.extra.chips*chips_mod,
						colour = G.C.CHIPS,
						card = card,
					}
				end
			end
		end,
	}
end

local function crazy_bus()
	-- Crazy Bus

	--NOTE: (Ahamyak) Modified from idol card selection
	local function reset_crazy_bus_rank_id(card)
		card.ability.extra.current_rank_id = 14
		local valid_crazy_cards = {}
		for k, v in ipairs(G.playing_cards) do
			if not SMODS.has_no_rank(v) then
				valid_crazy_cards[#valid_crazy_cards+1] = v
			end
		end
		if valid_crazy_cards[1] then
			local crazy_bus_jokers = SMODS.find_card(jokerkey.crazy_bus)
			local index = 1
			for i = 1, #crazy_bus_jokers do
				if card.ID == crazy_bus_jokers[i].ID then
					index = i
					break
				end
			end
			local crazy_card = pseudorandom_element(valid_crazy_cards, pseudoseed('crazybus'..G.GAME.round_resets.ante..tostring(index)))
			card.ability.extra.current_rank_id = crazy_card.base.id
		end
	end

	local crazy_bus_dt = 0

	SMODS.Joker {
		key = jokers.crazy_bus,
		pos = jokerpos.crazy_bus,
		loc_txt = {
			name = "Crazy Bus",
			text = {
				"per {C:attention}consecutive{} hand",
				"played without a scoring {C:attention}#1#{}",
				"{s:0.8}Rank changes every round{}",
				"{C:inactive}(Currently {C:mult}#2#{C:inactive} Mult)",
			}
		},
		config = { mult = 0, extra = { chips = 0, current_rank_id = 14 } },
		loc_vars = function(_, info_queue, card)

			--NOTE: (Ahmayk) These numbers are an average of how you're likely to see these numbers given the crazy bus math
			--made these with a python script
			local cached_numbers = {-13, -12, -12, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7}

			local crazy_msgs_units = {}
			for i = 1, #cached_numbers do
				local operator = ""
				if cached_numbers[i] > 0 then
					operator = "+"
				end
				crazy_msgs_units[#crazy_msgs_units+1] = { string = operator .. tostring(cached_numbers[i]) .. " " .. localize('k_mult'), colour = G.C.MULT }
			end
			crazy_msgs_units[#crazy_msgs_units+1] = { string = "rand()", colour = G.C.JOKER_GREY }
			crazy_msgs_units[#crazy_msgs_units+1] = { string = "rand()", colour = G.C.JOKER_GREY }
			crazy_msgs_units[#crazy_msgs_units+1] = { string = "rand()", colour = G.C.JOKER_GREY }

			local rank_string = "Ace"
			for _, rank in pairs(SMODS.Ranks) do
				if rank.id == card.ability.extra.current_rank_id then
					rank_string = localize(rank.key, "ranks")
				end
			end

			local mult_string = "+0"
			if card.ability.mult > 0 then
				mult_string = "+" .. tostring(card.ability.mult)
			elseif card.ability.mult < 0 then
				mult_string = tostring(card.ability.mult)
			end

			local main_text = {
				{n=G.UIT.O, config={object = DynaText({string = "This Joker gains ", colours = {G.C.L_BLACK}, pop_in_rate = 9999999, silent = true, scale = 0.32 })}},
				{n=G.UIT.O, config={object = DynaText({string = crazy_msgs_units, colours = {G.C.UI.TEXT_DARK}, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.25, scale = 0.32, min_cycle_time = 0})}},
			}

			local result = {
				main_start = not card.debuff and main_text or nil,
				vars = {
					rank_string,
					mult_string,
				}
			}

			if card.ability.extra.chips > 0 and not card.debuff then
				local chip_string_key = 'qua_and_chip'
				if (card.ability.extra.chips > 1) then
					chip_string_key = 'qua_and_chips'
				end
				result["main_end"] = {
					{n=G.UIT.O, config={object = DynaText({string = localize{type='variable',key=chip_string_key, vars={card.ability.extra.chips}}, colours = {G.C.CHIPS}, pop_in_rate = 9999999, silent = true, scale = 0.25, align="bm"})}},
				}
			end

			return result
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		perishable_compat = false,

		add_to_deck = function(self, card, from_debuff)
			reset_crazy_bus_rank_id(card)
		end,

		set_sprites = function(_, card, front)
			if not card.config.center.discovered and not card.bypass_discovery_center then
				return
			end
			card.children.front = MultiSprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS["qualatro_QualatroCrazyBusText"], {
				{x=3, y=0}, {x=8, y=1}, {x=7, y=2}, {x=5, y=3}, {x=12, y=4},
			})
			card.children.front.states.hover = card.states.hover
			card.children.front.states.click = card.states.click
			card.children.front.states.drag = card.states.drag
			card.children.front.states.collide.can = false
			card.children.front:set_role({major = card, role_type = 'Glued', draw_major = card})
		end,

		update = function(_, card, dt)
			crazy_bus_dt = crazy_bus_dt + dt
			if G.P_CENTERS and G.P_CENTERS[jokerkey.crazy_bus] and crazy_bus_dt > 0.7 then
				local rank1 = card.ability.extra.current_rank_id - 2
				local rank2 = pseudorandom_element({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, pseudoseed('crazybus_rank2'))
				local it = 1
				while rank2 == rank1 do
					it = it + 1
					rank2 = pseudorandom_element({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, pseudoseed('crazybus_rank2'..'_resample'..it))
				end
				local rank3 = pseudorandom_element({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, pseudoseed('crazybus_rank3'))
				it = 1
				while rank3 == rank1 or rank3 == rank2 do
					it = it + 1
					rank3 = pseudorandom_element({0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, pseudoseed('crazybus_rank3'..'_resample'..it))
				end

				local new_poss = {
					{x=pseudorandom_element({0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8}, pseudoseed('crazybus_mult1')), y=0},
					{x=pseudorandom_element({0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 7, 8}, pseudoseed('crazybus_mult2')), y=1},
					{x=rank2, y=2}, {x=rank3, y=3}, {x=rank1, y=4},
				}
				if (card.children and card.children.front) then
					card.children.front.multi_sprite_poss = new_poss
				end
				crazy_bus_dt = 0
			end
		end,

		calculate = function(_, card, context)
			if context.before and not context.blueprint then
				local has_rank = false
				for i = 1, #context.scoring_hand do
					if not context.scoring_hand[i].debuff and context.scoring_hand[i]:get_id() == card.ability.extra.current_rank_id then
						has_rank = true
						break
					end
				end
				if has_rank then
					local last_chips = card.ability.extra.chips
					if card.ability.mult ~= 0 or card.ability.extra_chips ~= 0 then
						card.ability.mult = 0
						card.ability.extra.chips = 0
						return {
							card = card,
							message = localize('k_reset')
						}
					end
				else

					if (0.1 >= pseudorandom("crazybus_chip")) then
						card.ability.extra.chips = card.ability.extra.chips + 1
						return {
							message = localize('k_upgrade_ex'),
							colour = G.C.BLUE
						}
					else
						--NOTE: (Ahmayk) This is the actual crazy bus formula
						--https://youtu.be/c0Kjtzuy_XA?t=75
						local crazy_bus_frequency = ((pseudorandom("crazybus_play", 0, 40) * 10) + 700) % 1024
						--then we scale to a good number for balatro
						--I played with how this feels in a python script to find something that's feels right
						--and is interesting. play with this to get balance feeling good if adjustment is needed
						local mult_diff = ((crazy_bus_frequency * (1 / 1024)) - 0.65) * 20
						--round to a whole number to be similar to ride the bus
						mult_diff = math.floor(mult_diff + 0.5)
						--always be non-zero. the crazy bus is always moving!
						if (mult_diff == 0) then
							mult_diff = 1
						end

						card.ability.mult = card.ability.mult + mult_diff

						local mult_message = localize('k_upgrade_ex')
						if mult_diff < 0 then
							mult_message = localize('qua_downgrade_ex')
						end
						return {
							message = mult_message,
							colour = G.C.RED,
							-- mult_mod = card.ability.mult
						}
					end
				end
			end

			if (context.joker_main or context.retrigger_joker) then

				local result = {}
				if card.ability.mult > 0 then
					result["message"] = localize{type='variable',key='a_mult',vars={card.ability.mult}}
				elseif card.ability.mult < 0 then
					result["message"] = localize{type='variable',key='a_mult_minus',vars={-card.ability.mult}}
				end

				if card.ability.mult ~= 0 then
					result["mult_mod"] = card.ability.mult
				end

				if card.ability.extra.chips > 0 then
					result["chips"] = card.ability.extra.chips
				end
				return result
			end

			if context.end_of_round then
				reset_crazy_bus_rank_id(card)
			end
		end,
	}
end

local function tax_fraud()
	-- Tax Fraud
	SMODS.Joker {
		key = jokers.tax_fraud,
		pos = jokerpos.tax_fraud,
		loc_txt = {
			name = "Ta-Ta-Tax Fraud!",
			text = {
				"Always gain the maximum amount",
				"of {C:money}interest{} at end of round",
				-- "{C:inactive}(Currently {C:money}$#1#{C:inactive}){}",
				"Pay {C:attention}50%{} of your {C:money}money{} when",
				"this Joker is sold or destroyed",
			}
		},
		config = { },
		blueprint_compat = false,
		loc_vars = function(_, info_queue, card)
			return { vars = { (G.GAME and G.GAME.interest_cap / 5) or 5 } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 0,
		add_to_deck = function(_, card, from_debuff)
			card.sell_cost = 0
		end,
		remove_from_deck = function (self, card, from_debuff)
			if not from_debuff then
				--NOTE: (Ahmayk) card.sell_cost has already been added to G.GAME.dollars
				local payment = math.ceil((G.GAME.dollars) * 0.5)
				--toggle loophole if you only have 1 dollar after card sold
				--because that just feels right if you manage to pull that off
				if to_big(G.GAME.dollars) == to_big(1) then
					payment = 0
				end

				if to_big(payment) > to_big(0) then
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('qua_taxed_ex'), colour = G.C.MONEY, sound = 'cancel', instant = true })
				else
					card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('qua_loophole_ex'), colour = G.C.RED, delay = 1.5 })
				end

				if to_big(payment) ~= to_big(0) then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							ease_dollars(-payment)
							return true
						end
					}))
				end
			end
		end,
		--NOTE: (Ahmayk) interest ability is handled via lovely injection
	}
end

local function kazoo()
	SMODS.Joker {
		key = jokers.kazoo,
		pos = jokerpos.kazoo,
		loc_txt = {
			name = "Kazoo",
			text = {
				"{C:green}#1# in #2#{} chance to",
				"copy ability of",
				"{C:attention}Joker{} to the left"
			}
		},
		config = { extra = { odds = 4, active = false } },
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 3,
		blueprint_compat = true,
		update = function(self, card, front)
			if G.STAGE == G.STAGES.RUN then
				local other_joker = nil
				for i = 2, #G.jokers.cards do
					if G.jokers.cards[i] == card then
						other_joker = G.jokers.cards[i - 1]
					end
				end
				if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
					card.ability.blueprint_compat = "compatible"
				else
					card.ability.blueprint_compat = "incompatible"
				end
			end
		end,
		loc_vars = function(self, info_queue, card)
			card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
			card.ability.blueprint_compat_check = nil
			return {
				vars = {
					G.GAME.probabilities.normal or 1,
					card.ability.extra.odds,
				},
				main_end = (card.area and card.area == G.jokers) and {
					{
						n = G.UIT.C,
						config = { align = "bm", minh = 0.4 },
						nodes = {
							{
								n = G.UIT.C,
								config = {
									ref_table = card,
									align = "m",
									colour = G.C.JOKER_GREY,
									r = 0.05,
									padding = 0.06,
									func = "blueprint_compat",
								},
								nodes = {
									{
										n = G.UIT.T,
										config = {
											ref_table = card.ability,
											ref_value = "blueprint_compat_ui",
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.32 * 0.8,
										},
									},
								},
							},
						},
					},
				} or nil,
			}
		end,
		calculate = function(self, card, context)
			if context.before then
				card.ability.extra.active = pseudorandom("kazoo") <= G.GAME.probabilities.normal / card.ability.extra.odds
			end

			if card.ability.extra.active then
				local other_joker = nil
				for i = 2, #G.jokers.cards do
					if G.jokers.cards[i] == card then
						other_joker = G.jokers.cards[i - 1]
					end
				end
				if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then

					context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
					context.blueprint_card = context.blueprint_card or card

					if context.blueprint > #G.jokers.cards + 1 then
						return
					end

					local other_joker_ret, trig = other_joker:calculate_joker(context)
					local eff_card = context.blueprint_card or card

					context.blueprint = nil
					context.blueprint_card = nil

					if other_joker_ret == true then
						return other_joker_ret
					end
					if other_joker_ret or trig then
						if not other_joker_ret then
							other_joker_ret = {}
						end
						other_joker_ret.card = eff_card
						other_joker_ret.colour = G.C.BLUE
						other_joker_ret.no_callback = true
						return other_joker_ret
					end
				end
			end
		end,
	}
end

local function dian_shi_ma_li()
	SMODS.Joker {
		key = jokers.dian_shi_ma_li,
		atlas = ATLAS,
		pos = jokerpos.dian_shi_ma_li,
		loc_txt = {
			name = "Dian Shi Ma Li",
			text = {
				"First three scoring {C:attention}7{}s",
				"in played hand give:",
				"1st, {C:chips}+#2#{} Chips",
				"2nd, {C:chips}+#3#{} Chips",
				"3rd, {C:mult}+#4#{} Mult"
			}
		},
		cry_credits = {
			idea = { P.dda },
			art = { P.party_rock },
			code = { P.alan }
		},
		config = { counter, extra = { chips = 7, chips2 = 70, mult = 7 } },
		loc_vars = function(_, info_queue, card)
			return { 
				vars = { 
					card.ability.counter,
					card.ability.extra.chips, 
					card.ability.extra.chips2, 
					card.ability.extra.mult 
				} 
			}
		end,
		rarity = rarity.UNCOMMON,
		cost = 7,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.before then 
				card.ability.counter = 0
			end

			if context.individual and context.cardarea == G.play then
				if context.other_card:get_id() == 7 then
					card.ability.counter = card.ability.counter + 1
					if card.ability.counter == 1 then
						return {
							chips = card.ability.extra.chips
						}
					elseif card.ability.counter == 2 then
						return {
							chips = card.ability.extra.chips2
						}
					elseif card.ability.counter == 3 then
						return {
							mult = card.ability.extra.mult
						}
					end
				end
			end
		end
	}
end

local function jokex_replica()
	-- Jokex Replica
	SMODS.Joker {
		key = jokers.jokex_replica,
		pos = jokerpos.jokex_replica,
		loc_txt = {
			name = "Replica",
			text = {
				"{C:chips}+#1#{} Chips on {C:attention}final",
				"{C:attention}hand{} of round",
			}
		},
		config = { extra = { chips = 150 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.joker_main and G.GAME.current_round.hands_left == 0 then
				return {
					chips = card.ability.extra.chips
				}
			end
		end
	}
end

local function katamari_on_the_rocks()
	-- Katamari On The Rocks
	SMODS.Joker {
		key = jokers.katamari_on_the_rocks,
		pos = jokerpos.katamari_on_the_rocks,
		loc_txt = {
			name = "Katamari On The Rocks",
			text = {
				"This Joker gains {C:chips}#2#{} Chip",
				"for every card scored",
				"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
			}
		},
		config = { extra = { chips = 0, chip_mod = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and not context.blueprint then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
				return {
					extra = {focus = card, message = localize('k_upgrade_ex')},
					card = card,
					colour = G.C.CHIPS
				}
			end
			if context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips
				}
			end
		end
	}
end

local function planet_b_ball()

	local function planet_b_ball_update_mult(card)
		if G.GAME and G.GAME.hands then
			local valid_num_hands = 0
			for _, v in pairs(G.GAME.hands) do
				if to_big(v.level) >= to_big(card.ability.extra.poker_hand_level) then
					valid_num_hands = valid_num_hands + 1
				end
			end
			local mult = valid_num_hands * card.ability.extra.bonus
			if card.area == G.jokers then
				if card.ability.extra.mult < mult then
					card_eval_status_text(card, 'extra', nil, nil, nil,
					{colour = G.C.RED, message = localize('k_upgrade_ex')}
					)
				end
				if card.ability.extra.mult > mult then
					card_eval_status_text(card, 'extra', nil, nil, nil,
					{colour = G.C.RED, message = localize('qua_downgrade_ex')}
					)
				end
			end
			card.ability.extra.mult = mult
		end
	end

	SMODS.Joker {
		key = jokers.planet_b_ball,
		pos = jokerpos.planet_b_ball,
		loc_txt = {
			name = 'Planet B Ball',
			text = {
				"{C:red}+#1#{} Mult per",
				"{C:attention}poker hand{} upgraded",
				"to {C:attention}Level #2#{} or above",
				"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
			}
		},
		config = { extra = { bonus = 5, poker_hand_level = 3, mult = 0 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.bonus,
				card.ability.extra.poker_hand_level,
				card.ability.extra.mult,
			} }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,

		update = function (self, card, front)
			planet_b_ball_update_mult(card)
		end,

		calculate = function(_, card, context)
			if context.joker_main and card.ability.extra.mult > 0 then

				if not context.blueprint then
					planet_b_ball_update_mult(card)
				end

				return {
					message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
					mult_mod = card.ability.extra.mult,
				}
			end
		end
	}
end

local function color_war()
	SMODS.Joker {
		key = jokers.color_war,
		pos = jokerpos.color_war,
		loc_txt = {
			name = 'Color War',
			text = {
				"{C:red}+#1#{} Mult if played hand",
				"contains a scoring",
				"{V:1}Hearts{} or {V:2}Diamonds{}",
				"card and a scoring",
				"{V:3}Clubs{} or {V:4}Spades{} card",
				
			}
		},
		config = { mult = 10 },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.mult,
				colours = { G.C.SUITS.Hearts, G.C.SUITS.Diamonds, G.C.SUITS.Clubs, G.C.SUITS.Spades },
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,

		calculate = function(_, card, context)
			--NOTE: (Ahmayk) This won't work with custom suits from other mods as suit data doesn't have any concept of a color
			if context.joker_main and context.cardarea == G.jokers and not context.before and not context.after and context.scoring_hand then
				local has_red = false
				local has_black = false
				for i = 1, #context.scoring_hand do
					if context.scoring_hand[i].debuff then
						break
					end
					if SMODS.has_any_suit(context.scoring_hand[i]) then
						has_red = true
						has_black = true
						break
					end
					if not SMODS.has_no_suit(context.scoring_hand[i]) then
						if
							context.scoring_hand[i].base.suit == "Diamonds" or
							context.scoring_hand[i].base.suit == "Hearts"
						then
							has_red = true
						end
						if
							context.scoring_hand[i].base.suit == "Spades" or
							context.scoring_hand[i].base.suit == "Clubs"
						then
							has_black = true
						end
					end
				end
				if has_red and has_black then
					return {
						message = localize({ type = "variable", key = "a_mult", vars = { card.ability.mult } }),
						colour = G.C.RED,
						mult_mod = card.ability.mult,
					}
				end
			end
		end
	}
end

local function dancing_mad()

	local function dancing_mad_choose_suit(card)
		local valid_mad_suits = {}
		for k, v in ipairs(G.playing_cards) do
			if not SMODS.has_no_suit(v) and not SMODS.has_no_rank(v) then
				valid_mad_suits[#valid_mad_suits+1] = v.base.suit
			end
		end
		if valid_mad_suits[1] then
			card.ability.extra.suit = pseudorandom_element(valid_mad_suits, pseudoseed('dancingmad'..G.GAME.round..' '..G.GAME.round_resets.hands))
			card.ability.extra.has_set_suit_once = true
		end
	end

	local function dancing_mad_activate(card)
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			func = function()
				card.ability.extra.debuffs_active = true
				for _, v in ipairs(G.playing_cards) do
					if v.area ~= G.jokers and v:is_suit(card.ability.extra.suit, true) then
						v:juice_up()
						SMODS.debuff_card(v, true, jokerkey.dancing_mad)
					end
				end
				return true
			end
		}))

		card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('qua_debuff_ex')})
	end

	local function dancing_mad_deactivate(card, no_juice)
		card.ability.extra.debuffs_active = false
		local dancing_mads = SMODS.find_card(jokerkey.dancing_mad)
		local other_debuffed_suits = {}
		for _, v in ipairs(dancing_mads) do
			if v ~= card then
				other_debuffed_suits[v.ability.extra.suit] = true
			end
		end

		if other_debuffed_suits[card.ability.extra.suit] == nil then
			for _, v in ipairs(G.playing_cards) do
				if v.area ~= G.jokers and v:is_suit(card.ability.extra.suit, true) then
					if not no_juice then
						v:juice_up()
					end
					SMODS.debuff_card(v, false, jokerkey.dancing_mad)
					SMODS.recalc_debuff(v)
				end
			end
		end
	end

	SMODS.Joker {
		key = jokers.dancing_mad,
		pos = jokerpos.dancing_mad,
		loc_txt = {
			name = 'Dancing Mad',
			text = {
				"{C:attention}+#1#{} hand size",
				"All {V:1}#2#{} cards are {C:attention}debuffed{}",
				"Suit changes every hand",
			}
		},
		config = { extra = { hand_size = 3, suit = "Spades", has_set_suit_once = false, needs_reset = false, debuffs_active = false } },
		loc_vars = function(_, info_queue, card)

			if G.GAME and G.GAME.round_resets and G.playing_cards and not card.ability.extra.has_set_suit_once then
				dancing_mad_choose_suit(card)
			end

			return { vars = {
				card.ability.extra.hand_size,
				localize(card.ability.extra.suit, 'suits_singular'),
				colours = {G.C.SUITS[card.ability.extra.suit]},
			} }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 10,
		blueprint_compat = false,

		add_to_deck = function(self, card, from_debuff)
			if not card.ability.extra.has_set_suit_once then
				dancing_mad_choose_suit(card)
			end
			if G.STATE == G.STATES.SELECTING_HAND then
				dancing_mad_activate(card)
			end
			G.hand:change_size(card.ability.extra.hand_size)
		end,

		remove_from_deck = function (self, card, from_debuff)
			dancing_mad_deactivate(card)
			G.hand:change_size(-card.ability.extra.hand_size)
		end,

		calculate = function(_, card, context)

			if context.first_hand_drawn then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					func = function()
						dancing_mad_activate(card)
						return true
					end
				}))
				card.ability.extra.needs_reset = false
			end

			if context.after then
				card.ability.extra.needs_reset = true
			end

			--NOTE: (Ahmayk) context.new_hand is new context that triggers
			--on hand_drawn regardless if cards are drawn (so start of every new hand)
			if context.new_hand and card.ability.extra.needs_reset then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					func = function()
						dancing_mad_deactivate(card)
						dancing_mad_choose_suit(card)
						dancing_mad_activate(card)
						return true
					end
				}))
				card.ability.extra.needs_reset = false
			end

			if context.end_of_round and card.ability.extra.needs_reset then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					func = function()
						dancing_mad_deactivate(card)
						dancing_mad_choose_suit(card)
						return true
					end
				}))
				card.ability.extra.needs_reset = false
			end
		end
	}
end

--NOTE: (Ahmayk) we assume that if this blind related funciton is called,
--then there the card that may need updating
--this seems to be called when a suit it changed or if a card otherwise needs a debuff refresh
--may not be 100% reliable, but doing this every frame is a bad performance hit
local _super_blind_debuff_card = Blind.debuff_card
function Blind:debuff_card(card, from_blind)
	_super_blind_debuff_card(self, card, from_blind)
	if card then
		local dancing_mads = SMODS.find_card(jokerkey.dancing_mad)
		if #dancing_mads > 0 then
			local debuffed_suits = {}
			for _, v in ipairs(dancing_mads) do
				if v.ability.extra.debuffs_active then
					debuffed_suits[v.ability.extra.suit] = true
				end
			end

			if next(debuffed_suits) then
				local should_be_debuffed = false

				local has_any_suit = false
				local has_no_suit = false

				for k, _ in pairs(SMODS.get_enhancements(card)) do
					if k == 'm_wild' or G.P_CENTERS[k].any_suit then
						has_any_suit = true
					end
					if k == 'm_stone' or G.P_CENTERS[k].no_rank then
						has_no_suit = true
					end
				end

				if has_any_suit then
					should_be_debuffed = true
				elseif has_no_suit then
					should_be_debuffed = false
				else 
					for suit, _ in pairs(debuffed_suits) do
						if SMODS.smeared_check(card, suit) then
							should_be_debuffed = true
							break
						end
						if card.base.suit == suit then
							should_be_debuffed = true
							break
						end
					end
				end

				if card.debuff ~= should_be_debuffed then
					--print("updating: debuff to " .. tostring(should_be_debuffed) .. ": " .. card.base.name)
					SMODS.debuff_card(card, should_be_debuffed, jokerkey.dancing_mad)
				end
			end
		end
	end
end

local function circus()
	SMODS.Joker {
		key = jokers.circus,
		pos = jokerpos.circus,
		loc_txt = {
			name = "Circus",
			text = {
				"Copy the ability of a random",
				"{C:attention}Joker{} when hand is played",
				"{C:inactive}(Never selects itself)",
			}
		},
		config = { extra = { copied_joker_id = "", copied_joker_returned = false } },
		loc_vars = function(_, info_queue, card)
			return { vars = { }}
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 9,
		blueprint_compat = true,
		loc_vars = function(self, info_queue, card)
			return { vars = { }, }
		end,
		calculate = function(self, card, context)
			if context.before and not context.blueprint then

				local can_choose = false
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key ~= card.config.center.key then
						can_choose = true
						break
					end
				end

				local copied_joker = nil 
				if can_choose then
					local it = 0
					while it < 999 and (copied_joker == nil or copied_joker.config.center.key == 'j_qualatro_circus') do
						copied_joker = pseudorandom_element(G.jokers.cards, pseudoseed('circus'))
						it = it + 1
					end
				end

				if copied_joker then
					card.ability.extra.copied_joker_id = copied_joker.ID
					--NOTE: (Ahmayk) Useful for debugging to know what it chose
					--local card_or_blueprint = context.blueprint_card or card
					--print(card_or_blueprint.config.center.name .. " chose " .. copied_joker.config.center.name)
				end
			end

			if context.after and not context.blueprint then
				card.ability.extra.copied_joker_id = nil
				card.ability.extra.copied_joker_returned = false
			end

			local copied_joker = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ID == card.ability.extra.copied_joker_id then
					copied_joker = G.jokers.cards[i]
					break
				end
			end

			local input_blueprint = context.blueprint_card
			local old_blueprint_card = context.blueprint_card 
			local card_or_blueprint = context.blueprint_card or card

			local copied_joker_ret = nil
			local trig = nil
			if copied_joker and copied_joker ~= card then

				context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
				local old_circus_counter = context.circus_counter
				context.circus_counter = (context.circus_counter and (context.circus_counter + 1)) or 1
				context.blueprint_card = context.blueprint_card or card

				copied_joker_ret, trig = copied_joker:calculate_joker(context)
				local eff_card = context.blueprint_card or card

				context.blueprint = input_blueprint 
				context.blueprint_card = old_blueprint_card
				context.circus_counter = old_circus_counter

				if copied_joker_ret == true then
					card.ability.extra.copied_joker_returned = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							copied_joker:juice_up()
							play_sound("qualatro_circus_click", 1, 0.5)
							return true
						end
					}))
				elseif copied_joker_ret or trig then
					if not copied_joker_ret then
						copied_joker_ret = {}
					end

					card.ability.extra.copied_joker_returned = true
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						func = function()
							copied_joker:juice_up()
							play_sound("qualatro_circus_click", 1, 0.5)
							return true
						end
					}))

					copied_joker_ret.card = eff_card
					copied_joker_ret.colour = G.C.BLACK
					copied_joker_ret.no_callback = true
				end
			end

			if context.joker_main and not context.circus_counter and copied_joker then
				if copied_joker ~= card_or_blueprint then
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						blocking = false,
						func = function()
							card_or_blueprint:juice_up()
							return true
						end
					}))
				end
				card_eval_status_text(copied_joker, 'extra', nil, nil, nil, {message = localize("qua_copied_ex"), colour=G.C.BLACK })

				if copied_joker == card_or_blueprint or not copied_joker.config.center.blueprint_compat or not card.ability.extra.copied_joker_returned then
					card_eval_status_text(card_or_blueprint, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), sound="cancel" })
				end
			end

			if copied_joker_ret then
				return copied_joker_ret
			end
		end,
	}
end

local function pomni()

	--NOTE: (Ahmayk) this is a modified version of card:explode()
	local function pomni_transform(card, joker_center_to_transform, transform_message, sound, pitch, level)
		local explode_time = 1.3*(explode_time_fac or 1)*(math.sqrt(G.SETTINGS.GAMESPEED))
		card.dissolve = 0
		--NOTE: (Ahmayk) colors from pomni card art
		local transform_colors = {{1,1,1,0.8}, HEX("8166CF"), HEX("F63851"), HEX("F6D228")}
		or {G.C.WHITE}

		local start_time = G.TIMERS.TOTAL
		local percent = 0
		play_sound('explosion_buildup1')
		card.juice = {
			scale = 0,
			r = 0,
			handled_elsewhere = true,
			start_time = start_time,
			end_time = start_time + explode_time
		}

		local childParts1 = Particles(0, 0, 0,0, {
			timer_type = 'TOTAL',
			timer = 0.01*explode_time,
			scale = 0.2,
			speed = 2,
			lifespan = 0.2*explode_time,
			attach = card,
			colours = transform_colors,
			fill = true
		})
		local childParts2 = nil

		G.E_MANAGER:add_event(Event({
			blockable = false,
			trigger = 'after',
			delay = explode_time,
			func = (function()
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = transform_message, colour = HEX("F63851"), instant = true})
				return true
			end)
		}))

		G.E_MANAGER:add_event(Event({
			blockable = false,
			func = (function()
				if card.juice then
					percent = (G.TIMERS.TOTAL - start_time)/explode_time
					card.juice.r = 0.05*(math.sin(5*G.TIMERS.TOTAL) + math.cos(0.33 + 41.15332*G.TIMERS.TOTAL) + math.cos(67.12*G.TIMERS.TOTAL))*percent
					card.juice.scale = percent*0.15
				end
				if G.TIMERS.TOTAL - start_time > 1.5*explode_time then return true end
			end)
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'ease',
			blockable = false,
			ref_table = card,
			ref_value = 'dissolve',
			ease_to = 0.3,
			delay =  0.9*explode_time,
			func = (function(t) return t end)
		}))

		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			blockable = false,
			delay =  0.9*explode_time,
			func = (function()
				childParts2 = Particles(0, 0, 0,0, {
					timer_type = 'TOTAL',
					pulse_max = 30,
					timer = 0.003,
					scale = 0.6,
					speed = 15,
					lifespan = 0.5,
					attach = card,
					colours = transform_colors,
				})
				childParts2:set_role({r_bond = 'Weak'})
				card:juice_up(0.3, 0.3)
				G.VIBRATION = G.VIBRATION + 1
				play_sound('explosion_release1', 1, 0.5)
				play_sound(sound, pitch, level)
				card.dissolve = 0
				card:set_ability(joker_center_to_transform)
				card:set_cost()
				childParts1:fade(0.3*explode_time) return true end)
		}))

		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			blockable = false,
			delay =  1.4*explode_time,
			func = (function()
				G.E_MANAGER:add_event(Event({
					trigger = 'ease',
					blockable = false,
					blocking = false,
					ref_value = 'scale',
					ref_table = childParts2,
					ease_to = -0.01,
					delay = 0.1*explode_time,
					func = (function(t) return t end)
				}))
				return true end)
		}))
	end

	SMODS.Joker {
		key = jokers.pomni,
		pos = jokerpos.pomni,
		loc_txt = {
			name = "Pomni",
			text = {
				"At end of hand, {C:green}#2# in #1#{}",
				"chance to transform into a",
			}
		},
		config = { extra = { odds = 4, trapped = true, block_selling = false } },
		loc_vars = function(_, info_queue, card)

			local glitched_string = {
				{string = "Rare Joker", colour = G.C.RED},
				{string = "Rare Joker", colour = G.C.RED},
				{string = "Abstract", colour = G.C.IMPORTANT},
				{string = "Abstract", colour = G.C.IMPORTANT},
				{string = "%$!#"},
			}
			local result = {
				vars = {
					card.ability.extra.odds,
					G.GAME.probabilities.normal,
				},
				main_end = {
					{n=G.UIT.R, config={align = "cm", padding = 0.05, colour = G.C.BLACK }, nodes={
						{n=G.UIT.O, config={object = DynaText({string = glitched_string, colours = {G.C.GREEN, G.C.BLUE, G.C.YELLOW, G.C.RED}, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.35, scale = 0.32, min_cycle_time = 0})}},
					}},
				},
			}
			return result
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		remove_from_deck = function(_, card, from_debuff)
			if card.ability.extra.trapped and not from_debuff then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					func = (function()

						local new_pomni = SMODS.create_card({
							set = 'Joker',
							area = G.jokers,
							key = "j_qualatro_pomni",
						})

						if card.ability.extra.block_selling then
							new_pomni.ability.extra.block_selling = true
						end
						new_pomni:add_to_deck()

						G.jokers:emplace(new_pomni)
						play_sound('cancel')
						card_eval_status_text(new_pomni, 'extra', nil, nil, nil, {message = localize("qua_trapped_ex"), colour = G.C.RED})

						return true end)
					}))
			end
		end,

		calculate = function(_, card, context)
			if context.after then

				local transform = pseudorandom('pomni_transform') <= (G.GAME.probabilities.normal / card.ability.extra.odds)
				if transform then

					local become_rare = false
					local become_abstract = false
					while not become_rare and not become_abstract do
						become_rare = pseudorandom('pomni_rare') <= (G.GAME.probabilities.normal / card.ability.extra.odds)
						become_abstract = pseudorandom('pomni_abstract') <= (G.GAME.probabilities.normal / card.ability.extra.odds)
					end

					local card_to_transform = context.blueprint_card or card

					if become_rare then
						card.ability.extra.trapped = false
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 3,
							blocking = true,
							func = (function()
								local _pool, _pool_key = get_current_pool("Joker", rarity.RARE, nil, nil)
								local joker_center_to_transform_string = pseudorandom_element(_pool, pseudoseed(_pool_key))
								local it = 1
								while joker_center_to_transform_string == 'UNAVAILABLE' do
									it = it + 1
									joker_center_to_transform_string = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
								end
								local joker_center_to_transform = G.P_CENTERS[joker_center_to_transform_string]
								local transform_message = localize('qua_escaped_ex')
								local pitch = 1.5
								if become_abstract then
									transform_message = localize('qua_escaped_question')
									pitch = 1.3
								end
								pomni_transform(card_to_transform, joker_center_to_transform, transform_message, 'tarot1', pitch, 2)
								return true end)
							}))
						end

						if become_abstract then
							card.ability.extra.trapped = false
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								delay = 3,
								blocking = true,
								func = (function()
									joker_center_to_transform = G.P_CENTERS["j_abstract"] or G.P_CENTERS["j_joker"]
									pomni_transform(card_to_transform, joker_center_to_transform, localize('qua_abstracted_ex'), 'cancel', 1, 1)
									return true end)
								}))
							end
						end

			end

			if context.selling_self and not context.blueprint then
				card.ability.extra.block_selling = true
			end
		end
	}
end

local function pizza_roll()
	SMODS.Joker {
		key = jokers.pizza_roll,
		pos = jokerpos.pizza_roll,
		loc_txt = {
			name = "Pizza Roll",
			text = {
				"{C:red}+#1#{} discards,",
				"reduces by",
				"{C:red}#2#{} each round",
			}
		},
		config = { extra = { discards = 3, discard_mod = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.discards, card.ability.extra.discard_mod } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = false,
		eternal_compat = false,
		add_to_deck = function(_, card, from_debuff)
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
			ease_discard(card.ability.extra.discards)
		end,
		remove_from_deck = function(_, card, from_debuff)
			G.GAME.round_resets.discards = math.max(0, G.GAME.round_resets.discards - card.ability.extra.discards)
			ease_discard(-card.ability.extra.discards)
		end,
		calculate = function(_, card, context)
			if context.end_of_round and not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker then
				card.ability.extra.discards = card.ability.extra.discards - card.ability.extra.discard_mod
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_mod
				if card.ability.extra.discards <= 0 then
					local ret = {}
					ret.func = function()
						SMODS.destroy_cards(card, nil, nil, true)
						card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize('k_eaten_ex')})
					end
					return ret 
				else
					return {
						message = localize{type='variable', key='qua_discard_minus', vars={card.ability.extra.discard_mod}},
						colour = G.C.RED
					}
				end
			end
		end,
	}
end

local function takeover_doover()

	local function takeover_is_valid()
		return G.GAME.blind and
			G.GAME.blind.name ~= '' and
			G.GAME.blind.blind_set and
			#G.consumeables.cards < G.consumeables.config.card_limit
	end

	SMODS.Joker {
		key = jokers.takeover_doover,
		pos = jokerpos.takeover_doover,
		loc_txt = {
			name = "Takeover Do-over",
			text = {
				"Sell this card during a {C:attention}Blind{}",
				"to create {C:attention}#1#{} copies of your",
				"last used {C:attention}consumable{}",
				"{C:inactive}(Must have room){}",
			}
		},
		config = { extra = { copies = 2 } },
		loc_vars = function(_, info_queue, card)
			local fool_c = G.GAME.last_consumeable and G.P_CENTERS[G.GAME.last_consumeable] or nil
			local last_consumeable_string = fool_c and localize{type = 'name_text', key = fool_c.key, set = fool_c.set} or localize('k_none')
			local colour = G.C.RED

			if fool_c then
				info_queue[#info_queue+1] = fool_c
				if takeover_is_valid() then
					colour = G.C.GREEN
				end
			end

			local result =  {
				vars = { card.ability.extra.copies },
				main_end = {
					{n=G.UIT.R, config = {padding = 0.02, align = "m"}, nodes={
						{n=G.UIT.C, config={align = "m", colour = colour, r = 0.05, padding = 0.05}, nodes={
							{n=G.UIT.T, config={text = ' '..last_consumeable_string..' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true}},
						}},
					}},
				}
			}

			if fool_c and not takeover_is_valid() then
				result.main_end[#result.main_end + 1] = 
					{n=G.UIT.R, config = {align= "m", padding = 0.02}, nodes={
						{n=G.UIT.C, config={align = "m", colour = G.C.RED, r = 0.05, padding = 0.05}, nodes={
							{n=G.UIT.T, config={text = ' Inactive ', colour = G.C.UI.TEXT_LIGHT, scale = 0.25, shadow = true}}
						}}
					}}
			end

			return result
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.selling_self then
				if takeover_is_valid() and #G.consumeables.cards < G.consumeables.config.card_limit then
					card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('qua_doover_ex')})

					for i = 1, card.ability.extra.copies do
						if #G.consumeables.cards + i <= G.consumeables.config.card_limit then
							G.E_MANAGER:add_event(Event({
								trigger = 'after',
								delay = 0.4,
								func = function()
									play_sound('timpani')
									local key = G.GAME.last_consumeable or "c_fool"
									local card = create_card(nil, G.consumeables, nil, nil, nil, nil, key, 'fools')
									card:add_to_deck()
									G.consumeables:emplace(card)
									return true
								end
							}))
						end
					end
				else
					card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_nope_ex'), sound="cancel"})
				end
			end
		end,
	}

	local _super_set_consumeable_usage = set_consumeable_usage

	function set_consumeable_usage(card)
		--NOTE: (Ahmayk) the similar G.GAME.last_tarot_planet is also set in two immediate events like this
		--dunno why, but guess we should do the same to have the same behavior
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function()
						G.GAME.last_consumeable = card.config.center_key
						return true
					end
				}))
				return true
			end
		}))
		_super_set_consumeable_usage(card)
	end


end

local function the_bean()
	SMODS.Joker {
		key = jokers.the_bean,
		pos = jokerpos.the_bean,
		loc_txt = {
			name = "Green de la Bean",
			text = {
				"{C:red}+#1#{} Mult",
				"{C:green}#2# in #3#{} chance to",
				"give {X:mult,C:white} X#4# {} Mult, then",
				"{S:1.1,C:red,E:2}self destructs{}"
			}
		},
		config = { extra = { mult = 5, odds = 5, x_mult = 1000 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.mult,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.odds,
				card.ability.extra.x_mult,
			}}
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.joker_main then

				local card_to_notify = context.blueprint_card or card

				card_eval_status_text(card_to_notify, 'extra', nil, nil, nil, {colour=G.C.MULT, message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}}})

				local result = {
					mult_mod = card.ability.extra.mult,
				}

				if pseudorandom('get_beaned') < (G.GAME.probabilities.normal / card.ability.extra.odds) then
					SMODS.destroy_cards(card_to_notify, nil, nil, true)
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.5 + math.random() * 0.4,
						func = function()
							attention_text({
								text = localize("qua_beaned_ex"),
								scale = 2.5,
								hold = 3.5,
								backdrop_colour = G.C.GREEN,
								align = 'bm',
								major = card_to_notify,
								offset = {x = 0, y = 0.15*G.CARD_H}
							})
							attention_text({
								text = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
								scale = 2.5,
								hold = 3.5,
								backdrop_colour = G.C.MULT,
								align = 'bm',
								major = card_to_notify,
								offset = {x = 0, y = 0.85*G.CARD_H}
							})
							local generic_percent = 0.9 + 0.2*math.random()
							play_sound('qualatro_multhit2beaned', 0.8+generic_percent*0.2, 1)
							card_to_notify:juice_up(1, 0.2)
							G.ROOM.jiggle = G.ROOM.jiggle + 35
							return true
						end
					}))
					result.Xmult_mod = card.ability.extra.x_mult
				end
				return result 
			end
		end,
	}
end

local function joper()
	SMODS.Joker {
		key = jokers.joper,
		pos = jokerpos.joper,
		loc_txt = {
			name = "jOPer",
			text = {
				"Each {C:attention}Queen",
				"held in hand",
				"gives {C:chips}+#1#{} Chips"
			}
		},
		cry_credits = {
			idea = {  },
			art = { P.party_rock },
			code = { P.zc }
		},
		config = { extra = { chips = 60 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips,
			}}
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 12 then
				return {
					chips = card.ability.extra.chips,
					card = context.other_card
				}
			end
		end
	}
end

local function smoke_explainer()
	SMODS.Joker {
		key = jokers.smoke_explainer,
		pos = jokerpos.smoke_explainer,
		loc_txt = {
			name = 'SmokeXplainer 420',
			text = {
				"{C:green}#1# in #2#{} chance to upgrade",
				"{C:attention}High Card{} if played",
				"poker hand is {C:attention}High Card{}",
			}
		},
		config = { extra = { odds = 2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			} }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,

		calculate = function(_, card, context)
			if
				context.before and
				context.cardarea == G.jokers and
				context.scoring_name == "High Card" and
				pseudorandom('smokexplainer') < G.GAME.probabilities.normal / card.ability.extra.odds
			then
				return {
					card = card,
					level_up = true,
					message = localize('k_level_up_ex')
				}
			end
		end
	}
end

local function caramelldansen()

	SMODS.Joker {
		key = jokers.caramelldansen,
		pos = jokerpos.caramelldansen1,
		loc_txt = {
			name = "Caramelldansen",
			text = {
				"Played cards alternate",
				"between giving {C:blue}+#1#{} Chips",
				"and {C:red}+#2#{} Mult when scored",
			}
		},
		config = { extra = { chips = 2, mult = 2, is_left = true, state = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips,
				card.ability.extra.mult,
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		set_sprites = function(_, card, front)
			if not card.config.center.discovered and not card.bypass_discovery_center then
				return
			end
			card.children.front = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS['qualatro_QualatroJokers'], SMODS.shallow_copy(jokerpos.caramelldansen1))
			card.children.front.states.hover = card.states.hover
			card.children.front.states.click = card.states.click
			card.children.front.states.drag = card.states.drag
			card.children.front.states.collide.can = false
			card.children.front:set_role({major = card, role_type = 'Glued', draw_major = card})
		end,
		calculate = function(_, card, context)
			if
				context.individual and
				context.cardarea == G.play and
				not context.other_card.debuff
			then
				local is_left = true
				if context.blueprint then
					if not G.GAME.carameldansen_blueprint_is_left_state then
						G.GAME.carameldansen_blueprint_is_left_state = {}
					end
					if not G.GAME.carameldansen_blueprint_is_left_state[context.blueprint_card.ID] then
						G.GAME.carameldansen_blueprint_is_left_state[context.blueprint_card.ID] = true
					end
					G.GAME.carameldansen_blueprint_is_left_state[context.blueprint_card.ID] = not G.GAME.carameldansen_blueprint_is_left_state[context.blueprint_card.ID]
					is_left = G.GAME.carameldansen_blueprint_is_left_state[context.blueprint_card.ID]
				else
					card.ability.extra.is_left = not card.ability.extra.is_left
					is_left = card.ability.extra.is_left
				end
				local ret = {
					card = context.blueprint_card or card,
					message_card = context.other_card
				}
				if card.ability.extra.is_left then
					ret.message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}}
					ret.mult_mod = card.ability.extra.mult
				else
					ret.message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}
					ret.chip_mod = card.ability.extra.chips
				end

				if context.blueprint then
					return ret
				end

				ret.func = function()
					-- Trigger sprite change after giving matching color chips/mult
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						func = function()
							card.ability.extra.state = card.ability.extra.state + 1
							if card.ability.extra.state == 5 then card.ability.extra.state = 1 end
							local carpos = jokerpos[jokers.caramelldansen..tostring(card.ability.extra.state)]
							if (card.children and card.children.front) then
								card.children.front.sprite_pos.x = carpos.x
								card.children.front.sprite_pos.y = carpos.y
							end
							return true
						end
					}))
				end
				return ret
			end
		end
	}
end


local function polar_star()

	function get_last_hand_played_consecutive_count()
		local consecutive_plays = 0
		if G.GAME and G.GAME.qualatro_hands_played_cache then
			for i = 1, #G.GAME.qualatro_hands_played_cache do
				local hand_string = G.GAME.qualatro_hands_played_cache[#G.GAME.qualatro_hands_played_cache + 1 - i]
				if hand_string == G.GAME.last_hand_played then
					consecutive_plays = consecutive_plays + 1
				else
					break
				end
			end
		end
		return consecutive_plays
	end

	SMODS.Joker {
		key = jokers.polar_star,
		pos = jokerpos.polar_star,
		loc_txt = {
			name = "Polar Star",
			text = {
				"Upgrade level of",
				"{C:attention}poker hand{} played every",
				"{C:attention}#1# consecutive{} times the",
				"same poker hand is played",
			}
		},
		config = { extra = { consecutive_amount = 3 } },
		loc_vars = function(_, info_queue, card)
			local end_text = ""
			if G.GAME.qualatro_hands_played_cache and not card.debuff then
				local consecutive_plays = get_last_hand_played_consecutive_count()
				if consecutive_plays > 0 then
					local remaining_plays = card.ability.extra.consecutive_amount - consecutive_plays % card.ability.extra.consecutive_amount
					if remaining_plays > 0 and remaining_plays < card.ability.extra.consecutive_amount then
						end_text = remaining_plays .. " remaining (" .. G.GAME.last_hand_played .. ")"
					end
				end
			end
			local ret = { vars = {
				card.ability.extra.consecutive_amount,
			} }
			if #end_text then
				ret.main_end = {
					{n=G.UIT.O, config={object = DynaText({string = end_text, colours = {G.C.UI.TEXT_INACTIVE}, pop_in_rate = 9999999, silent = true, scale = 0.25, align="bm"})}},
				}
			end
			return ret
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.before and context.cardarea == G.jokers then
				local consecutive_plays = get_last_hand_played_consecutive_count()
				if consecutive_plays > 0 and consecutive_plays % card.ability.extra.consecutive_amount == 0 then
					return {
						card = card,
						level_up = true,
						message = localize('k_level_up_ex')
					}
				end
			end
		end
	}
end

function is_jazzing(consecutive_amount)
	local is_jazzing = false 
	if G.GAME and G.GAME.qualatro_hands_played_cache and #G.GAME.qualatro_hands_played_cache >= consecutive_amount then
		is_jazzing = true 
		for i = 2, 2 + consecutive_amount - 1 do
			local hand_string = G.GAME.qualatro_hands_played_cache[#G.GAME.qualatro_hands_played_cache + 1 - i]
			if hand_string == G.GAME.last_hand_played then
				is_jazzing = false
				break
			end
		end
	end
	return is_jazzing
end

local function jazz_cats_shades()

	SMODS.Joker {
		key = jokers.jazz_cats_shades,
		pos = jokerpos.jazz_cats_shades,
		loc_txt = {
			name = "Shades Dupris",
			text = {
				"Gains {C:blue}+#1#{} Chips per",
				"{C:attention}consecutive{} hand that does",
				"not match either of your",
				" last {C:attention}#2#{} played {C:attention}poker hands{}",
				"{C:inactive}(Currently {C:blue}+#3#{C:inactive} Chips)",
			}
		},
		config = { extra = { chips = 0, chip_mod = 25.1, consecutive_amount = 2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chip_mod,
				card.ability.extra.consecutive_amount,
				card.ability.extra.chips
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if 
				context.before and
				context.cardarea == G.jokers and
				not context.blueprint
			then
				if is_jazzing(card.ability.extra.consecutive_amount) then
					card.ability.extra.chips= card.ability.extra.chips + card.ability.extra.chip_mod
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{colour = G.C.BLUE, message = localize('k_upgrade_ex')}
					)
					return nil, true
				elseif card.ability.extra.chips > 0 then
					card.ability.extra.chips = 0
					return {
						message = localize('k_reset'),
						colour = G.C.CHIPS
					}
				end
			end

			if context.joker_main and card.ability.extra.chips > 0 then
				return {
					message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips,
				}
			end
		end
	}
end
local function jazz_cats_tom()

	SMODS.Joker {
		key = jokers.jazz_cats_tom,
		pos = jokerpos.jazz_cats_tom,
		loc_txt = {
			name = "Tom \"Milkbowl\" Malone",
			text = {
				"Gains {C:red}+#1#{} Mult per",
				"{C:attention}consecutive{} hand that does",
				"not match either of your",
				" last {C:attention}#2#{} played {C:attention}poker hands{}",
				"{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
			}
		},
		config = { mult = 0, extra = { bonus = 4.6, consecutive_amount = 2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.bonus,
				card.ability.extra.consecutive_amount,
				card.ability.mult
			} }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if 
				context.before and
				context.cardarea == G.jokers and
				not context.blueprint
			then
				if is_jazzing(card.ability.extra.consecutive_amount) then
					card.ability.mult = card.ability.mult + card.ability.extra.bonus
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{colour = G.C.RED, message = localize('k_upgrade_ex')}
					)
					return nil, true
				elseif card.ability.mult > 0 then
					card.ability.mult = 0
					return {
						message = localize('k_reset'),
						colour = G.C.RED
					}
				end
			end

			if context.joker_main and card.ability.mult > 0 then
				return {
					message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
					mult_mod = card.ability.mult,
				}
			end
		end
	}
end

local function jazz_cats_sphelonious()

	function get_xmult_string(xmult)
		local current_xmult = xmult
		if xmult ~= 1 then
			current_xmult = string.format("%.7f", xmult)
		end
		return current_xmult
	end

	SMODS.Joker {
		key = jokers.jazz_cats_sphelonious,
		pos = jokerpos.jazz_cats_sphelonious,
		soul_pos = jokerpos.jazz_cats_sphelonious_soul,
		loc_txt = {
			name = "Sphelonious Donk",
			text = {
				"Gains {X:mult,C:white} X#1# {} Mult per",
				"{C:attention}consecutive{} hand that does",
				"not match either of your",
				"last {C:attention}#2#{} played {C:attention}poker hands{}",
				"{C:inactive}(Currently{} {X:mult,C:white} X#3# {} {C:inactive}Mult){}",
			}
		},
		config = { extra = { xmult = 1, chips = 0, bonus = 0.1234271, consecutive_amount = 2 } },
		loc_vars = function(_, info_queue, card)
			local current_bonus = get_xmult_string(card.ability.extra.bonus)
			local current_xmult = get_xmult_string(card.ability.extra.xmult)
			return { 
				vars = { 
					current_bonus, card.ability.extra.consecutive_amount, current_xmult 
				},
			}
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 8,
		blueprint_compat = true,
		perishable_compat = false,
		calculate = function(_, card, context)
			if 
				context.before and
				context.cardarea == G.jokers and
				not context.blueprint
			then
				if is_jazzing(card.ability.extra.consecutive_amount) then
					card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.bonus 
					card_eval_status_text(card, 'extra', nil, nil, nil,
						{colour = G.C.RED, message = localize('k_upgrade_ex')}
					)
					return nil, true
				elseif card.ability.extra.xmult ~= 1 then
					card.ability.extra.xmult = 1
					return {
						message = localize('k_reset'),
						colour = G.C.RED
					}
				end
			end

			if context.joker_main and card.ability.extra.xmult ~= 1 then
				return {
					--NOTE: (Ahmayk) bypass localization to output the decimal 
					message = "X" .. get_xmult_string(card.ability.extra.xmult),
					colour = G.C.RED,
					Xmult_mod = card.ability.extra.xmult,
				}
			end
		end
	}
end

local function boykisser()
	SMODS.Joker {
		atlas = ATLAS,
		key = jokers.boykisser,
		pos = jokerpos.boykisser,
		loc_txt = {
			name = "Boykisser",
			text = {
				"At end of hand, {C:green}#2# in #1#{}",
				"chance to turn all {C:attention}played{}",
				"cards into {C:attention}Kings{} and {C:attention}Jacks{}",
				"{S:1.1,C:red,E:2}self destructs{}",
			}
		},
		config = { extra = { odds = 4 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.odds or 4, G.GAME.probabilities.normal or 1 } }
		end,
		rarity = rarity.UNCOMMON,
		cost = 5,
		blueprint_compat = true,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.after then
				local card_to_notify = card
				if context.blueprint_card then
					card_to_notify = context.blueprint_card
				end
				if pseudorandom('boykisserswoonsforhotsmokinghunks') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
					return
				end

				local gay_ranks = {"Jack", "King"}
				local first_gay_rank_index = pseudorandom_element({0, 1}, pseudoseed("whichmanwouldboykisserlikefirst?"))
				--NOTE: (Ahmayk) We do not check for debuff. consumables are able to transform debuffed cards, so boykisser shouldn't care either
				----boykisser isn't like that anyway he accepts everyone even those with disabilities
				for i = 1, #G.play.cards do
					local gay_card = G.play.cards[i]
					if not gay_card.destroyed then 
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 1.0,
							blocking = true,
							func = (function()
								local rank = gay_ranks[first_gay_rank_index + 1] 
								local quip = "Chipi!"
								--NOTE: (Ahmayk) give equal amounts of jack and kings as is possible
								--but follow the Chipi! Chapa! pattern as best we can too
								if i > 2 or (#G.play.cards == 2 and i > 1) then 
									rank = gay_ranks[(1 - first_gay_rank_index) + 1]
									quip = "Chapa!"
								end
								SMODS.change_base(gay_card, nil, rank)
								card_to_notify:juice_up()
								--card_to_notify:juice_up()
								card_eval_status_text(gay_card, 'extra', nil, nil, nil, {message = quip, colour = G.C.RED, instant = true, sound = "tarot1"})
								return true
							end)
						}))
					end
				end
				if not SMODS.is_eternal(card_to_notify) then
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 1.0,
						blocking = true,
						func = function()
							attention_text({
								text = "!", 
								scale = 0.95, 
								hold = 0.5,
								backdrop_colour = G.C.BLACK,
								major = G.jokers,
								offset = {x = 0, y = 2}
							})
							play_sound('qualatro_snd_ehurt1', 0.8+percent*0.2, 1)
							card_to_notify.states.drag.can = false
							card_to_notify.area:remove_card(card_to_notify)
							card_to_notify:drag({x = - G.ROOM.T.w - 1, y = G.ROOM.T.h / 2 })
							return true
						end
					}))

					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 2.0,
						blocking = false,
						func = function()
							card_to_notify:remove()
							return true 
						end
					}))

				end
			end
		end
	}
end

local function nobodys_hero()
	SMODS.Joker {
		key = jokers.nobodys_hero,
		pos = jokerpos.nobodys_hero,
		loc_txt = {
			name = 'Nobody\'s Hero',
			text = {
				"At end of hand, {C:attention}Jokers{}",
				"that have {C:attention}triggered{}",
				"{C:attention}#2#{} times this hand",
				"give {C:blue}+#1#{} Chips"
			}
		},
		config = { extra = { chips = 35, zero = 0 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.chips,
				card.ability.extra.zero,
			} }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,

		calculate = function(_, card, context)
			if context.final_scoring_step and context.other_joker_final_scoring_step then
				--print("calculating cardID:", card.ID, "other joker id", context.other_joker_final_scoring_step.ID)
				if 
					not G.GAME.joker_results_table or 
					G.GAME.joker_results_table[context.other_joker_final_scoring_step.ID] ~= true
				then
					local card_to_notify = context.blueprint_card or card
					--NOTE(Ahmayk) we need to mark these jokers as triggered to the table immediatley for certain edge cases to be accurate
					add_to_joker_results_table(card_to_notify.ID)
					add_to_joker_results_table(context.other_joker_final_scoring_step.ID)
					return {
						message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
						chip_mod = card.ability.extra.chips,
						juice_card = card_to_notify,
						message_card = context.other_joker_final_scoring_step,
					}
				end
			end
		end
	}
end

local function together_now()
	SMODS.Joker {
		key = jokers.together_now,
		pos = jokerpos.together_now,
		loc_txt = {
			name = 'Together Now!',
			text = {
				"At end of hand, {C:attention}Jokers{}",
				"that have {C:attention}triggered{}",
				"at least {C:attention}once{} this hand",
				"give {X:mult,C:white} X#1# {} Mult"
			}
		},
		config = { extra = { xmult = 1.2 } },
		loc_vars = function(_, info_queue, card)
			return { vars = {
				card.ability.extra.xmult,
			} }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,

		calculate = function(_, card, context)
			if context.final_scoring_step and context.other_joker_final_scoring_step then
				--print("calculating cardID:", card.ID, "other joker id", context.other_joker_final_scoring_step.ID)
				if 
					G.GAME.joker_results_table and
					G.GAME.joker_results_table[context.other_joker_final_scoring_step.ID] == true
				then
					local card_to_notify = context.blueprint_card or card
					--NOTE(Ahmayk) we need to mark these jokers as triggered to the table immediatley for certain edge cases to be accurate
					add_to_joker_results_table(card_to_notify.ID)
					add_to_joker_results_table(context.other_joker_final_scoring_step.ID)
					return {
						message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
						colour = G.C.RED,
						Xmult_mod = card.ability.extra.xmult,
						juice_card = card_to_notify,
						message_card = context.other_joker_final_scoring_step,
					}
				end
			end
		end
	}
end

local function limited_liability_partnership()

	SMODS.Joker {
		key = jokers.limited_liability_partnership,
		pos = jokerpos.limited_liability_partnership,
		loc_txt = {
			name = "Limited Liability Partnership",
			text = {
				"This Joker {C:attention}steals half{}",
				"of your {C:money}blind cashout{}",
				"and gains {X:mult,C:white} X#1# {} Mult",
				"for each {C:money}dollar{} stolen",
				"{C:inactive}(Stolen: {C:money}$#2#{C:inactive}){}",
			}
		},
		config = { extra = { xmult = 0.06, stolen_money = 0 } },
		loc_vars = function(self, info_queue, card)
			local key = self.key
			local wario_cards = SMODS.find_card('j_qualatro_limited_liability_partnership')
			if #wario_cards > 1  then
				key = self.key .. "_alt"
			end
			return { 
				vars = {
					card.ability.extra.xmult,
					card.ability.extra.stolen_money,
				}, 
				key = key
			}
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = false,
		perishable_compat = false,
		calculate = function(_, card, context)
			if context.joker_main and to_big(card.ability.extra.stolen_money) > to_big(0) then
				local xmult_total = 1 + card.ability.extra.xmult * card.ability.extra.stolen_money
				return {
					message = localize{type='variable',key='a_xmult',vars={xmult_total}},
					colour = G.C.RED,
					Xmult_mod = xmult_total
				}
			end
		end
	}
end

function format_dollar_string(amount)
	return (to_big(amount) < to_big(-0.01) and '-' or '') .. localize("$") .. tostring(math.abs(to_big(amount)))
end

local function ajit_pai()

	SMODS.Joker {
		key = jokers.ajit_pai,
		pos = jokerpos.ajit_pai,
		loc_txt = {
			name = "Ajit Pai",
			text = {
					"This Joker gains {C:money}#1#{} dollars",
					"and {X:mult,C:white} X#2# {} Mult every hand,",
					"{S:1.1,C:red,E:2}self destructs{} when you",
					"have {C:money}#5#{} dollars or less",
					"{C:inactive}(Currently: {C:money}#3#{C:inactive} and {X:mult,C:white} X#4#{C:inactive}){}",
			}
		},
		config = { extra = { bonus_money = -1, bonus_xmult = 0.3, money = 0, xmult = 1, zero = 0 } },
		loc_vars = function(self, info_queue, card)
			return { 
				vars = {
					format_dollar_string(card.ability.extra.bonus_money),
					card.ability.extra.bonus_xmult,
					format_dollar_string(card.ability.extra.money),
					card.ability.extra.xmult,
					card.ability.extra.zero,
				}, 
			}
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		perishable_compat = false,
		eternal_compat = false,
		calculate = function(_, card, context)
			if context.cardarea == G.jokers and context.before and not context.blueprint then
				card.ability.extra.money = to_big(card.ability.extra.money) + to_big(card.ability.extra.bonus_money)
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.bonus_xmult
				--NOTE: (Ahmayk) should these have colors? if yes, then the patch we have for ride the bus and obelisk 
				--that forces a message to return for them should also have colors matching their variables 
				return {
					card = card,
					message = format_dollar_string(card.ability.extra.money),
					extra = {
						card = card,
						message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}
					}
				}
			end

			if context.joker_main then
				local ret = {}
				if card.ability.extra.xmult ~= 1  then
					ret.x_mult = card.ability.extra.xmult
				end
				if to_big(card.ability.extra.money) ~= to_big(0) then
					ret.dollars = to_number(card.ability.extra.money)
				end
				return ret
			end

			if context.after then
				G.E_MANAGER:add_event(Event({
					trigger = "before",
					func = function()
						if to_big(G.GAME.dollars) <= to_big(card.ability.extra.zero) then
							G.E_MANAGER:add_event(Event({
								trigger = "before",
								delay = 1.0,
								func = function()
									local card_to_notify = context.blueprint_card or card
									SMODS.destroy_cards(card_to_notify, nil, nil, true)
									card_eval_status_text(card_to_notify, 'extra', nil, nil, nil, {message = localize("qua_snapped_ex"), colour = G.C.RED})
									return true
								end
							}))
						end
						return true
					end
				}))
			end
		end
	}
end


local function nozomi()

	--NOTE: (Ahmayk) at time of this mod's release, smods has a breaking change to handling card area limits that improves the implementation.
	--however this change is only in the current development branch and not the released stable version
	--and I couldn't figure out a suitable implementation of nozomi that covers both implementations
	--so to not have any breaking changes in the near future, both nozomi implementations are included here 
	--commit of new smod features: https://github.com/Steamodded/smods/commit/27e0be264d38271898b82697b5962f72af8bb4cf
	if CardArea.count_property then

		--NOTE: (Ahmayk) newer version that uses improved smods features for dynamic card limits, more robust and stable

		local function  get_nozomi_card_limit(card)
			local total_slots = G.jokers:count_property('card_limit') - card.ability.card_limit + (G.jokers.config.card_limits.base or 0) + (G.jokers.config.card_limits.mod or 0)
			return math.max(0, card.ability.extra.nine_joker_slots - total_slots)
		end

		SMODS.Joker {
			key = jokers.nozomi,
			pos = jokerpos.nozomi,
			soul_pos = jokerpos.nozomi_soul,
			loc_txt = {
				name = "Nozomi",
				text = {
						"Always have at least",
						"{C:attention}#1# Joker Slots",
						"Cannot be sold or destroyed",
						"unless Jokers have room",
						"{C:inactive}(Currently: +#2# Joker slots){}",
				},
				unlock = {
					"{E:1,s:1.3}?????"
				}
			},
			config = { extra = { nine_joker_slots = 9 } },
			loc_vars = function(self, info_queue, card)
				local slots = card.ability.card_limit or 0
				--NOTE: (Ahmayk) show how many joker slots we would add if we haven't yet
				--but only if there are no nozomis
				if not next(SMODS.find_card(jokerkey.nozomi)) and G.jokers then
					slots = get_nozomi_card_limit(card)
				end
				return { vars = { card.ability.extra.nine_joker_slots, slots } }
			end,
			rarity = rarity.LEGENDARY,
			unlocked = false,
			atlas = ATLAS,
			cost = 20,
			blueprint_compat = false,
			perishable_compat = false,
			update = function (_, card, front)
				if G.jokers and G.jokers.cards then
					local is_owned_joker = false
					for _, area in ipairs(SMODS.get_card_areas('jokers')) do
						for _, v in pairs(area.cards) do
							if v == card then
								is_owned_joker = true
								break
							end
						end
					end
					if is_owned_joker then
						card.ability.card_limit = get_nozomi_card_limit(card)
					end
				end
			end,
			calculate = function(_, card, context)
				--NOTE: (Ahmayk) must have room if joker is removed, otherwise is eternal
				if context.check_eternal and context.other_card == card then
					local limit_after_sell = G.jokers.config.card_limits.total_slots
					if card.edition and card.edition.negative then
						limit_after_sell = limit_after_sell - 1
					end
					return {
						no_destroy = G.jokers.config.card_count - 1 > limit_after_sell - card.ability.card_limit
					}
				end
			end
		}

	else

		--NOTE: (Ahmayk) older version that does things more manually
		--is unfortunitally not compatible with other effects that change the joker limit (ie antimatter)

		SMODS.Joker {
			key = jokers.nozomi,
			pos = jokerpos.nozomi,
			soul_pos = jokerpos.nozomi_soul,
			loc_txt = {
				name = "Nozomi",
				text = {
						"Always have at least",
						"{C:attention}#1# Joker Slots",
						"Cannot be sold or destroyed",
						"unless Jokers have room",
						"{C:inactive}(Currently: +#2# Joker slots){}",
				},
				unlock = {
					"{E:1,s:1.3}?????"
				}
			},
			config = { extra = { nine_joker_slots = 9, bonus_joker_slots = 0, previously_processed_limit = nil } },
			loc_vars = function(self, info_queue, card)
				local mod = card.ability.extra.bonus_joker_slots
				--NOTE: (Ahmayk) show how many joker slots we would add if we haven't yet
				--but only if there are no nozomis
				if not next(SMODS.find_card(jokerkey.nozomi)) and G.jokers then
					mod = card.ability.extra.nine_joker_slots - G.jokers.config.card_limit
				end
				return { vars = { card.ability.extra.nine_joker_slots, math.max(0, mod) } }
			end,
			rarity = rarity.LEGENDARY,
			unlocked = false,
			atlas = ATLAS,
			cost = 20,
			blueprint_compat = false,
			perishable_compat = false,
			update = function (_, card, front)
				if G.jokers and G.jokers.cards then
					local is_owned_joker = false
					for _, area in ipairs(SMODS.get_card_areas('jokers')) do
						for _, v in pairs(area.cards) do
							if v == card then
								is_owned_joker = true
								break
							end
						end
					end
					if is_owned_joker then
						if card.ability.extra.previously_processed_limit == nil then
							card.ability.extra.bonus_joker_slots = math.max(0, card.ability.extra.nine_joker_slots - G.jokers.config.card_limit)
							G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.bonus_joker_slots
							card.ability.extra.previously_processed_limit = G.jokers.config.card_limit
						elseif 
							card.ability.extra.previously_processed_limit ~= G.jokers.config.card_limit
						then
							local diff = G.jokers.config.card_limit - card.ability.extra.previously_processed_limit 
							card.ability.extra.bonus_joker_slots = card.ability.extra.bonus_joker_slots - diff  
							if 
								(card.ability.extra.bonus_joker_slots >= 0 and diff > 0) or 
								(card.ability.extra.bonus_joker_slots > 0 and diff < 0)
							then
								G.jokers.config.card_limit = G.jokers.config.card_limit - diff 
							end
							card.ability.extra.previously_processed_limit = G.jokers.config.card_limit
						end
					end
				end
			end,
			remove_from_deck = function(_, card, from_debuff)
				G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.bonus_joker_slots 
			end,
			calculate = function(_, card, context)
				--NOTE: (Ahmayk) must have room if joker is removed, otherwise is eternal
				if context.check_eternal and context.other_card == card then

					local limit_after_sell = G.jokers.config.card_limit
					if card.edition and card.edition.negative then
						limit_after_sell = limit_after_sell - 1
					end
					local eternal = G.jokers.config.card_count - 1 > limit_after_sell - card.ability.extra.bonus_joker_slots
					return {
						no_destroy = eternal
					}
				end
			end
		}
	end

end


--NOTE: (Ahmayk) This is all the data required to make a table of a fake card that will work with copy_card()
--inactive_card_data can be passed into copy_card() as if it were a real card 
--no guarentees that anything else will work. ducks can only fly so high
--(I am making fun of duck typing, am very annoyed this is the best solution i think we can do for this)
function create_inactive_card_data(card)
	local inactive_card_data = nil
	if card then
		inactive_card_data = {}
		inactive_card_data.config = {}
		inactive_card_data.T = copy_table(card.T)
		inactive_card_data.config.center = card.config.center
		inactive_card_data.config.card = card.config.card
		inactive_card_data.ability = copy_table(card.ability)
		inactive_card_data.edition = copy_table(card.edition)
		inactive_card_data.seal = copy_table(card.seal)
		inactive_card_data.params = copy_table(card.params)
		inactive_card_data.debuff = card.debuff
		inactive_card_data.pinned = card.pinned
	end
	return inactive_card_data
end

local function bites_the_dust()

	SMODS.Joker {
		key = jokers.bites_the_dust,
		pos = jokerpos.bites_the_dust,
		loc_txt = {
			name = "BITES THE DUST",
			text = {
				"Obtain {C:attention}#1#{} copies of the last",
				"{C:red}destroyed{} playing card this {C:attention}ante{}",
				"when {C:attention}Boss Blind{} is defeated",
				"{C:inactive,s:0.7}Rightmost cards always destroyed last{}",
			}
		},
		config = { extra = { copy_count = 3 } },
		loc_vars = function(self, info_queue, card)
			local key = self.key
			local last_destroyed_card_name = ""
			local colous = {}
			if G.GAME.last_destroyed_inactive_card_data then
				key = self.key .. "_alt"
				if G.GAME.last_destroyed_inactive_card_data.ability.name == 'Stone Card' then
					colours = {G.C.IMPORTANT}
					last_destroyed_card_name = 'Stone Card' 
				else
					colours = {G.C.SUITS[G.GAME.last_destroyed_inactive_card_data.config.card.suit]}
					last_destroyed_card_name = G.GAME.last_destroyed_inactive_card_data.config.card.name
				end
				--TODO: (Ahmayk) stretch goal idea: show the card itself in a tooltip since it's impratical to
				--show all card data in the desc (seal enhancement etc)
			end
			return { 
				vars = { 
					card.ability.extra.copy_count,
					last_destroyed_card_name,
					colours = colours,
				},
				key = key, 
			}
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if 
				context.end_of_round and
				not context.individual and
				not context.repetition and
				G.GAME.blind.boss and
				G.GAME.last_destroyed_inactive_card_data
			then 
				local card_to_notify = context.blueprint_card or card
				for i = 1, card.ability.extra.copy_count do
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 1.0,
						func = function()
							G.playing_card = (G.playing_card and G.playing_card + 1) or 1
							local _card = copy_card(G.GAME.last_destroyed_inactive_card_data, nil, nil, G.playing_card)

							_card:add_to_deck()
							card_to_notify:juice_up()
							G.deck.config.card_limit = G.deck.config.card_limit + 1
							table.insert(G.playing_cards, _card)
							G.hand:emplace(_card)
							card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize("qua_revived_ex"), instant = true})
							_card:start_materialize(nil, false)
							draw_card(G.hand, G.deck)
							playing_card_joker_effects({_card})

							if i == card.ability.extra.copy_count then
								G.GAME.last_destroyed_inactive_card_data = nil
							end
							return true
						end
					})) 
				end
			end
		end
	}
end

local function etika_reveal()

	local function etika_get_hype_joker_key(card)

		local result = nil

		if card.ability and card.ability.extra then
			result = card.ability.extra.hype_joker_key
		end

		--NOTE:(Ahmayk) we have to do some bullshit to account for our ability data not being loaded when we set the sprite
		--this is storing the value temporarily
		if not G.GAME.qualatro_temp_etika_hype_joker_keys then
			G.GAME.qualatro_temp_etika_hype_joker_keys = {}
		end

		if G.GAME.qualatro_temp_etika_hype_joker_keys[card.unique_val] then
			result = G.GAME.qualatro_temp_etika_hype_joker_keys[card.unique_val]
		end

		if not result then
			result = "j_joker"
			if G.playing_cards and
				(card.config.center.discovered or card.bypass_discovery_center)
			then
				local _pool, _pool_key = get_current_pool("Joker")
				local center = pseudorandom_element(_pool, pseudoseed('etika_' .. _pool_key))
				local it = 1
				while center == 'UNAVAILABLE' do
					it = it + 1
					center = pseudorandom_element(_pool, pseudoseed('etika_' .. _pool_key..'_resample'..it))
				end
				center = G.P_CENTERS[center]
				result = center.key
			end
		end

		G.GAME.qualatro_temp_etika_hype_joker_keys[card.unique_val] = result
		if card.ability and card.ability.extra then
			card.ability.extra.hype_joker_key = result
		end

		return result
	end

	local function etika_create_quad(atlas, pos)
		local quad = love.graphics.newQuad(
			pos.x*atlas.px,
			pos.y*atlas.py,
			atlas.px,
			atlas.py, atlas.image:getDimensions())
		return quad
	end

	local function draw_and_get_etika_sprite(card, etika_sprite_pos)

		if not G.etika_atlas_cache then
			G.etika_atlas_cache = {}
		end

		local hype_joker_key = etika_get_hype_joker_key(card)
		local other_center = G.P_CENTERS[hype_joker_key]
		local atlas_name = "etikaAtlas_" .. other_center.key .. '_' .. etika_sprite_pos.x .. '_' .. etika_sprite_pos.y
		local etikaAtlas = G.etika_atlas_cache[atlas_name] or nil

		if not etikaAtlas then
			local etika_center = card.config.center
			local etika_atlas = G.ASSET_ATLAS[etika_center.atlas or 'Joker']
			local etika_quad = etika_create_quad(etika_atlas, etika_sprite_pos)
			local etika_quad_border = etika_create_quad(etika_atlas, {x = 20, y = 0})

			local other_atlas = G.ASSET_ATLAS[other_center.atlas or 'Joker']
			local other_quad = etika_create_quad(other_atlas, other_center.pos)
			local other_quad_soul = nil
			if other_center.soul_pos then
				other_quad_soul = etika_create_quad(other_atlas, other_center.soul_pos)
			end

			local x, y, w, h = etika_quad:getViewport()
			--NOTE: (Ahmayk) Needs to be x2 as big to look right
			local scaling = 2
			w = w * scaling 
			h = h * scaling
			local border_width = w * (2/69)
			local scratch_canvas = love.graphics.newCanvas(w, h, {type = '2d', readable = true})
			scratch_canvas:setFilter('linear', 'linear')
			love.graphics.setCanvas(scratch_canvas)
			--love.graphics.clear(0, 0, 0, 1)
			love.graphics.setColor(G.C.WHITE)
			love.graphics.draw(etika_atlas.image, etika_quad, 0, 0, 0, 1*scaling, 1*scaling)
			love.graphics.draw(other_atlas.image, other_quad, w / 2 - border_width, border_width, 0, 0.5*scaling, 0.5*scaling)
			if other_quad_soul then
				love.graphics.draw(other_atlas.image, other_quad_soul, w / 2 - border_width, border_width, 0, 0.5*scaling, 0.5*scaling)
			end
			love.graphics.draw(etika_atlas.image, etika_quad_border, 0, 0, 0, 1*scaling, 1*scaling)
			love.graphics.setCanvas()
			local canvas_image_data = scratch_canvas:newImageData()

			etikaAtlas = {}
			etikaAtlas.name = atlas_name 
			etikaAtlas.image = love.graphics.newImage(canvas_image_data, {mipmaps = true, dpiscale = 1 })
			etikaAtlas.px = w
			etikaAtlas.py = h
			G.etika_atlas_cache[atlas_name] = etikaAtlas

            local mipmap_level = SMODS.config.graphics_mipmap_level_options[SMODS.config.graphics_mipmap_level]
            if mipmap_level and mipmap_level > 0 then
                etikaAtlas.image:setMipmapFilter('linear', mipmap_level)
            end

			scratch_canvas:release()
			canvas_image_data:release()
		end

		return Sprite(card.T.x, card.T.y, card.T.w, card.T.h, etikaAtlas)
	end

	local function etika_look_for_and_get_hype(card_etika, area)
		if 
			area and
			area.cards and
			card_etika.area and
			not card_etika.area.config.collection
		then
			local hype_joker_key = etika_get_hype_joker_key(card_etika)
			for _, card in ipairs(area.cards) do
				if card.config.center.key == hype_joker_key then
					local found_alraedy = false
					for _, v in ipairs(card_etika.ability.extra.found_hype_ids) do
						if v == card.ID then
							found_alraedy = true
							break
						end
					end

					if not found_alraedy then
						table.insert(card_etika.ability.extra.found_hype_ids, card.ID)
						delay(0.5, 'other')

						if G.GAME.played_etika_indexes == nil or #G.GAME.played_etika_indexes >= 5 then
							G.GAME.played_etika_indexes = {}
						end
						local sound_index = 1
						local it = 0
						while true do
							it = it + 1
							sound_index = math.floor(pseudorandom("etika_sound") * 5) + 1
							local played_already = false 
							for _, v in ipairs(G.GAME.played_etika_indexes) do
								if v == sound_index then
									played_already = true
									break
								end
							end
							if not played_already or it > 99 then
								break
							end
						end

						for i = 1, card_etika.ability.extra.repeat_count do
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								delay = 1.0,
								func = function()
									if i == 1 then
										play_sound("qualatro_etika"..sound_index, 0.8)
										table.insert(G.GAME.played_etika_indexes, sound_index)
									end
									card_etika.ability.extra.xmult = card_etika.ability.extra.xmult + card_etika.ability.extra.bonus_xmult
									card_etika.ability.extra.current_repeat = card_etika.ability.extra.current_repeat + 1
									if card_etika.ability.extra.current_repeat == (card_etika.ability.extra.repeat_count - 1) then
										card_etika.ability.extra.current_repeat = 0
									end
									card_etika:set_sprites(card_etika.config.center)
									card_eval_status_text(card_etika, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = 'a_xmult', vars = {card_etika.ability.extra.xmult}, instant = true}})
									G.ROOM.jiggle = G.ROOM.jiggle + 3
									return true
								end
							}), 'other')
						end
					end
				end
			end
		end
	end

	SMODS.Joker {
		key = jokers.etika_reveal,
		pos = {x=0,y=0},
		config = { extra = { xmult = 1, bonus_xmult = 0.1, repeat_count = 20, current_repeat = 0, hype_joker_key = nil, found_hype_ids = {} } },
		loc_vars = function(self, info_queue, card)
			local hype_joker_key = etika_get_hype_joker_key(card)
			local joker_name = localize({ type = "name_text", set = "Joker", key = card.ability.extra.hype_joker_key })
			return {
				vars = {
					card.ability.extra.bonus_xmult,
					card.ability.extra.repeat_count,
					joker_name,
					card.ability.extra.xmult,
				},
				key = self.key,
			}
		end,
		rarity = rarity.RARE,
		atlas = "QualatroEtika",
		cost = 7,
		blueprint_compat = true,
		perishable_compat = false,
		generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
			if card.area and card.area.config.collection then
				card:update(0.016)
			end
			local target = {
				type = "descriptions",
				key = self.key,
				set = self.set,
				nodes = desc_nodes,
				vars = specific_vars or {},
			}
			local res = {}
			if self.loc_vars and type(self.loc_vars) == "function" then
				res = self:loc_vars(info_queue, card) or {}
				target.vars = res.vars or target.vars
				target.key = res.key or target.key
				target.set = res.set or target.set
			end

			local hype_joker_key = etika_get_hype_joker_key(card)
			if hype_joker_key then
				local hype_joker_name = localize({ type = "name_text", set = "Joker", key = hype_joker_key })
				local template_name = localize({ type = "name_text", set = "Joker", key = self.key .. "_template" })

				local generated_parsed = nil 

				--NOTE: (Ahmayk) this monstrocity is copied from Card:generate_UIBox_ability_table(vars_only)
				local show_title_as_undiscovered = 
					not card.bypass_lock and
					card.config.center.unlocked ~= false and
					not card.config.center.discovered and 
					((card.area ~= G.jokers and card.area ~= G.consumeables and card.area) or not card.area)

				if show_title_as_undiscovered then
					generated_parsed = loc_parse_string(G.localization.descriptions.Other.undiscovered_joker.name)
				else
					generated_parsed = loc_parse_string(string.upper(hype_joker_name) .. template_name)
				end

				--NOTE: (Ahmayk) modified from localize() in misc_functions.lua
      			local final_line = {}
				local part = generated_parsed[1] 
				local assembled_string = ''
				for _, subpart in ipairs(part.strings) do
					assembled_string = assembled_string..(type(subpart) == 'string' and subpart or format_ui_value(args.vars[tonumber(subpart[1])]) or 'ERROR')
				end
				final_line[#final_line+1] = {n=G.UIT.C, config={align = "m", colour = part.control.X and loc_colour(part.control.X) or nil, r = 0.05, padding = 0.03, res = 0.15}, nodes={}}
				final_line[#final_line].nodes[1] = {n=G.UIT.O, config={
						object = DynaText({string = {assembled_string},
						colours = {(part.control.C and loc_colour(part.control.C)) or G.C.UI.TEXT_LIGHT},
						bump = true,
						silent = true,
						pop_in = 0,
						pop_in_rate = 4,
						maxw = 5,
						shadow = true,
						y_offset = -0.6,
						spacing = math.max(0, 0.32*(17 - #assembled_string)),
						font = SMODS.Fonts[part.control.f] or G.FONTS[tonumber(part.control.f)],
						scale =  (0.55 - 0.004*#assembled_string)*(part.control.s and tonumber(part.control.s) or 1)
					})
				}}
				full_UI_table.name = final_line
			else
				if desc_nodes == full_UI_table.main and not full_UI_table.name then
					full_UI_table.name = localize({ type = "name", set = target.set, key = target.key, nodes = full_UI_table.name })
				elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
					desc_nodes.name = localize({ type = "name_text", key = target.key, set = target.set })
				end
			end

			if specific_vars and specific_vars.debuffed and not res.replace_debuff then
				target = {
					type = "other",
					key = "debuffed_" .. (specific_vars.playing_card and "playing_card" or "default"),
					nodes = desc_nodes,
				}
			end
			localize(target)
		end,
		update = function (_, card, front)

			--NOTE: (Ahmayk) required to always show defualt Joker in collection
			--(can't seem to do it on load because the card is not set in an area yet don't think)
			if 
				card.area and
				card.area.config.collection and
				card.ability.extra and
				card.ability.extra.hype_joker_key ~= 'j_joker' and
				G.GAME.qualatro_temp_etika_hype_joker_keys and
				(card.config.center.discovered or card.bypass_discovery_center)
			then
				card.ability.extra.hype_joker_key = 'j_joker'
				G.GAME.qualatro_temp_etika_hype_joker_keys[card.unique_val] = 'j_joker'
				card:set_sprites(card.config.center)
			end

			if G.GAME then
				etika_look_for_and_get_hype(card, G.jokers)
				if G.STATE == G.STATES.SHOP then 
					etika_look_for_and_get_hype(card, G.shop_jokers)
				else
					etika_look_for_and_get_hype(card, G.pack_cards)
				end
			end
		end,
		set_sprites = function(_, card, front)
			if not card.config.center.discovered and not card.bypass_discovery_center then
				return
			end
			card.children.center = draw_and_get_etika_sprite(card, {x=card.ability and card.ability.extra and card.ability.extra.current_repeat or 0, y=0})
			card.children.center.states.hover = card.states.hover
			card.children.center.states.click = card.states.click
			card.children.center.states.drag = card.states.drag
			card.children.center.states.collide.can = false
			card.children.center:set_role({major = card, role_type = 'Glued', draw_major = card})
		end,
		calculate = function(_, card, context)
			if context.joker_main and card.ability.extra.xmult > 1 then
				return {
					message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
					colour = G.C.RED,
					Xmult_mod = card.ability.extra.xmult
				}
			end
		end,
	}
end

local function kingly_mask()

	SMODS.Joker {
		key = jokers.kingly_mask,
		pos = jokerpos.kingly_mask,
		loc_txt = {
			name = "Kingly Mask",
			text = {
				"{C:attention}Face cards{} count as",
				"{C:attention}Steel{} cards during",
				"a {C:attention}Boss Blind{}",
			}
		},
		config = { extra = { } },
		loc_vars = function(self, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = false,
		calculate = function(_, card, context)
			if 
				G.GAME.blind.boss and
				context.check_enhancement and
				context.other_card
			then
				if not G.qualatro_enhancement_recursion_lock then
					G.qualatro_enhancement_recursion_lock = {}
				end
				if not G.qualatro_enhancement_recursion_lock[jokers.kingly_mask] then
					G.qualatro_enhancement_recursion_lock[jokers.kingly_mask] = true
					local is_face = context.other_card:is_face()
					G.qualatro_enhancement_recursion_lock[jokers.kingly_mask] = false
					if is_face then
						return {
							m_steel = true
						}
					end
				end
			end
		end
	}
end

local function nintendo_power()

	SMODS.Joker {
		key = jokers.nintendo_power,
		pos = jokerpos.nintendo_power,
		loc_txt = {
			name = "Nintendo Power",
			text = {
				"{C:attention}Retrigger{} scored cards",
				"if played hand contains",
				"a {C:chips}Bonus{} card",
				"and a {C:red}Mult{} card",
			}
		},
		config = { extra = { hand_is_powerful = false } },
		loc_vars = function(self, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 6,
		blueprint_compat = true,
		calculate = function(_, card, context)

			if context.cardarea == G.jokers and context.before and not context.blueprint then
				local has_bonus = false
				local has_mult = false
				for i = 1, #context.full_hand do
					local enhancements = SMODS.get_enhancements(context.full_hand[i])
					if enhancements["m_mult"] then has_mult = true end
					if enhancements["m_bonus"] then has_bonus = true end
					if has_bonus and has_mult then
						card.ability.extra.hand_is_powerful = true
						break
					end
				end
			end
			if context.after and not context.blueprint then
				card.ability.extra.hand_is_powerful = false
			end

			if
				context.repetition and
				context.cardarea == G.play and
				card.ability.extra.hand_is_powerful
				then
					return {
						message = localize("k_again_ex"),
						repetitions = 1,
						card = card,
					}
				end
			end
	}
end

-- Gotta do this to sort the collection
local function init_donut(i)
	return SMODS.Joker {
		key = jokers['donut'..i],
		pos = jokerpos['donut'..i],
		loc_txt = {
			name = "Donut",
			text = {
				"{C:dark_edition}+1{} Joker Slot"
			}
		},
		yes_pool_flag = 'never',
		config = { extra = { joker_slots = 1 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { card.ability.extra.joker_slots } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 1,
		blueprint_compat = false,
		calculate = function(_, card, context)

		end,
		add_to_deck = function(_, card)
			G.jokers.config.card_limit = G.jokers.config.card_limit + 1
		end,
		remove_from_deck = function(_, card, from_debuff)
			if from_debuff then
				local limit_after = G.jokers.config.card_limit
				if (card.edition and card.edition.negative) then
					limit_after = limit_after - 1
				end
				local can_be_removed = limit_after - 1 > G.jokers.config.card_count - card.ability.extra.joker_slots 
				if not can_be_removed then
					SMODS.destroy_cards(card, nil, nil, true)
					card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = "Impossible!"})
				end
			end
			G.jokers.config.card_limit = G.jokers.config.card_limit - 1
		end
	}
end

local function dr_andonuts(init_andonuts, init_donuts)
	local andonuts = SMODS.Joker {
		key = jokers.dr_andonuts,
		pos = jokerpos.dr_andonuts,
		loc_txt = {
			name = "Dr. Andonuts",
			text = {
				"At start of round,",
				"create a {C:attention}Donut{}"
			}
		},
		config = {},
		loc_vars = function(_, info_queue, card)
			info_queue[#info_queue+1] = G.P_CENTERS.j_qualatro_donut1
			return { vars = {  } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.first_hand_drawn then
				local _card = context.blueprint_card or card
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.4,
					func = function()
						SMODS.add_card({
							key = "j_qualatro_donut"..pseudorandom_element({1,2,3,4,5,6,7,8}), -- dont care
						})
						play_sound('timpani')
						_card:juice_up()
						return true
					end
				}))
			end
		end
	}

	for i = 1, 4 do
		donut = init_donut(i)
	end

	andonuts.loc_vars = function(_, info_queue, card)
		info_queue[#info_queue+1] = donut
		return { vars = { } }
	end
end

local function other_donuts()
	for i = 5, 8 do
		donut = init_donut(i)
	end
end

local function weezer()
	-- Weezer
	SMODS.Joker {
		key = jokers.weezer,
		pos = jokerpos.weezer,
		loc_txt = {
			name = "Joker but bonus cards are retriggered",
			text = {
				"Can we just appreciate",
				"how much effort he",
				"puts into his effect?"
			}
		},
		pixel_size = {
			w = 71,
			h = 71
		},
		config = { },
		loc_vars = function(_, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.cardarea == G.play and context.repetition and not context.repetition_only then
				if SMODS.has_enhancement(context.other_card, 'm_bonus') and contains({G.hand, G.play}, context.cardarea) then
					return {
						message = localize("k_again_ex"),
						repetitions = 1,
						card = card
					}
				end
			end
		end
	}
end

local function djpk()
	-- DJPK
	SMODS.Joker {
		key = jokers.djpk,
		pos = jokerpos.djpk,
		loc_txt = {
			name = "DJ Professor K.",
			text = {
				"On {C:attention}final{} hand of round,",
				"convert all played cards",
				"into {C:attention}Kings{}"
			}
		},
		config = { },
		loc_vars = function(_, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.RARE,
		atlas = ATLAS,
		cost = 9,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.before_hand_evaluation and G.GAME.current_round.hands_left == 0 then
				local hand = SMODS.shallow_copy(G.play.cards)

				local card_to_notify = context.blueprint_card or card
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					card_to_notify:juice_up()
					play_sound('tarot1')
					return true 
				end }))

        for i=1, #hand do
					local percent = 1.15 - (i-0.999)/(#hand-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('card1', percent);hand[i]:juice_up(0.3, 0.3);return true end }))
				end

        delay(0.2)

				for i=1, #hand do
					G.E_MANAGER:add_event(Event({func = function()
						local card = hand[i]
						hand[i]:set_base(G.P_CARDS[SMODS.Suits[suit or card.base.suit].card_key..'_K'], true)
						return true 
					end }))
				end  

        for i=1, #hand do
					local percent = 0.85 + (i-0.999)/(#hand-0.998)*0.3
					G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() hand[i]:flip();play_sound('tarot2', percent, 0.6);hand[i]:juice_up(0.3, 0.3);return true end }))
        end

        delay(0.5)
			end
		end
	}
end

local function cnas()
	function is_day()
		local hour = os.date("*t").hour
		return hour > 5 and hour < 22
	end

	-- Cartoon Gunner
	SMODS.Joker {
		key = jokers.cartoon_gunner,
		pos = jokerpos.cartoon_gunner,
		loc_txt = {
			name = "Cartoon Gunner",
			text = {
				"Each scoring",
				"{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, {C:attention}5{}, and {C:attention}6{}",
				"gives {C:red}+#1#{} Mult",
			}
		},
		config = { extra = { mult = 3 }},
		loc_vars = function(_, info_queue, card)
			return { vars = { 
				card.ability.extra.mult
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		in_pool = function(_, args)
			return not next(SMODS.find_card(jokerkey.siiva_swim))
		end,
		calculate = function(_, card, context)
			if context.individual 
			and context.cardarea == G.play 
			and not context.end_of_round
			and contains({2,3,4,5,6}, context.other_card:get_id()) then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card,
					juice_card = context.blueprint_card or card,
				}
			end
		end,
		in_pool = function(_, args)
			return is_day()
		end
	}

	-- siiva swim
	SMODS.Joker {
		key = jokers.siiva_swim,
		pos = jokerpos.siiva_swim,
		loc_txt = {
			name = "[siiva swim]",
			text = {
				"Each scoring",
				"{C:attention}7{}, {C:attention}8{}, {C:attention}9{}, {C:attention}10{}, and {C:attention}Ace{}",
				"gives {C:red}+#1#{} Mult",
			}
		},
		config = { extra = { mult = 3 }},
		loc_vars = function(_, info_queue, card)
			return { vars = { 
				card.ability.extra.mult
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		in_pool = function(_, args)
			return not next(SMODS.find_card(jokerkey.cartoon_gunner))
		end,
		calculate = function(_, card, context)
						if context.individual 
			and context.cardarea == G.play 
			and not context.end_of_round
			and contains({7,8,9,10,14}, context.other_card:get_id()) then
				return {
					mult = card.ability.extra.mult,
					card = context.other_card,
					juice_card = context.blueprint_card or card,
				}
			end
		end,
		in_pool = function(_, args)
			return not is_day()
		end
	}
end

local function brainless()
	local function flip_brainless(card, center_name)
		G.E_MANAGER:add_event(Event({func = function()
			play_sound('tarot1')
			return true 
		end }))

		-- local percent = 1.15 - (i-0.999)/(#context.full_hand-0.998)*0.3
		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1, func = function() 
			card:flip();
			-- play_sound('card1', percent);
			card:juice_up(0.3, 0.3);
			return true 
		end }))

		delay(0.2)
		
		G.E_MANAGER:add_event(Event({func = function()
			card:set_ability(G.P_CENTERS[center_name])
			return true 
		end }))

		G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1, func = function() 
			card:flip();
			play_sound('tarot2', percent, 0.6);
			card:juice_up(0.3, 0.3);
			return true;
		end }))

		delay(0.5)
	end

	-- Brainless
	local brainless = SMODS.Joker {
		key = jokers.brainless,
		pos = jokerpos.brainless,
		loc_txt = {
			name = "Brainless Kitty",
			text = {
				"{X:mult,C:white} X#1# {} Mult",
				"{C:green}#2# in #3#{} chance to",
				"become {C:red}Evil"
			}
		},
		config = { extra = { x_mult = 1.5, odds = 3 } },
		loc_vars = function(_, info_queue, card)
			return { vars = { 
				card.ability.extra.x_mult,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.odds
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		in_pool = function(_, args)
			return not next(SMODS.find_card(jokerkey.evil_brainless))
		end,
		calculate = function(_, card, context)
			if context.joker_main then
				local roll_for_flip = not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker
				local ret = {xmult = card.ability.extra.x_mult}
				ret.func = function()
					if roll_for_flip and (pseudorandom('brainless') < (G.GAME.probabilities.normal / card.ability.extra.odds)) then
						flip_brainless(card, 'j_qualatro_evil_brainless')
					end
				end
				return ret
			end
		end
	}

		-- Evil Brainless
	local evil_brainless = SMODS.Joker {
		key = jokers.evil_brainless,
		pos = jokerpos.evil_brainless,
		loc_txt = {
			name = "Evil Brainless",
			text = {
				"{X:mult,C:white} X#1# {} Mult",
				"{C:green}#2# in #3#{} chance to",
				"become {C:chips}Nice"
			}
		},
		config = { extra = { x_mult = 0.75, odds = 2 } },
		loc_vars = function(_, info_queue, card)
			if #info_queue == 0 and not _.recurse then
				local shallow_brainless = SMODS.shallow_copy(brainless)
				shallow_brainless.recurse = true
				info_queue[1] = shallow_brainless
			end
			return { vars = { 
				card.ability.extra.x_mult,
				G.GAME.probabilities.normal or 1,
				card.ability.extra.odds
			} }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 4,
		blueprint_compat = true,
		yes_pool_flag = 'never',
		calculate = function(_, card, context)
			if context.joker_main then
				local roll_for_flip = not context.individual and not context.repetition and not context.blueprint and not context.retrigger_joker
				local ret = {xmult = card.ability.extra.x_mult}
				ret.func = function()
					if roll_for_flip and (pseudorandom('evil_brainless') < (G.GAME.probabilities.normal / card.ability.extra.odds)) then
						flip_brainless(card, 'j_qualatro_brainless')
					end
				end
				return ret
			end
		end
	}

	local brainless_loc_vars = brainless.loc_vars
	brainless.loc_vars = function(_, info_queue, card)
		-- iq = info_queue[#info_queue]
		-- print(iq)
		if #info_queue == 0 and not _.recurse then
			local shallow_brainless = SMODS.shallow_copy(evil_brainless)
			shallow_brainless.recurse = true
			info_queue[1] = shallow_brainless
		end
		return brainless_loc_vars(_, info_queue, card)
	end
end

local function mm2wood()
	-- mm2wood
	SMODS.Joker {
		key = jokers.mm2wood,
		pos = jokerpos.mm2wood,
		loc_txt = {
			name = "mm2wood",
			text = {
				"{C:chips}+#1#{} Chips"
			}
		},
		config = { extra = { chips = 4 } },
		loc_vars = function(self, info_queue, card)
			if
				G.GAME.blind and (G.GAME.blind.name == 'The Plant' or G.GAME.blind.name == 'Verdant Leaf') and G.GAME.blind.disabled
			then
				return { vars = {
					card.ability.extra.chips,
					G.GAME.blind.name,
				}, key = self.key..'_alt' }
			else
				return { vars = {
					card.ability.extra.chips,
				} }
			end
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 2,
		blueprint_compat = false,
		add_to_deck = function(_, card, from_debuff)
			if G.GAME.blind and (G.GAME.blind.name == 'The Plant' or G.GAME.blind.name == 'Verdant Leaf') and not G.GAME.blind.disabled then
				G.GAME.blind:disable()
				play_sound('timpani')
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
			end
		end,
		calculate = function(_, card, context)
			if context.setting_blind and not card.getting_sliced and not context.blueprint and (context.blind.name == 'The Plant' or context.blind.name == 'Verdant Leaf') then
                G.E_MANAGER:add_event(Event({func = function()
                    G.E_MANAGER:add_event(Event({func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        delay(0.4)
                        return true end }))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                return true end }))
            end
			if context.joker_main then
				return {
					chips = card.ability.extra.chips
				}
			end
		end
	}
end

local function joker_template()
	-- Joker Template
	SMODS.Joker {
		key = jokers.joker_template,
		pos = jokerpos.joker_template,
		loc_txt = {
			name = "Joker Template",
			text = {
				""
			}
		},
		config = { },
		loc_vars = function(_, info_queue, card)
			return { vars = { } }
		end,
		rarity = rarity.COMMON,
		atlas = ATLAS,
		cost = 5,
		blueprint_compat = true,
		calculate = function(_, card, context)
			
		end
	}
end

local function fifth_trap()
	SMODS.Consumable {
		key = 'fifth_trap',
		set = 'Spectral',
		loc_txt = {
			name = "Fifth Trap",
			text = {
				""
			}
		},
		atlas = 'QualatroSpectral',
		pos = { x = 0, y = 0 },
		use = function(_, card, area)
			-- for _,c in ipairs(area.cards) do
			-- 	SMODS.change_base(c, nil, c:get_id() + 1)
			-- end
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true end }))
			for i=1, #G.hand.cards do
				local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
			-- Logic here
			for i=1, #G.hand.cards do
				G.E_MANAGER:add_event(Event({func = function()
					SMODS.change_base(G.hand.cards[i], nil, RANKS[math.fmod(G.hand.cards[i]:get_id() + pseudorandom_element({5, 6}, pseudoseed('fifth_trap')), 13)])
				return true end }))
			end  
			-- End logic
			for i=1, #G.hand.cards do
				local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.5)
		end,
		can_use = function(_, card)
			return G.hand ~= nil and next(G.hand.cards)
		end
	}
end

-- Order of collection. Add joker function here to order it.
local collection = {
	-- ARG
	siiva, siiva_ai, susie, grand_dad, dimensional_cape,
	haruka, genocide_chad, reader, jerome, beader_and_berome,
	joke_explainer, twob, inspector_gadget, ogg, familiar_photo,

	coconut_gun, slip_n_slide, christmas_spirit, fools_spirit, golden_necklace,
	cat_mask, spectrogram, galaxia, dian_shi_ma_li, reverb,
	caramelldansen, katamari_on_the_rocks, eight_bit_beast, bites_the_dust, final_goodbye,

	mm2wood, lost_media, jokex_replica, color_war, smoke_explainer,
	dr_andonuts, --d1, d2, d3, d4
	haltmann, other_donuts, --d6, d7, d8

	beta_mix, antonymph, onetwo_jump, joper, interior_joker,
	kazoo, circus, get_lucky, weezer, dancing_mad,
	boykisser, pomni, gegagedigedagedago, ride_the_raft, crazy_bus,
	
	hypercam, papyrus, cryptid_hunt, kingly_mask, together_now,
	jazz_cats_shades, jazz_cats_tom, jazz_cats_sphelonious, nobodys_hero, etika_reveal,
	limited_liability_partnership, ajit_pai, nico_nico, djpk, king_for_eternity,

	polar_star, nintendo_power, slider, planet_b_ball, wii_shop_channel,
	tax_fraud, smashup, christmas_in_july, word_whammer, pizza_roll,
	hot_cross_buns, takeover_doover, poke_party, othello_world, gadget_room,

	the_bean, lady, stingy, brainless, --evil brainless
	cnas, nozomi, joker_inside_your_head,	missingno
}

for _,j in ipairs(collection) do
	j()
end

-- Watch
local function watch_joker()
	SMODS.Joker {
		key = 'watch',
		pos = {
			x = 0,
			y = 0
	},
		loc_txt = {
			name = 'Unwatched Joker',
			text = {
				"Not Watched"
			}
		},
		config = { extra = { } },
		loc_vars = function(_, info_queue, card)
			return { vars = {  } }
		end,
		rarity = rarity.UNCOMMON,
		atlas = ATLAS,
		cost = 7,
		blueprint_compat = true,
		calculate = function(_, card, context)
			if context.individual and context.cardarea == G.play and contains({1,2}, context.other_card:get_id()) then

			end
		end
	}
end
if is_debug then
	watch_joker()
end

local consumables = {
	'fool', 'magician', 'high_priestess', 'empress', 'emperor', 'lovers', 'hermit',
	'wheel_of_fortune','hanged_man', 'death', 'tower', 'strength', 'heirophant', 'star',
	'temperance', 'judgement', 'moon', 'devil', 'sun', 'world', 'justice', 'chariot'
}
for _,c in ipairs(consumables) do
	SMODS.Consumable:take_ownership(c, {atlas='QualatroTarot'})
end

local boosters = {
	'arcana_normal_1', 'arcana_normal_2', 'arcana_normal_3', 'arcana_normal_4',
	'arcana_jumbo_1', 'arcana_jumbo_2', 'arcana_mega_1', 'arcana_mega_2'
}
for _,b in ipairs(boosters) do
	SMODS.Booster:take_ownership(b,{atlas='QualatroBooster'})
end

local function init_tournament_boosters()
	local tournament_booster_common = {
		kind = "tournament",
		atlas = "QualatroBooster",
		create_card = function(self, card)
			return create_card("Joker", G.pack_cards, nil, rarity.CONTESTANT, nil, nil, nil, nil)
		end,
		ease_background_colour = function(self)
			ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.qualatro_contestant)
			ease_background_colour({ new_colour = HEX("C7638F"), special_colour = G.C.RARITY.qualatro_contestant, contrast = 2 })
		end,
		loc_vars = function(self, info_queue, card)
			return {
				vars = {
					card and card.ability.choose or self.config.choose,
					card and card.ability.extra or self.config.extra,
				},
			}
		end,
		group_key = "k_qualatro_tournament_pack",
	}

	local tournament_boosters = {
		{ key = "tournament_normal_1", pos = { x = 0, y = 9 }, order = 29, config = { extra = 2, choose = 1 }, cost = 4, weight = 0.3, },
		{ key = "tournament_normal_2", pos = { x = 1, y = 9 }, order = 30, config = { extra = 2, choose = 1 }, cost = 4, weight = 0.3, },
		{ key = "tournament_normal_3", pos = { x = 2, y = 9 }, order = 31, config = { extra = 2, choose = 1 }, cost = 4, weight = 0.3, },
		{ key = "tournament_normal_4", pos = { x = 3, y = 9 }, order = 32, config = { extra = 2, choose = 1 }, cost = 4, weight = 0.3, },
		{ key = "tournament_jumbo_1", pos = { x = 0, y = 10 }, order = 33, config = { extra = 4, choose = 1 }, cost = 6, weight = 0.3, },
		{ key = "tournament_jumbo_2", pos = { x = 1, y = 10 }, order = 34, config = { extra = 4, choose = 1 }, cost = 6, weight = 0.3, },
		{ key = "tournament_mega_1", pos = { x = 2, y = 10 }, order = 35, config = { extra = 4, choose = 2 }, cost = 8, weight = 0.15, },
		{ key = "tournament_mega_2", pos = { x = 3, y = 10 }, order = 36, config = { extra = 4, choose = 2 }, cost = 8, weight = 0.15, },
	}

	for i=1, #tournament_boosters do
		local booster = tournament_boosters[i]
		for k, v in pairs(tournament_booster_common) do
			booster[k] = v
		end
		SMODS.Booster(booster)
	end

	SMODS.Rarity({
		key = "contestant",
		loc_txt = {},
		badge_colour = HEX("3664F7"),
		default_weight = 0,
		pools = { ["Joker"] = true },
		get_weight = function(self, weight, object_type)
			weight = G.GAME.qualatro_contestant_shop_rate or self.default_weight
			return weight
		end,
	})

	SMODS.Voucher {
		object_type = "Voucher",
		key = "tournament_voucher_1",
		atlas = "QualatroVoucher",
		order = 3,
		pos = { x = 0, y = 0 },
		loc_vars = function(self, info_queue)
			return { vars = {} }
		end,
		redeem = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.qualatro_contestant_shop_rate = (G.GAME.qualatro_contestant_shop_rate or 0) + 0.25
					return true
				end,
			}))
		end,
		unredeem = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.qualatro_contestant_shop_rate = 0
					return true
				end,
			}))
		end,
	}

	SMODS.Voucher {
		object_type = "Voucher",
		key = "tournament_voucher_2",
		atlas = "QualatroVoucher",
		order = 3,
		requires = { "v_qualatro_tournament_voucher_1" },
		pos = { x = 1, y = 0 },
		config = { extra = 2 },
		loc_vars = function(self, info_queue)
			return { vars = { self.extra or 2 } }
		end,
		redeem = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.qualatro_contestant_shop_rate = (G.GAME.qualatro_contestant_shop_rate or 0) * (self.extra or 2)
					G.GAME.qualatro_contestant_edition_rate_multiplier = (G.GAME.qualatro_contestant_edition_rate_multiplier or 1) * (self.extra or 2)
					return true
				end,
			}))
		end,
		unredeem = function(self)
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.qualatro_contestant_shop_rate = (G.GAME.qualatro_contestant_shop_rate or 0) / (self.extra or 2)
					G.GAME.qualatro_contestant_edition_rate_multiplier = (G.GAME.qualatro_contestant_edition_rate_multiplier or 1) / (self.extra or 2)
					return true
				end,
			}))
		end,
	}
end
-- init_tournament_boosters()

SMODS.Blind:take_ownership('wall',{loc_txt={name="The Chungus"}},true)

-- Taken from Cryptid
-- Calculate events on start of shop.
-- Hopefully merged into steamodded at some point
local guis = G.UIDEF.shop
G.UIDEF.shop = function(e)
	local ret = guis(e)
	SMODS.calculate_context{ qualatro_start_shop = true }
	return ret
end

-- local _super_update_shop = Game.update_shop
-- function Game.update_shop(self, dt)
-- 	_super_update_shop(self, dt)
-- 	print("update")
-- end

-- Register all sounds in the /sounds subdirectory, with their filename as the key.
SMODS.Sound:register_global()

if debug then
	r = SMODS.restart_game
end

local _super_can_sell_card = Card.can_sell_card

Card.can_sell_card = function(self, context)
	local ret = _super_can_sell_card(self, context)
	if next(SMODS.find_card(jokerkey.king_for_eternity)) and self.edition ~= nil and self.ability.set == "Joker" then
		ret = false
	end
	if self.config.center.key == jokerkey.pomni and self.ability.extra.block_selling then
		ret = false
	end
	return ret
end

function add_to_joker_results_table(cardID)
	if not G.GAME.joker_results_table then
		G.GAME.joker_results_table = {}
	end

	if G.GAME.joker_results_table[cardID] == nil then
		G.GAME.joker_results_table[cardID] = {}
	end
	G.GAME.joker_results_table[cardID] = true 
	--print("added to table. key:", key, "amount:", number, "cardID", cardID)
end

--NOTE: (Ahmayk) G.GAME.joker_results_table caches if a joker has returned something (nobody's hero, together now) 
local _super_calculate_joker = Card.calculate_joker
function Card:calculate_joker(context)
	local ret, trig = _super_calculate_joker(self, context)

	if ret and type(ret) == "table" and not context.blueprint then
		local scored_card = context.blueprint_card or self
		--NOTE: (Ahmayk) mark down repetitions and messages here
		--we assume that if a joker sends a message, it has triggered (ie Mail-In-Rebate)
		if scored_card.ability.set == "Joker" then
			for k, v in pairs(ret) do
				if type(v) == "number" and k == "repetitions" then
					add_to_joker_results_table(scored_card.ID)
				end
				if k == "message" then
					add_to_joker_results_table(scored_card.ID)
				end
			end
		end
	end
	return ret, trig
end

local _super_calculate_individual_effect = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	--NOTE(Ahmayk) We assume that if a joker is stored in these places, then it is considered "triggered" 
	--we do NOT count effects from editions, we only care if a joker's effect was triggered
	if type(amount) == "number" and not from_edition then
		if effect.card and effect.card.ability.set == "Joker" then
			add_to_joker_results_table(effect.card.ID)
		end
		if effect.juice_card and effect.juice_card.ability.set == "Joker" then
			add_to_joker_results_table(effect.juice_card.ID)
		end
		if scored_card and scored_card.ability.set == "Joker" then
			add_to_joker_results_table(scored_card.ID)
		end
	end
	return _super_calculate_individual_effect(effect, scored_card, key, amount, from_edition) 
end


local _super_update = Game.update

--NOTE: (Ahmayk) must initialize all sounds to pitch = 1. otherwise music will be pitched down to 0.7 
for _, sound in pairs(SMODS.Sounds) do
	sound.pitch = 1
end

--NOTE: (Ahmayk) overrides all SMODS music. Sorry other mods.
function SMODS.Sound:get_current_music()
	local track =
		(G.booster_pack_sparkles and not G.booster_pack_sparkles.REMOVED and 'qualatro_music2') or
        (G.booster_pack_meteors and not G.booster_pack_meteors.REMOVED and 'qualatro_music3') or
        (G.booster_pack and not G.booster_pack.REMOVED and 'qualatro_music2') or
        (G.shop and not G.shop.REMOVED and 'qualatro_music4') or
        (G.GAME.blind and G.GAME.blind.boss and 'qualatro_music5') or 
        ('qualatro_music1')
	return track
end

-- [copying joker] = what it copies
local _music_copy_table = {}
_music_copy_table[jokers.jokex_replica] = jokers.jokex
_music_copy_table[jokers.jerome] = jokers.reader
_music_copy_table[jokers.beader_and_berome] = jokers.reader
_music_copy_table[jokers.galaxia] = jokers.dimensional_cape
_music_copy_table[jokers.donut1] = jokers.dr_andonuts
_music_copy_table[jokers.donut2] = jokers.dr_andonuts
_music_copy_table[jokers.donut3] = jokers.dr_andonuts
_music_copy_table[jokers.donut4] = jokers.dr_andonuts
_music_copy_table[jokers.donut5] = jokers.dr_andonuts
_music_copy_table[jokers.donut6] = jokers.dr_andonuts
_music_copy_table[jokers.donut7] = jokers.dr_andonuts
_music_copy_table[jokers.donut8] = jokers.dr_andonuts
_music_copy_table[jokers.siiva_ai] = jokers.final_goodbye
G.qualatro_music_copy_table = {}
for k, v in pairs(_music_copy_table) do
	G.qualatro_music_copy_table['j_qualatro_' .. k] = 'j_qualatro_' .. v
end

function Game:update(dt)
	_super_update(self, dt)

	--NOTE: (Ahmayk) Always make sure nico nico is applied correctly
	--Is done every frame even outside of the game since we are modifying card data that persists across runs
	if G.qualatro_consumeables_init_max_highlighted == nil then
		G.qualatro_consumeables_init_max_highlighted = {}
	end

	local diff = 0

	if G.GAME and next(SMODS.find_card(jokerkey.nico_nico)) then
		diff = 1
	end

	for _, card in pairs(G.I.CARD) do
		if
			card.ability and
			card.ability.set == "Tarot" and
			card.config.center.key ~= 'c_hanged_man' and
			card.ability.max_highlighted and
			card.ability.min_highlighted == nil
		then

			if G.qualatro_consumeables_init_max_highlighted[card.config.center.key] == nil then
				G.qualatro_consumeables_init_max_highlighted[card.config.center.key] = card.ability.consumeable.max_highlighted
			end

			local base_max_highlight = G.qualatro_consumeables_init_max_highlighted[card.config.center.key]

			card.ability.consumeable.max_highlighted = base_max_highlight + diff
			card.ability.max_highlighted = base_max_highlight + diff
		end
	end

	if G.GAME and G.playing_cards and #G.playing_cards > 0 then
		--NOTE: (Ahmayk) monitor number of missing ranks for lost media
		--we do it continuously to give immediate notifications
		--is done here to not cause a performance issue if you have lots of lost medias
		local lost_medias = {} 
		for _, card in pairs(G.I.CARD) do
			if
				card.config and
				card.config.center and
				card.config.center.key == 'j_qualatro_jokex_lost_media' and
				not card.debuff
			then
				lost_medias[#lost_medias + 1] = card
			end
		end

		if #lost_medias > 0 then
			local missing_ranks = get_missing_ranks()
			for _, card in pairs(lost_medias) do
				update_lost_media(card, missing_ranks, true)
			end
		end
	end

	--NOTE: (Ahmayk) remove stingys from queue that no longer exist (prevents stingy softlock)
	if G.qualatro_stingy_queue then
		for k, v in pairs(G.qualatro_stingy_queue) do
			local is_matching_stingy = false
			for _, joker in pairs(G.jokers.cards) do
				if joker == v then
					is_matching_stingy = true 
					break
				end
			end
			if not is_matching_stingy then
				table.remove(G.qualatro_stingy_queue, k)
			end
		end
	end

	if G.jokers and G.jokers.cards and G.qualatro_active_stingy then
		local is_matching_active_stingy = false
		for _, joker in pairs(G.jokers.cards) do
			if joker == G.qualatro_active_stingy then
				is_matching_active_stingy = true
				break
			end
		end
		if not is_matching_active_stingy then
			G.qualatro_active_stingy = nil
		end
	end

	--NOTE: (Ahmayk) Stingy queue!
	if 
	    G.qualatro_stingy_queue and
	    #G.qualatro_stingy_queue > 0 and 
	    not G.qualatro_active_stingy and
		G.STATE == G.STATES.SHOP
	then
		G.qualatro_active_stingy = G.qualatro_stingy_queue[1]
		table.remove(G.qualatro_stingy_queue, 1)
		stingy_start(G.qualatro_active_stingy)
	end

	if not G.qualatro_found_joker_music_sound_codes then
		G.qualatro_found_joker_music_sound_codes = {}
		local generated_joker_sound_labels = {}
		for k, v in pairs(G.P_CENTERS) do
			if v.set == "Joker" then
				local generated_sound_key = "qualatro_layer_" .. string.sub(v.key, 12, -1)
				generated_joker_sound_labels[generated_sound_key] = v.key
			end
		end
		for _, sound in pairs(SMODS.Sounds) do
			if string.find(sound.sound_code, 'qualatro_layer') then 
				local found = false
				for k, v in pairs(generated_joker_sound_labels) do
					if generated_joker_sound_labels[sound.sound_code] then
						local joker_key = generated_joker_sound_labels[sound.sound_code]
						G.qualatro_found_joker_music_sound_codes[joker_key] = sound.sound_code
						found = true
						break
					end
				end
				if not found then
					print("WARNING: qualatro music layer does not match any jokers: "..sound.sound_code)
				end
			end
		end
	end

	if not G.ARGS.push.qualatro_active_music_layers or not SMODS.Mods.Qualatro.config.music_layers then
		G.ARGS.push.qualatro_active_music_layers = {}
	end

	if SMODS.Mods.Qualatro.config.music_layers then

		local active_joker_key_table = {}
		for _, area in ipairs(SMODS.get_card_areas('jokers')) do
			for _, card in pairs(area.cards) do
				if card and type(card) == 'table' and not card.debuff then
					local key = G.qualatro_music_copy_table[card.config.center.key] or card.config.center.key
					active_joker_key_table[key] = true
				end
			end
		end

		if G.title_top and #G.title_top.cards >= 1 then
			active_joker_key_table[G.title_top.cards[1].config.center.key] = true
		end

		for k, v in pairs(active_joker_key_table) do
			local sound_code = G.qualatro_found_joker_music_sound_codes[k]
			if sound_code then
				G.ARGS.push.qualatro_active_music_layers[sound_code] = true 
			end
		end

		for k, v in pairs(G.qualatro_found_joker_music_sound_codes) do
			local joker_is_here = false
			for joker_key, _ in pairs(active_joker_key_table) do
				if joker_key and joker_key == k then
					joker_is_here = true
					break
				end
			end
			G.ARGS.push.qualatro_active_music_layers[v] = joker_is_here
		end
	end

	G.ARGS.push.type = 'process_layered_music'
	G.SOUND_MANAGER.channel:push(G.ARGS.push)

	local debug_string = love.thread.getChannel("debug"):pop()
	if debug_string and is_debug then
		print(debug_string)
	end
end

local _super_calculate_context = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
		if context.removed then
			local removed_card = context.removed[#context.removed]
			--NOTE: (Ahmayk) Search for rightmost card
			--we assume that removed cards all come from the same area
			if #context.removed > 1 and removed_card.area and #removed_card.area.cards then
				local match_found = false
				for i=1, #removed_card.area.cards do
					local righty_card = removed_card.area.cards[#removed_card.area.cards + 1 - i]
					for k, v in pairs(context.removed) do
						if v == righty_card then
							removed_card = v
							match_found = true
							break
						end
					end
					if match_found then
						break
					end
				end
			end
			G.GAME.last_destroyed_inactive_card_data = create_inactive_card_data(removed_card)
		end

		--NOTE: (Ahmayk) G.GAME.joker_results_table needs to be reset at the end of every hand
		if context.after then
			G.GAME.joker_results_table = {}
		end

		return _super_calculate_context(context, return_table)
end