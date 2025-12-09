return {
	descriptions = {
		Back={},
		Blind={},
		Edition={},
		Enhanced={},
		Joker={
			j_qualatro_beta_mix_alt = { -- alternate description of (Beta Mix)
				name = "(Beta Mix)",
				text = {
					"{C:chips}+#1#{} chips",
					"{X:mult,C:white,s:0.8}X#2#{}{C:inactive,s:0.8} Mult if {}{C:attention,s:0.8}Joker{}{C:inactive,s:0.8} is to the {}{C:attention,s:0.8}left{}",
				},
			},
			j_qualatro_mm2wood_alt = {
				name = "mm2wood",
				text = {
					"{C:chips}+#1#{} Chips",
					"{C:attention,s:0.8}Leaf Shield{}{s:0.8}: Disables {}{C:attention,s:0.8}#2#{}",
				},
			},
			j_qualatro_gadget_room_alt = { -- alternate description of Gadget Room
				name = "Gadget Room",
				text = {
					"Cards in {C:attention}first hand{}",
					"of round return to {C:attention}deck{}",
					"{C:inactive,s:0.7}Beware of the {}{C:red,s:0.7,E:1}Popcorn Explosion{}",
				},
			},
			j_qualatro_limited_liability_partnership_alt = {
				name = "Limited Liability Partnership",
				text = {
					"This Joker {C:attention}steals half{} of your {C:money}blind cashout{}",
					"Gives {X:mult,C:white} X#1# {} Mult for each {C:money}dollar{} stolen.",
					"{C:inactive}(Stolen: {C:money}$#2#{C:inactive}){}",
					"{C:inactive,s:0.7}(Leftmost Joker steals first){}",
				},
			},
			j_qualatro_bites_the_dust_alt = {
				name = "BITES THE DUST",
				text = {
					"Obtain {C:attention}#1#{} copies of the last",
					"{C:red}destroyed{} playing card this {C:attention}ante{}",
					"when {C:attention}Boss Blind{} is defeated",
					"{C:inactive}(Currently: {V:1}#2#{}{C:inactive}){}",
					"{C:inactive,s:0.7}Rightmost cards always destroyed last{}",
				}
			},
			j_qualatro_etika_reveal= {
				name = "JOKER REVEAL!!!",
				text = {
					"This Joker gains {X:mult,C:white} X#1# {} Mult",
					"{C:attention}#2#{} times in a row when",
					"{C:attention}#3#{} is revealed",
					"in the shop or otherwise",
					"{C:inactive}(Currently {X:mult,C:white} X#4# {C:inactive} Mult)",
				}
			},
			j_qualatro_etika_reveal_template = {
				name = " REVEAL!!!", --NOTE: (Ahmayk) modified in generate_ui
			},
		},
		Other={
			p_qualatro_tournament_normal_1 = {
				name = "Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_normal_2 = {
				name = "Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_normal_3 = {
				name = "Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_normal_4 = {
				name = "Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_jumbo_1 = {
				name = "Jumbo Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_jumbo_2 = {
				name = "Jumbo Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_mega_1 = {
				name = "Mega Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
			p_qualatro_tournament_mega_2 = {
				name = "Mega Tournament Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{C:qualatro_contestant} Contestant{} cards",
				},
			},
		},
		Planet={},
		Spectral={},
		Stake={},
		Tag={},
		Tarot={},
		Voucher={
			v_qualatro_tournament_voucher_1 ={
				name="Tournament Voucher 1",
				text={
					"{C:qualatro_contestant}Contestant{} Jokers",
					"appear in the shop"
				},
			},
			v_qualatro_tournament_voucher_2 ={
				name="Tournament Voucher 2",
				text={
					"{C:qualatro_contestant}Contestant{} Jokers appear",
					"{C:attention}#1#X{} more often in the shop",
					"and are {C:attention}#1#X{} more likely to have",
					"an {C:dark_edition}edition{}"
				},
			},
		},
	},
	misc = {
		achievement_descriptions={},
		achievement_names={},
		blind_states={},
		challenge_names={},
		collabs={},
		dictionary={
			k_qualatro_contestant="Contestant",
			k_qualatro_tournament_pack="Tournament",

			qua_abstracted_ex="Abstracted!",
			qua_debuff_ex="Debuff!",
			qua_beaned_ex="BEANED!!!",
			qua_copied_ex="Copied!",
			qua_downgrade_ex="Downgrade!",
			qua_doover_ex="Do-over!",
			qua_escaped_ex="Escaped!",
			qua_escaped_question="Escaped?",
			qua_fused_ex="Fused!",
			qua_gadunk="Gadunk",
			qua_got_lucky_ex="Got Lucky!",
			qua_good_night="Good Night",
			qua_help_me="HELP ME",
			qua_helped_ex="Helped!",
			qua_iamgod="I AM GOD",
			qua_loaded="Loaded.",
			qua_loop_ex="Loop!",
			qua_loophole_ex="Loophole Found!",
			qua_out_of_buisness_ex="Out of Business!",
			qua_purge="Purge.",
			qua_pussy_ex="Pussy!",
			qua_refused_ex="Refused!",
			qua_revived_ex="Revived!",
			qua_run_away_ex="Run Away!",
			qua_sold_ex="Sold!",
			qua_steel="Steel",
			qua_snapped_ex="Snapped!",
			qua_taxed_ex="Taxed!",
			qua_trapped_ex="Trapped!",
			qua_wh="WH-",
			qua_what="WHAT",
			qua_yankin_ex="Yankin!",
		},
		high_scores={},
		labels={
			qualatro_stingy="Stingy's",
		},
		poker_hand_descriptions={},
		poker_hands={},
		quips={
			m_1={
				"I'M SORRY...",
			},
			m_2={
				"I WILL",
				"HURT YOU",
			},
			m_3={
				"STAY AWAY",
				"FROM ME"
			},
			m_4={
				"PLEASE LEAVE",
				"ME ALONE",
			},
			m_5={
				"YOU KIND OF",
				"SUCK AT THIS",
			},
			m_6={
				"NEXT TIME",
				"DON'T PICK ME",
			},
			m_7={
				"DID YOU WANT",
				"TO DIE?",
			},
			m_8={
				"I DON'T",
				"WANT THIS",
			},
		},
		ranks={},
		suits_plural={},
		suits_singular={},
		tutorial={},
		v_dictionary={
			qua_discard="+#1# Discard",
			qua_discards="+#1# Discards",
			qua_discard_minus="-#1# Discard",
			qua_discards_minus="-#1# Discards",
			qua_hand="+#1# Hand",
			qua_hand_minus="-#1# Hand",
			qua_hands_minus="-#1# Hands",
			qua_tax_fraud="TA-TA-TAX FRAUD! ($#1# max interest)",
			qua_and_chip="and +#1# Chip",
			qua_and_chips="and +#1# Chips",
		},
		v_text={
            ch_c_qualatro_only = {
				'Play using only {C:attention}Qualatro{} Jokers',
			},
            ch_c_bypass_unlocks = {
				'Cards are discovered when obtained',
			},
            ch_c_qualatro_seven_challenge = {
                "Start with {C:attention}7 7{}s",
			},
            ch_c_seven_1= {
				"All poker hands start at {C:blue}7 chips{} and {C:mult}7 mult{}"
			},
            ch_c_seven_2= {
				"All poker hand level ups give {C:blue}+7 chips{} and {C:mult}+7 mult{}"
			},
            ch_c_seven_3= {
                "When ante {C:attention}7{} boss is defeated, set Joker slots to {C:attention}7{}",
			},
            ch_c_seven_4= {
                "Everything costs {C:money}$7{}",
			},
            ch_c_seven_5= {
                "Interest caps at {C:money}$7{}",
			},
            ch_c_seven_6= {
				--"Go up to {C:red}-$7{} dollars in debt",
			},
            ch_c_seven_7= {
                "Multiply all {C:green}probabilities{} by {C:green}7{}",
			},
            ch_c_common_rule = {
                "Only play with {C:blue}Common{} Jokers",
			},
            ch_c_qualatro_brainrot = {
                "The only Jokers that appear in"
			},
            ch_c_qualatro_brainrot_2 = {
				"the shop row and Buffoon Packs are"
			},
            ch_c_qualatro_brainrot_3 = {
				"{C:attention}Boykisser{}, {C:attention}Pomni{}, and {C:attention}Gegagedigedagedago{}"
			},
            ch_c_qualatro_dancing_mad = {
				"All blinds are {C:attention}Boss Blinds{}"
			},
            ch_c_win_ante= {
                "{C:attention}Win{} at ante {C:attention}#1#{}",
			},
            ch_c_scaling = {
				"Required score scales {C:attention}x#1#{} faster for each ante"
			},
            ch_c_kfad_editions = {
				"All Jokers are {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}"
			},
            ch_c_missingno = {
				"{C:inactive}Noooooooooooooooooooooooooo{}"
			},
            ch_c_missingno_oops_1 = {
				"yyyyyyyyyyyyyyyyyyyyyyyyyeyeayeayeayeayeayeayeayeayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayheayh eayh eayh eayh geayh geayho geayho geayho geayho g eayho g eayho g eayho g eayho g eahyho g eahyho g eahyho ge eahyho ge"
			},
            ch_c_missingno_oops_2 = {
				"aeahyho gde aeahyho gd e aeahyho gd e aeahyhoa gd e aeahyhoa gd en aed ahyhoa gd en aed ahyhoa gdr en aed aehayhoa gdrd en aed aehay hoa gdrd en aed aehtay hoa gdrdh en aed aeehtay ho a gdrdh en aeds aeehtay ho a gdcrdh en aeds haeehteay ho a gdcrddh en aeds haeehutealy ho a gdcrddeh en ae ds haeehutealyf ho a godcrddeh en aer ds h aeehutealyf ho a mgodcrddoeh"
			},
            ch_c_missingno_oops_3 = {
				" en aer drs h aeehutealeyf ho a mgodcrddoeh en aerd ders h aeehutealeyf ho ta mgoadcrddoeh eni aerd delrs h aeehutealeyf sho ta mgoadcrddoeh eni aerd delrs h aeehutealeyf sho ta mgoadcrd"
			},
            ch_c_missingno_oops_4 = {
				"doeh eni aerd delrs h aeehutealeyf sho ta mgoadcrd"
			}
		},
	},
}
