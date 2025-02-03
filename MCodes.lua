-- Util functions

local function contains(t, v)
	for _, j in pairs(t) do
		if j == v then
			return true
		end
	end
	return false
end

-- Shallow copy a table
local function copy(t)
	local copy = {}
	for k,v in pairs(t) do
		copy[k] = v
	end
	return copy
end

-- Shallow paste a table into another table
local function paste(from, to)
	for k,v in pairs(from) do
		if to[k] ~= nil then
			to[k] = v
		end
	end
end

-- Select an elemnt from t that is not in t_not
local select_not = function(t, t_exclude)
	local eligible = {}
	for _,c in ipairs(t) do
		if not contains(t_exclude, c) then
			table.insert(eligible, c)
		end
	end
	return pseudorandom_element(eligible, pseudoseed("select_not"))
end

-- Randomize letters in chars to a random other letter in chars
local function randomize(st, chars, chance)
	if chance then
		if pseudorandom("random_chance") > (G.GAME.probabilities.normal * chance) then
			return st
		end
	end

	local ret = ""
	for i=1, #st do
		local ch = st:sub(i,i)
		if contains(chars,ch) then
			ch = select_not(chars, {ch})
		end
		ret = ret..ch
	end
	return ret
end
local vowels = {'a','e','i','o','u'}

function play_random_distorted_sound()
	local pitch = (pseudorandom("missingnoPitch") * 0.4) + 0.1
	if pseudorandom("randomSound") < (G.GAME.probabilities.normal * 0.3) then
		local key = 'qualatro_layer' 
		--NOTE: (Ahmayk) playing music tracks ad hoc isn't supported by sound engine
		while string.find(key, 'qualatro_layer') or string.find(key, 'music') do
			local sound = pseudorandom_element(SMODS.Sounds, "missingnoPlaySound") 
			key = sound.key
		end
		--print("playing: " .. key)
		play_sound(key, pitch, 0.8)
	else
		play_sound('chips1', pitch, 0.8)
	end
end

function change_play_and_discard_limit(delta)
	G.GAME.starting_params.play_limit = G.GAME.starting_params.play_limit + delta
	G.GAME.starting_params.discard_limit = G.GAME.starting_params.discard_limit + delta
	G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + delta
	--print("SETTING LIMIT TO " .. G.GAME.starting_params.play_limit .. " (Delta) " .. delta)
end

local function random_colour(key)
	local colour = pseudorandom_element(G.C, "random_color_"..key)
	while (type(colour[1]) ~= "number") do
		colour = pseudorandom_element(G.C, "random_color_"..key)
	end
	return colour
end

-- Codes

return {

	-- Swap the art & location of two jokers (still plays animation)
	-- Currently permanant until game is reset
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				if #G.jokers.cards >= 3 then
					local j1 = select_not(G.jokers.cards, {missingno})
					local j2 = select_not(G.jokers.cards, {missingno, j1})

					local temp_x = j1.config.center.pos.x
					local temp_y = j1.config.center.pos.y
					local temp_atlas = j1.config.center.atlas
					local temp_pos = j1.rank

					j1.config.center.pos.x = j2.config.center.pos.x
					j1.config.center.pos.y = j2.config.center.pos.y
					j1.config.center.atlas = j2.config.center.atlas
					G.jokers.cards[j2.rank] = j1

					j2.config.center.pos.x = temp_x
					j2.config.center.pos.y = temp_y
					j2.config.center.atlas = temp_atlas
					j2.config.center.rank =  temp_pos
					G.jokers.cards[temp_pos] = j2
					play_random_distorted_sound()
				end
				return true
			end
		}))
		return true
	end,

	-- Juice up blind a bunch
	function(missingno, context)
		for i = 1, pseudorandom("missingno_juice_blind", 10, 100) do
			G.E_MANAGER:add_event(Event({
				func = function()
					local d = 0.25 + pseudorandom("missingno_juice_blind_len") * 0.3
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = d,
						blockable = false,
						blocking = false,
						func = function()
							SMODS.juice_up_blind()
							play_sound('chips1', d * 1.5, 0.12)
							ease_dollars(0.005, true)
							return true
						end
					}))
					return true
				end
			}))
		end
		return true
	end,

	-- spam giving bunch of money in small amount 
	function(missingno, context)
		for i = 1, pseudorandom("missingno_juice_blind", 10, 100) do
			G.E_MANAGER:add_event(Event({
				func = function()
					local d = 0.25 + pseudorandom("missingno_juice_blind_len") * 0.3
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = d,
						blockable = false,
						blocking = false,
						func = function()
							ease_dollars(0.005, true)
							return true
						end
					}))
					return true
				end
			}))
		end
		return true
	end,

	-- Randomize some cards in deck
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = 1, pseudorandom("missingno_randomize_cards", 1, 2) do
					--for i = 1, 100 do
					local random_card = pseudorandom_element(G.playing_cards, pseudoseed("missingno_proc"))
					local new_front = pseudorandom_element(G.P_CARDS, pseudoseed('frontmissingno'..G.GAME.round_resets.ante)) or nil
					if new_front then
						random_card:juice_up()
						random_card:set_base(new_front, true)

						local edition = poll_edition('missingnoEdition')
						if edition then
							random_card:set_edition(edition)
						end

						for k, v in ipairs(SMODS.Sticker.obj_buffer) do
							local sticker = SMODS.Stickers[v]
							if pseudorandom("stickermissingno") < 0.05 then
								sticker:apply(random_card, true)
							end
						end
					end
				end
				play_random_distorted_sound()

				return true
			end
		}))
	end,

	-- Copy another joker (bypass blueprint compat, only copies joker_main, might break things!)
	function(missingno, context)
		if context then

			local other_joker = pseudorandom_element(G.jokers.cards, "randomjokermissingno")

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
		else
			print("No context in missingno copy joker function")
		end
	end,

	-- Duplicate something! 
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()

				--NOTE: (Ahmayk) do a pass to remove weird shit in joker area, as this is kind of hell
				for _, v in pairs(G.jokers.cards) do
					if v.config.center.set ~= 'Joker' then
						SMODS.destroy_cards(v)
					end
				end

				local choice = pseudorandom_element({1, 2, 3, 4}, "missingnoduplicatechoice")
				if choice == 1 then
					local random_card = pseudorandom_element(G.playing_cards, pseudoseed("missingno_proc"))
					local _card = copy_card(random_card, nil, nil, G.playing_card)
					_card:add_to_deck()
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					table.insert(G.playing_cards, _card)
					G.hand:emplace(_card)
				elseif choice == 2 then
					--NOTE: (Ahmayk) this is a typo that I'm keeping in because it's funny
					local random_card = pseudorandom_element(G.playing_cards, pseudoseed("missingno_proc"))
					local _card = copy_card(random_card, nil, nil, nil, random_card.edition and random_card.edition.negative)
					_card:add_to_deck()
					if _card.edition and _card.edition.negative then
						_card:set_edition(nil, true)
					end
					G.jokers:emplace(_card)
				elseif choice == 3 then
					local random_card = pseudorandom_element(G.jokers.cards, pseudoseed("missingno_proc"))
					local _card = copy_card(random_card, nil, nil, nil, random_card.edition and random_card.edition.negative)
					_card:add_to_deck()
					if _card.edition and _card.edition.negative then
						_card:set_edition(nil, true)
					end
					G.jokers:emplace(_card)
				elseif choice == 4 then
					if G.consumeables.cards[1] then
						local _card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('missinperkeo')), nil)
						_card:add_to_deck()
						G.consumeables:emplace(_card) 
					end
				end
				play_random_distorted_sound()
				return true
			end
		}))
		return true
	end, 

	-- Give you some money 
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				play_random_distorted_sound()
				return true
			end
		}))

		local moola = pseudorandom("stickermissingno") * 12.8
		return {
			dollars = moola
		} 
	end, 

	-- does that balance thing lol
	function(missingno, context)

		G.E_MANAGER:add_event(Event({
			func = function()
				play_random_distorted_sound()
				return true
			end
		}))

		return {
			balance = true 
		} 
	end,

	-- debuff random playing card fuck you 
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				--but undebuff everything else to be nice
				local reason = "missingnoDebuff"
				for i = 1, #G.playing_cards do
					SMODS.debuff_card(G.playing_cards[i], false, reason)
				end
				local random_card = pseudorandom_element(G.hand.cards, pseudoseed("missingno_proc"))
				if random_card then
					random_card:juice_up()
					SMODS.debuff_card(random_card, true, reason)
					play_random_distorted_sound()
				end
				return true
			end
		}))
		return true
	end,

	-- flip over a random card
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				local choice = pseudorandom_element({1, 2, 3}, "missingnoflip")

				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].facing == 'back' then
						G.jokers.cards[i]:flip()
					end
				end

				local random_card = nil 
				if choice == 1 then
					random_card = pseudorandom_element(G.hand.cards, pseudoseed("missingno_proc"))
				elseif choice == 2 then
					random_card = pseudorandom_element(G.jokers.cards, pseudoseed("missingno_proc"))
				elseif choice == 3 then
					if G.consumeables.cards[1] then
						local _card = copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('missinoooooo')), nil)
						_card:add_to_deck()
						G.consumeables:emplace(_card) 
					else
						random_card = pseudorandom_element(G.hand.cards, pseudoseed("missingno_proc"))
					end
				end
				if random_card then
					random_card:flip()
				end
				play_random_distorted_sound()
				return true
			end
		}))
		return true
	end,

	-- fuck with the size of the card
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				local choice = pseudorandom_element({1, 2}, "missingnofat")

				local random_card = nil 
				if choice == 1 then
					random_card = pseudorandom_element(G.hand.cards, pseudoseed("missingno_proc"))
				elseif choice == 2 then
					random_card = pseudorandom_element(G.jokers.cards, pseudoseed("missingno_proc"))
				end
				if random_card then
					random_card.T.w = pseudorandom("missingnoSizeW") * 2.5 + 0.7 
					random_card.T.h = pseudorandom("missingnoSizeH") * 1.5 + 0.7
				end

				play_random_distorted_sound()

				return true
			end
		}))
		return true
	end,

	-- fuck with how many cards you can play
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				local delta = pseudorandom_element({1, 2, 3, 4, -1, -2, -3}, "missingnoPlaySizeDela") 
				if G.GAME.starting_params.play_limit + delta < 1 then
					delta = 1 - G.GAME.starting_params.play_limit
				end
				change_play_and_discard_limit(delta)
				missingno.ability.extra.play_limit_delta = missingno.ability.extra.play_limit_delta + delta
				attention_text({
					text = localize("qua_iamgod"),
					scale = 3,
					hold = 2,
					backdrop_colour = G.C.BLACK,
					colour = G.C.RED,
					major = missingno,
					offset = {x = 0, y = 0.05*missingno.T.h}
				})
				play_sound('voice'..math.random(1, 11), 0.3, 1)
				return true
			end
		}))

		return true
	end,

	--sound goes nuts and everything juices
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				for _, v in pairs(G.jokers.cards) do
					v:juice_up()
				end
				for _, v in pairs(G.hand.cards) do
					v:juice_up()
				end
				for _, v in pairs(G.consumeables.cards) do
					v:juice_up()
				end
				play_sound('voice'..math.random(1, 11), 0.3, 1)

				local choice = pseudorandom_element({1, 2, 3}, "missingnoPitchmod")
				if choice == 1 then
					G.PITCH_MOD = pseudorandom("misngnopitchgoweeee") * 0.1
				elseif choice == 2 then
					G.PITCH_MOD = pseudorandom("misngnopitchgoweeee") * 200 
				elseif choice == 3 then
					G.PITCH_MOD = (pseudorandom("misngnopitchgoweeee") * 0.2) + 0.8 
				end
				return true
			end
		}))
		return true
	end,

	-- RBA
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				if pcall(function()
					local card = G.hand.cards[1]
					if not card then return true end
					local suit = card.base.suit
					local pools = {
						G.P_CENTER_POOLS.Tarot,
						G.P_CENTER_POOLS.Planet,
						G.P_CENTER_POOLS.Spectral,
						G.P_CENTER_POOLS.Joker,
						G.P_CENTER_POOLS.Consumeables,
						G.P_CENTER_POOLS.Tarot_Planet,
					}
					local pool = pools[1]
					i = 1
					for v,_ in pairs(SMODS.Suits) do
						if v == suit then
							pool = pools[i]
							break
						end
						i = i+1
					end
					local center = pool[card.base.id] or pool[1]
					SMODS.add_card(center)
					if card.seal == "Red" then
						SMODS.add_card(center)
					elseif card.seal == "Purple" then
						SMODS.add_card(G.P_CENTER_POOLS.Tarot[card.base.id])
					elseif card.seal == "Blue" then
						SMODS.add_card(G.P_CENTER_POOLS.Planet[card.base.id])
					elseif card.seal == "Gold" then
						ease_dollars(card.base.id, true)
					end
					SMODS.destroy_cards(card)
				end) then
					return true
				else
					return true
				end
			end
		}))
		return true
	end,

	-- Background color change
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				ease_background_colour{new_colour = random_colour("bg1"), special_colour =  random_colour("bg2"), contrast = (pseudorandom("bgcontrast")*3) + 2}
				return true
			end
		}))
		return true
	end,

	--upgrade hand u just played 
	function(missingno, context)
		local ret = {
			level_up = true,
		}
		return ret 
	end,

	--introduce drawing error by setting blend mode to replace
	--makes a lot of stuff black!
	function(missingno, context)
		G.E_MANAGER:add_event(Event({
			func = function()
				love.graphics.setBlendMode('replace')
				play_random_distorted_sound()
				play_random_distorted_sound()
				play_random_distorted_sound()
				return true
			end
		}))
		return true
	end,

	-- Change name of joker

	-- Add or remove 1 from random card in deck

	-- Change rarity of joker

	-- Duplicate consumable

	-- Random edition

	-- Put seal on card, joker, or consumable

	-- Random sticker on joker

	-- Debuff card

	-- Change play limit

	-- Playing card in joker area
}
