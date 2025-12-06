SMODS.process_loc_text(G.localization.misc.v_text, "ch_c_qualatro_only", {
	key = "ch_c_qualatro_only",
	name = {
		'Play using only {C:attention}Qualatro{} Jokers',
	},
}, 'name')

SMODS.Challenge {
	key = "QualatroOnly",
	loc_txt = {
		key = "QualatroOnly",
		name = 'Qualatro Only',
	},
	rules = {
	custom = {
			{id = 'qualatro_only'},
		},
		modifiers = {
		}
	},
	jokers = {
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {},
		banned_tags = {
		},
		banned_other = {
		}
	}
}

SMODS.Challenge {
	key = "Stingy",
	loc_txt = {
		key = "stingy",
		name = "Stingy's Challenge",
	},
	rules = {
	custom = {
			-- {id = 'qualatro_only'},
			{id = 'no_reward'},
			{id = 'no_extra_hand_money'},
			{id = 'no_interest'}
		},
		modifiers = {
			-- {id = 'joker_slots', value = 8},
		}
	},
	jokers = {
		{ id = 'j_qualatro_stingy', eternal = true },
		{ id = 'j_qualatro_stingy', eternal = true },
		{ id = 'j_qualatro_stingy', eternal = true },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
			{id = 'v_seed_money'},
			{id = 'v_money_tree'},
			{id = 'j_to_the_moon'},
			{id = 'j_rocket'},
			{id = 'j_golden'},
			{id = 'j_satellite'},
			{id = 'j_qualatro_haltmann'},
			{id = 'j_qualatro_tax_fraud'},
		},
		banned_tags = {},
		banned_other = {}
	}
}

SMODS.Challenge {
	key = "traffic_jam",
	loc_txt = {
		key = "traffic_jam",
		name = "Traffic Jam",
	},
	rules = {
	custom = {
		},
		modifiers = {
			-- {id = 'joker_slots', value = 8},
		}
	},
	jokers = {
		{ id = 'j_ride_the_bus', eternal = true },
		{ id = 'j_qualatro_ride_the_raft', eternal = true },
		{ id = 'j_qualatro_crazy_bus', eternal = true },
		{ id = 'j_qualatro_crazy_bus', eternal = true },
		{ id = 'j_qualatro_crazy_bus', eternal = true },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
			{id = 'j_shortcut'},
		},
		banned_tags = {},
		banned_other = {
			{id = 'bl_final_leaf', type = 'blind'}
		}
	}
}


SMODS.Challenge {
	key = "jury_recital",
	loc_txt = {
		key = "jury_recital",
		name = "Jury Recital",
	},
	rules = {
	custom = {
			{id = 'no_shop_jokers'},
		},
		modifiers = {
			{id = 'joker_slots', value = 3},
		}
	},
	jokers = {
		{ id = 'j_qualatro_jazz_cats_shades' },
		{ id = 'j_qualatro_jazz_cats_tom' },
		{ id = 'j_qualatro_jazz_cats_sphelonious' },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
			{id = 'c_judgement'},
			{id = 'c_wraith'},
			{id = 'c_soul'},
			{id = 'v_antimatter'},
			{id = 'p_buffoon_normal_1', ids = {
				'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1',
			}},
		},
		banned_tags = {
			{id = 'tag_rare'},
			{id = 'tag_uncommon'},
			{id = 'tag_holo'},
			{id = 'tag_polychrome'},
			{id = 'tag_negative'},
			{id = 'tag_foil'},
			{id = 'tag_buffoon'},
			{id = 'tag_top_up'},

		},
		banned_other = {
			{id = 'bl_final_leaf', type = 'blind'}
		}
	}
}

SMODS.Challenge {
	key = "grand_theft_wario",
	loc_txt = {
		key = "grand_theft_wario",
		name = "Grand Theft Wario",
	},
	rules = {
	custom = {
		},
		modifiers = {
			{id = 'dollars', value = 1},
		}
	},
	jokers = {
		{ id = 'j_qualatro_limited_liability_partnership', eternal = true, edition = 'negative' },
		{ id = 'j_qualatro_limited_liability_partnership', eternal = true, edition = 'negative' },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
		},
		banned_tags = {
		},
		banned_other = {
		}
	}
}

SMODS.Challenge {
	key = "common_rule",
	loc_txt = {
		key = "common_rule",
		name = "Trial Version",
	},
	rules = {
	custom = {
			{id = 'common_rule'},
			{id = 'no_reward'},
			{id = 'no_extra_hand_money'},
		},
		modifiers = {
            {id = 'dollars', value = 0},
		}
	},
	jokers = {
		{ id = 'j_qualatro_hypercam' },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
			{id = 'c_wraith'},
			{id = 'c_soul'},
		},
		banned_tags = {
			{id = 'tag_rare'},
			{id = 'tag_uncommon'},
		},
		banned_other = {
		}
	}
}

G.E_MANAGER:add_event(Event({
	func = function()
		local not_common = {}
		local qualatro_only_banned_cards = {}
		for k, v in pairs(G.P_CENTERS) do
			if v.set == "Joker" and v.rarity ~= 1 then
				not_common[#not_common+1] = {id=k}
			end
			if v.set == "Joker" and not string.find(k, 'j_qualatro_') then
				qualatro_only_banned_cards[#qualatro_only_banned_cards+1] = {id=k}
			end
		end
		SMODS.Challenge.obj_table.c_qualatro_common_rule.restrictions.banned_cards = not_common
		SMODS.Challenge.obj_table.c_qualatro_QualatroOnly.restrictions.banned_cards = qualatro_only_banned_cards
		return true
	end
}))

local _super_poll_rarity = SMODS.poll_rarity
function SMODS.poll_rarity(_pool_key, _rand_key)
	local ret = nil
	if G.GAME.modifiers.common_rule and _pool_key == "Joker" then
		ret = 1 
	else
		ret = _super_poll_rarity(_pool_key, _rand_key)
	end
	return ret
end

SMODS.Challenge {
	key = "qualatro_seven",
	loc_txt = {
		key = "qualatro_seven",
		name = "7",
	},
	rules = {
	custom = {
			{id = 'qualatro_seven_challenge'},
			{id = 'seven_1'},
			{id = 'seven_2'},
			{id = 'seven_3'},
			{id = 'set_eternal_ante', value = 7},
			{id = 'discard_cost', value = 7},
			{id = 'seven_4'},
			{id = 'seven_5'},
			--{id = 'seven_6'},
			{id = 'seven_7'},
			{id = 'win_ante', value = 7},
			--{id = 'seven_10'},
		},
		modifiers = {
			{id = 'dollars', value = 7},
			{id = 'discards', value = 7},
			{id = 'hands', value = 7},
			{id = 'reroll_cost', value = 7},
			{id = 'joker_slots', value = 7},
			{id = 'consumable_slots', value = 7},
			{id = 'hand_size', value = 7},
		}
	},
	jokers = {
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
        cards = {{s='D',r='7',},{s='D',r='7',},{s='H',r='7',},{s='H',r='7',},{s='C',r='7',},{s='C',r='7',},{s='S',r='7',}},
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
		},
		banned_tags = {
		},
		banned_other = {
			{id = 'bl_mark', type = 'blind'},
			{id = 'bl_plant', type = 'blind'},
		}
	}
}

SMODS.Challenge {
	key = "brainrot",
	loc_txt = {
		key = "brainrot",
		name = "Brainrot",
	},
	rules = {
	custom = {
			{id = 'qualatro_brainrot'},
			{id = 'qualatro_brainrot_2'},
			{id = 'qualatro_brainrot_3'},
		},
		modifiers = {
		}
	},
	jokers = {
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
		},
		banned_tags = {
			{id = 'tag_rare'},
			{id = 'tag_uncommon'},
			{id = 'tag_holo'},
			{id = 'tag_polychrome'},
			{id = 'tag_negative'},
			{id = 'tag_foil'},
			{id = 'tag_buffoon'},
			{id = 'tag_top_up'},
		},
		banned_other = {
		}
	}
}

local _super_create_card = create_card

--NOTE: (Ahmayk) forcing brainrot jokers only accounts for shop jokers and buffon packs
--tarot cards and other means of obtaining jokers remain legal
--banned joker tags though as that causes the joker to appear in the shop which breaks the rules
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)

	if 
		G.GAME.modifiers.qualatro_brainrot and
		(key_append == "sho" or key_append == "buf") and
		_type == "Joker"
	then
		forced_key = pseudorandom_element({"j_qualatro_pomni", "j_qualatro_boykisser", "j_qualatro_gegagedigedagedago"}, pseudoseed("brainrot_challenge"))
	end

	local card = _super_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	return card
end

SMODS.Challenge {
	key = "dancing_mad",
	loc_txt = {
		key = "dancing_mad",
		name = "Jimbo's Domain",
	},
	rules = {
	custom = {
			{id = 'qualatro_dancing_mad'},
			{id = 'win_ante', value = 4},
		},
		modifiers = {
		}
	},
	jokers = {
		{id = 'j_qualatro_dancing_mad', eternal = true},
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
		},
		banned_tags = {
		},
		banned_other = {
		}
	}
}

SMODS.Challenge {
	key = "kfad",
	loc_txt = {
		key = "kfad",
		name = "KFAD Afterparty",
	},
	rules = {
	custom = {
			{id = 'kfad'},
			{id = 'scaling', value = 7},
			{id = 'kfad_editions'},
		},
		modifiers = {
		}
	},
	jokers = {
		{ id = 'j_qualatro_king_for_eternity', edition = 'holo' },
		{ id = 'j_qualatro_djpk', edition = 'polychrome' },
	},
	consumeables = {
	},
	vouchers = {
	},
	deck = {
        cards = {{s='D',r='2',},{s='D',r='3',},{s='D',r='4',},{s='D',r='5',},{s='D',r='6',},{s='D',r='7',},{s='D',r='8',},{s='D',r='9',},{s='D',r='T',},{s='D',r='J',},{s='D',r='Q',},{s='D',r='A',},{s='C',r='2',},{s='C',r='3',},{s='C',r='4',},{s='C',r='5',},{s='C',r='6',},{s='C',r='7',},{s='C',r='8',},{s='C',r='9',},{s='C',r='T',},{s='C',r='J',},{s='C',r='Q',},{s='C',r='A',},{s='H',r='2',},{s='H',r='3',},{s='H',r='4',},{s='H',r='5',},{s='H',r='6',},{s='H',r='7',},{s='H',r='8',},{s='H',r='9',},{s='H',r='T',},{s='H',r='J',},{s='H',r='Q',},{s='H',r='A',},{s='S',r='2',},{s='S',r='3',},{s='S',r='4',},{s='S',r='5',},{s='S',r='6',},{s='S',r='7',},{s='S',r='8',},{s='S',r='9',},{s='S',r='T',},{s='S',r='J',},{s='S',r='Q',},{s='S',r='A',},},
		type = 'Challenge Deck'
	},
	restrictions = {
		banned_cards = {
			{id = 'c_wheel_of_fortune'},
			{id = 'c_ectoplasm'},
			{id = 'c_ankh'},
			{id = 'c_hex'},
			{id = 'v_hone'},
			{id = 'v_glow_up'},
		},
		banned_tags = {
			{id = 'tag_negative'},
		},
		banned_other = {
		}
	}
}

local _super_poll_edition = poll_edition
function poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
	if G.GAME and G.GAME.modifiers.kfad then
		_guaranteed = true
		_no_neg = true
	end
	local ret = _super_poll_edition(_key, _mod, _no_neg, _guaranteed, _options)
	return ret
end

--NOTE: (Ahmayk) this only appears if you start the app with a profile
--that has missingno unlocked, and does not change if you switch to a profile
--which doesn't and vice versa. normally that'd be bad but that's perfectly
--esoteric for missingno lol
G.E_MANAGER:add_event(Event({
	func = function()
		local missingno = G.P_CENTERS['j_qualatro_missingno'];
		if missingno and missingno.discovered then
			SMODS.Challenge {
				key = "missingno",
				loc_txt = {
					key = "missingno",
					name = "[UI ERROR]",
				},
				rules = {
					custom = {
						{id = "missingno"}
					},
					modifiers = {
					}
				},
				jokers = {
					{ id = 'j_qualatro_missingno', eternal = true },
				},
				consumeables = {
				},
				vouchers = {
				},
				deck = {
					type = 'Challenge Deck'
				},
				restrictions = {
					banned_cards = {
					},
					banned_tags = {
					},
					banned_other = {
					}
				}
			}

    		if G.PROFILES[G.SETTINGS.profile].challenge_progress.completed['c_missingno'] then
				SMODS.Challenge {
					key = "missingno_oops",
					loc_txt = {
						key = "missingno_oops",
						name = "PLEASE STOP",
					},
					rules = {
						custom = {
							{id = "missingno_oops_1"},
							{id = "missingno_oops_2"},
							{id = "missingno_oops_3"},
							{id = "missingno_oops_4"},
							{id = "missingno_oops_4"},
							{id = "missingno_oops_4"},
							{id = "missingno_oops_4"},
							{id = "missingno_oops_4"},
						},
						modifiers = {
						}
					},
					jokers = {
						{ id = 'j_oops', eternal = true, edition = 'negative' },
						{ id = 'j_oops', eternal = true, edition = 'negative' },
						{ id = 'j_qualatro_missingno', eternal = true },
						{ id = 'j_oops', eternal = true, edition = 'negative' },
						{ id = 'j_oops', eternal = true, edition = 'negative' },
					},
					consumeables = {
					},
					vouchers = {
					},
					deck = {
						type = 'Challenge Deck'
					},
					restrictions = {
						banned_cards = {
						},
						banned_tags = {
						},
						banned_other = {
						}
					}
				}
			end
		end
		return true
	end
}))


