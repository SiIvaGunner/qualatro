local jd_def = JokerDisplay.Definitions

jd_def["j_qualatro_grand_dad"] = { -- Grand Dad
    text = {{
        text = "+"
    }, {
        ref_table = "card.ability",
        ref_value = "mult",
        retrigger_type = "mult"
    }},
    text_config = {
        colour = G.C.MULT
    }
}

jd_def["j_qualatro_coconut_gun"] = { -- Coconut Gun
    text = {{
        text = "+"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "chips",
        retrigger_type = "chips"
    }},
    text_config = {
        colour = G.C.CHIPS
    },
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    calc_function = function(card)
        card.joker_display_values.chips = card.ability.extra.stored
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cg')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
    end
}

jd_def["j_qualatro_slip_n_slide"] = { -- Slip n' Slide
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.joker_display_values",
            ref_value = "x_mult",
            retrigger_type = "exp"
        }}
    }},
    calc_function = function(card)
        local x_mult = 1
        local text, _, full_hand = JokerDisplay.evaluate_hand()
        if #full_hand == 1 or #G.hand.highlighted == 1 then
            x_mult = card.ability.extra.xmult
        end
        card.joker_display_values.x_mult = x_mult
    end
}

jd_def["j_qualatro_familiar_photo"] = { -- Familiar Photo
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.joker_display_values",
            ref_value = "Xmult"
        }}
    }},
    calc_function = function(card)
        card.joker_display_values.Xmult = (#G.jokers.cards == 4) and (card.ability.extra.xmult) or 1
    end
}

jd_def["j_qualatro_reader"] = { -- Reader
    text = {{
        text = "+"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "chips",
        retrigger_type = "chips"
    }},
    text_config = {
        colour = G.C.CHIPS
    },
    reminder_text = {{
        text = "(3,4)"
    }},
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if (scoring_card:get_id() == 3 or scoring_card:get_id() == 4) then
                    mult = mult + card.ability.extra.chips *
                               JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.chips = mult
    end
}

jd_def["j_qualatro_jerome"] = { -- Jerome
    text = {{
        text = "+"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "mult",
        retrigger_type = "mult"
    }},
    text_config = {
        colour = G.C.MULT
    },
    reminder_text = {{
        text = "(3,4)"
    }},
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if (scoring_card:get_id() == 3 or scoring_card:get_id() == 4) then
                    mult = mult + card.ability.extra.mult *
                               JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.mult = mult
    end
}

jd_def["j_qualatro_beader_and_berome"] = { -- Beader and Berome
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'beaderandberome')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
    end
}

jd_def["j_qualatro_fools_spirit"] = { -- Fools' Spirit
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    reminder_text = {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "lastconsumed",
        colour = G.C.ORANGE
    }, {
        text = ")"
    }},
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'foolsspirit')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
        card.joker_display_values.lastconsumed = G.GAME.last_tarot_planet and localize({
            type = 'name_text',
            key = G.GAME.last_tarot_planet,
            set = G.P_CENTERS[G.GAME.last_tarot_planet].set
        }) or localize({
            type = 'name_text',
            key = 'c_fool',
            set = 'Tarot'
        })
    end
}

jd_def["j_qualatro_fools_spirit"] = { -- Fools' Spirit
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ") "
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    reminder_text = {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "lastconsumed",
        colour = G.C.ORANGE
    }, {
        text = ")"
    }},
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'foolsspirit')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
        card.joker_display_values.lastconsumed = G.GAME.last_tarot_planet and localize({
            type = 'name_text',
            key = G.GAME.last_tarot_planet,
            set = G.P_CENTERS[G.GAME.last_tarot_planet].set
        }) or localize({
            type = 'name_text',
            key = 'c_fool',
            set = 'Tarot'
        })
    end
}

jd_def["j_qualatro_siivagunner"] = { -- SiIva
    text = {{
        text = "+",
        colour = G.C.MULT
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "mult",
        colour = G.C.MULT,
        retrigger_type = "mult"
    }, {
        text = " ",
        colour = G.C.MULT
    }, {
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.joker_display_values",
            ref_value = "x_mult",
            retrigger_type = "exp"
        }}
    }},
    reminder_text = {{
        ref_table = "card.joker_display_values",
        ref_value = "localized_text"
    }},
    calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if SMODS.has_enhancement(scoring_card, "m_stone") then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.mult = card.ability.extra.mult * count
        card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
        card.joker_display_values.localized_text = "(" .. localize("qua_stonecards") .. ")"
    end
}

jd_def["j_qualatro_twob"] = { -- 2B
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return (SMODS.get_enhancements(playing_card)["m_steel"]) and joker_card.ability.extra.repetitions *
                   JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end
}

jd_def["j_qualatro_haruka"] = { -- Haruka
    reminder_text = {{
        text = "(7,6,5)"
    }},
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then
            return 0
        end
        return (playing_card:get_id() == 5 or playing_card:get_id() == 6 or playing_card:get_id() == 7) and
                   joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end
}

jd_def["j_qualatro_christmas_spirit"] = { -- Christmas Spirit
    reminder_text = {{
        ref_table = "card.joker_display_values",
        ref_value = "localized_text"
    }},
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. "Full House" .. ")"
    end
}

jd_def["j_qualatro_dimensional_cape"] = { -- Dimensional Cape
    text = {{
        text = "+$"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "dollars",
        retrigger_type = "mult"
    }},
    text_config = {
        colour = G.C.GOLD
    },
    reminder_text = {{
        text = "(Enhanced Cards)"
    }},
    calc_function = function(card)
        local dollars = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if not SMODS.get_enhancements(scoring_card)["m_base"] then
                    dollars = dollars + card.ability.extra.money *
                                  JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.dollars = dollars
    end
}

jd_def["j_qualatro_siiva_ai"] = { -- SiIva AI
}

jd_def["j_qualatro_inspector_gadget"] = { -- Inspector Gadget
    text = {{
        text = "+"
    }, {
        ref_table = "card.ability.extra",
        ref_value = "extra_hands"
    }},
    text_config = {
        colour = G.C.CHIPS
    },
}

jd_def["j_qualatro_ogg"] = { -- Ogg
    text = {{
        text = "+"
    }, {
        ref_table = "card.ability.extra",
        ref_value = "extra_discards"
    }},
    text_config = {
        colour = G.C.MULT
    },
}

jd_def["j_qualatro_genocide_chad"] = { -- Genocide Chad
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.ability.extra",
            ref_value = "x_mult",
            retrigger_type = "exp"
        }}
    }}
}

jd_def["j_qualatro_golden_necklace"] = { -- Golden Necklace
    text = {{
        text = "+$"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "dollars",
        retrigger_type = "mult"
    }},
    text_config = {
        colour = G.C.GOLD
    },
    reminder_text = {{
        text = "(8)"
    }},
    calc_function = function(card)
        local dollars = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() == 8 then
                    dollars = dollars + card.ability.extra.money *
                                  JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.dollars = dollars
    end
}

jd_def["j_qualatro_spectrogram"] = { -- Spectrogram
    text = {{
        text = "+"
    }, {
        ref_table = "card.ability.extra",
        ref_value = "chips",
        retrigger_type = "chips"
    }},
    text_config = {
        colour = G.C.CHIPS
    }
}

jd_def["j_qualatro_cat_mask"] = { -- Cat Mask
}

jd_def["j_qualatro_word_whammer"] = { -- Word Whammer
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.RED },
        reminder_text = {
            { text = "(3 " },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_ace",      colour = G.C.ORANGE },
            { text = " or " },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_face", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local madeexcellently = 0
            local _, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
				local validCardsCount = 0             
				for i = 1, #scoring_hand do
					if (scoring_hand[i]:get_id() == 14 and not scoring_hand[i].debuff) or scoring_hand[i]:is_face() then
						validCardsCount = validCardsCount + 1
					end
				end
				if validCardsCount == 3 then
						madeexcellently = card.ability.mult
                end
            card.joker_display_values.count = madeexcellently
            card.joker_display_values.localized_text_face = localize("k_face_cards")
            card.joker_display_values.localized_text_ace = localize("Ace", "ranks")
        end
}

jd_def["j_qualatro_final_goodbye"] = { -- Good Night Undertale
}

jd_def["j_qualatro_hypercam"] = { -- Unregistered Hypercam
}

jd_def["j_qualatro_christmas_in_july"] = { -- Christmas in July
}

jd_def["j_qualatro_eight_bit_beast"] = { -- 8-Bit Beast
    reminder_text = {{
        ref_table = "card.joker_display_values",
        ref_value = "localized_text"
    }},
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. "Full House" .. ")"
    end
}

jd_def["j_qualatro_hot_cross_buns"] = { -- Hot Cross Buns
        reminder_text = {
            { text = "(1,2)", scale = 0.35 },
        },
}

jd_def["j_qualatro_beta_mix"] = {	-- Beta Mix
    text = {{
        text = "+",
        colour = G.C.CHIPS
    }, {
        ref_table = "card.ability.extra",
        ref_value = "chips",
        colour = G.C.CHIPS,
        retrigger_type = "mult"
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "blank",
        colour = G.C.CHIPS,
        retrigger_type = "mult"
    }, {
        border_nodes = {{
            ref_table = "card.joker_display_values",
            ref_value = "xmultplus",
        }, {
            ref_table = "card.joker_display_values",
            ref_value = "xmult",
            retrigger_type = "exp",
        }}
    }},
    calc_function = function(card)
        local betamix = false
				if card.rank >= 2 and G.jokers.cards[card.rank - 1].ability.name == 'Joker' then
                    betamix = true
    end        
        card.joker_display_values.xmultplus = betamix and "X" or ""
        card.joker_display_values.xmult = betamix and card.ability.extra.x_mult or ""
        card.joker_display_values.blank = betamix and " " or ""        
    end,
    style_function = function(card, text, reminder_text, extra)
        local betamix = false
				if card.rank >= 2 and G.jokers.cards[card.rank - 1].ability.name == 'Joker' then
                    betamix = true
    end                
        if text and text.children[4] then
            text.children[4].config.colour = betamix and G.C.MULT or G.C.CLEAR
    end
        return false
    end
}

jd_def["j_qualatro_papyrus"] = { -- Papyrus
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.RED },        
        calc_function = function(card)
            card.joker_display_values.count = card.ability.extra.active and card.ability.mult or 0
        end
}

jd_def["j_qualatro_lady"] = { -- Lady
}

jd_def["j_qualatro_cryptid_hunt"] = { -- Cryptid Hunt
}

jd_def["j_qualatro_slider"] = { -- Slider
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'slider')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
    end
}

jd_def["j_qualatro_stingy"] = { -- Stingy
}

jd_def["j_qualatro_get_lucky"] = { -- Get Lucky
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'getlucky')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
    end
}

jd_def["j_qualatro_antonymph"] = { -- The Antonymph
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION  },
            { text = ")" },
        },
        calc_function = function(card)
            local chips = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.edition then
                        chips = chips +
                            card.ability.extra.chips *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.chips = chips
            card.joker_display_values.localized_text = localize("k_edition")
        end
}

jd_def["j_qualatro_haltmann"] = { -- Haltmann's Bill
}

jd_def["j_qualatro_ride_the_raft"] = { -- Ride the Raft
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
}

jd_def["j_qualatro_jokex_lost_media"] = { -- Lost Media
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.ability.extra",
            ref_value = "xmult",
            retrigger_type = "exp"
        }}
    }},
}

jd_def["j_qualatro_king_for_eternity"] = { -- King for Eternity
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "count",          colour = G.C.ORANGE },
            { text = "x" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.DARK_EDITION },
            { text = ")" },
        },
        calc_function = function(card)
            local count = 0
            if G.jokers then
                for _, joker_card in ipairs(G.jokers.cards) do
                    if joker_card.edition then
                        count = count + 1
                    end
                end
            end
            card.joker_display_values.count = count
            card.joker_display_values.localized_text = localize("k_edition")
        end,
        mod_function = function(card, mod_joker)
            return { x_mult = (card.edition and mod_joker.ability.extra.x_mult ^ JokerDisplay.calculate_joker_triggers(mod_joker) or nil) }
        end
}

jd_def["j_qualatro_galaxia"] = { -- Galaxia
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.ability",
            ref_value = "x_mult",
            retrigger_type = "exp"
        }}
    }},
}

jd_def["j_qualatro_smashup"] = { -- SmashUp!
        text = {
            { text = "+" },
            { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
}

jd_def["j_qualatro_othello_world"] = { -- Othello World
    text = {{
        border_nodes = {{
            text = "X"
        }, {
            ref_table = "card.joker_display_values",
            ref_value = "xmult",
            retrigger_type = "exp"
        }}
    }},
        calc_function = function(card)
			local mult = 1
			if G.GAME and G.GAME.blind and G.GAME.blind.mult > 1 then
				mult = G.GAME.blind.mult
			end
            card.joker_display_values.xmult = mult
        end
}    

jd_def["j_qualatro_onetwo_jump"] = { -- 1, 2, Joker!
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
            { text = ",2)" }
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() and scoring_card:get_id() == 14 or scoring_card:get_id() == 2 then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
            card.joker_display_values.localized_text = localize("k_aces")
        end
}

jd_def["j_qualatro_gegagedigedagedago"] = { -- Gegagedigedagedago
    extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds"
    }, {
        text = ")"
    }}},
    extra_config = {
        colour = G.C.GREEN,
        scale = 0.3
    },
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'gegagedigedagedadie')
        card.joker_display_values.odds = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
    end
}

jd_def["j_qualatro_nico_nico"] = { -- Nico Nico
}

jd_def["j_qualatro_poke_party"] = { -- Poké Party (FIGURE OUT HOW TO USE CUSTOM FUNCTION VALUE)
--[[         text = {
            { text = "+" },
            { ref_table = "joker_display_values", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local jokerusage = #G.GAME.poke_party_joker_usage 
            card.joker_display_values.chips = card.ability.extra.chips_mod * jokerusage
        end           ]]          
}

jd_def["j_qualatro_reverb"] = { -- Reverberation (NEEDS FORMATTING WORK)
--[[     extra = {{{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds5"
    }, {
        text = ")"
    }},
    {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds4"
    }, {
        text = ")"
    }},
    {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds3"
    }, {
        text = ")"
    }},
    {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds2"
    }, {
        text = ")"
    }},
    {{
        text = "("
    }, {
        ref_table = "card.joker_display_values",
        ref_value = "odds1"
    }, {
        text = ")"
    }}
},
    extra_config = {
        colour = G.C.GREEN
    },
    calc_function = function(card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.base_odds, 'reverb')
        card.joker_display_values.odds1 = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator, denominator}
        }
        card.joker_display_values.odds2 = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator ^ 2, denominator ^ 2}
        }        
        card.joker_display_values.odds3 = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator ^ 3, denominator ^ 3}
        }
        card.joker_display_values.odds4 = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator ^ 4, denominator ^ 4}
        }        
        card.joker_display_values.odds5 = localize {
            type = 'variable',
            key = "jdis_odds",
            vars = {numerator ^ 5, denominator ^ 5}
        }
    end,
    style_function = function(card, text, reminder_text, extra)
        if text and text.children[1] then
            text.children[1].config.scale = 0.3
    end
        if text and text.children[2] then
            text.children[2].config.scale = 0.25
    end
        if text and text.children[3] then
            text.children[3].config.scale = 0.2
    end
        if text and text.children[4] then
            text.children[4].config.scale = 0.15
    end
        if text and text.children[5] then
            text.children[5].config.scale = 0.1
    end                
        return false
    end     ]]
}

jd_def["j_qualatro_gadget_room"] = { -- Gadget Room
}

jd_def["j_qualatro_missingno"] = { -- MissingNo. (HELP)
}

jd_def["j_qualatro_crazy_bus"] = { -- Crazy Bus
        text = {
            { text = "+" },
            { ref_table = "card.ability", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {{
            text = "(3,4)"
        }},        
}