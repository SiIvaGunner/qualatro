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
        text = " ",
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
        card.joker_display_values.scale = betamix and 1 or 0
end    
}