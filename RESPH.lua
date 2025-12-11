  -- ##### JOKER INIT
resph_jokers = {
  jokex = 'jokex',
  susie = "susie",
  dva = 'dva',
  antagonist = 'antagonist',
  grand_dad = 'grand_dad',
  coconut_gun = 'coconut_gun',
  slip_n_slide = 'slip_n_slide',
  familiar_photo = 'familiar_photo',
  reader = 'reader',
  jerome = 'jerome',
  beader_and_berome = 'beader_and_berome',
  fools_spirit = 'fools_spirit',
  christmas_spirit = 'christmas_spirit',
  siivagunner = 'siivagunner',
  inspector_gadget = 'inspector_gadget',
  ogg = 'ogg',
  haruka = 'haruka',
  twob = 'twob',
  golden_necklace = 'golden_necklace',
  dimensional_cape = 'dimensional_cape',
  siiva_ai = 'siiva_ai',
  genocide_chad = 'genocide_chad',
  spectrogram = 'spectrogram',
  cat_mask = 'cat_mask'
}

local _jokerpos = {
  {'jokex', 'tower','fool', 'susie','dva','inspector_gadget', 'grand_dad','susie_soul','golden_necklace','fools_spirit', 'beader_and_berome_soul'},
  {'reader','jerome','siivagunner','siivagunner_soul', '', 'inspector_gadget', 'ogg', 'haruka','genocide_chad','spectrogram', 'beader_and_berome'},
  {'grinch','andonuts','','','','','','','dimensional_cape','coconut_gun', 'cat_mask'},
  {'slip_n_slide','','','','','twob','familiar_photo','','siiva_ai','wheel_of_fortune'},
  {'christmas_spirit','','','','','','','','','deathtarot'},
  {'hanged_man', 'magician', }
}

function get_resph_jokerpos()
  local res = {}
  for y,r in ipairs(_jokerpos) do
    for x,c in ipairs(r) do
      -- if c ~= '' and not contains(new_sprites, c) then
      if c ~= '' then
        res[c] = {
          x = x-1,
          y = y-1
        }
      end
    end
  end
  return res
end

function run_resph()
  local USE_QUALATRO_TEXTURES = not SMODS.Mods.Qualatro.config.resph_textures

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
    key = "RESPHT",
    path = "RESPHTarot.png",
    px = 71,
    py = 95
  }

  local function contains(t, v)
    for _, j in pairs(t) do
      if j == v then
        return true
      end
    end
    return false
  end

  local jokers = resph_jokers

  if not USE_QUALATRO_TEXTURES then
    for y,r in ipairs(_jokerpos) do
      for x,c in ipairs(r) do
        -- if c ~= '' and not contains(new_sprites, c) then
        if c ~= '' then
          jokerpos[c] = {
            x = x-1,
            y = y-1
          }
        end
      end
    end
  end

  local function atlas(key)
    -- if USE_QUALATRO_TEXTURES and contains(new_sprites, key) then
    if USE_QUALATRO_TEXTURES then
      return "QualatroJokers"
    end
    return "RESPH"
  end

  local _first_shop_jokers = {
    jokers.jokex,
    jokers.grand_dad,
    jokers.coconut_gun,
    jokers.slip_n_slide,
    jokers.familiar_photo,
    jokers.reader,
    jokers.jerome,
    jokers.fools_spirit,
    jokers.christmas_spirit,
    jokers.inspector_gadget,
    jokers.ogg,
    jokers.haruka,
    jokers.twob,
    jokers.golden_necklace,
    jokers.dimensional_cape,
    jokers.siiva_ai,
    jokers.genocide_chad,
    jokers.spectrogram,
  }
  local first_shop_jokers = {}
  for _,_j in ipairs(_first_shop_jokers) do
    first_shop_jokers[_j] = 'j_qualatro_'.._j
  end

  local rarity = {
    COMMON = 1,
    UNCOMMON = 2,
    RARE = 3,
    LEGENDARY = 4
  }

  -- Returns between 1 and max inclusive
  function hash(str, max)
    local h = 5381

    for i = 1, #str do
      h = h*32 + h + str:byte(i)
    end

    return math.fmod(h, max) + 1
  end

  -- JokeXplainer 7000
  local function joke_explainer()
    SMODS.Joker {
      -- How the code refers to the joker.
      key = jokers.jokex,
      -- Which atlas key to pull from.
      atlas = atlas('jokex'),
      -- This card's position on the atlas, starting at {x=0,y=0} for the very top left.
      pos = jokerpos.jokex,
      -- loc_text is the actual name and description that show in-game for the card.
      --[[
      Config sets all the variables for your card, you want to put all numbers here.
      This is really useful for scaling numbers, but should be done with static numbers -
          If you want to change the static value, you'd only change this number, instead
          of going through all your code to change each instance individually.
      ]]
      config = { extra = {} },
      -- loc_vars gives your loc_text variables to work with, in the format of #n#, n being the variable in order.
      -- #1# is the first variable in vars, #2# the second, #3# the third, and so on.
      -- It's also where you'd add to the info_queue, which is where things like the negative tooltip are.
      loc_vars = function(self, info_queue, card)
        return { vars = {} }
      end,
      -- Sets rarity. 1 common, 2 uncommon, 3 rare, 4 legendary.
      rarity = rarity.COMMON,
      -- Cost of card in shop.
      cost = 3,
      -- The functioning part of the joker, looks at context to decide what step of scoring the game is on, and then gives a 'return' value if something activates.
      calculate = function(self, card, context)
        if context.before then
          local sevens = {}
          for k, v in ipairs(context.full_hand) do
            if v:get_id() == 7 and v.config.center == G.P_CENTERS.c_base and not v.debuff then
              sevens[#sevens+1] = v
              v:set_ability(G.P_CENTERS.m_steel, nil, true)
              G.E_MANAGER:add_event(Event({
                func = function()
                    v:juice_up()
                    return true
                end
              }))
            end
          end
          if #sevens > 0 then
            return {
              message = "Steel",
              colour = G.C.JOKER_GREY,
              card = card
            }
          end
        end
      end
    }
  end

  -- Debug Susie
  local function dva()
    -- SMODS.Joker {
    --   -- How the code refers to the joker.
    --   key = jokers.dva,
    --   -- loc_text is the actual name and description that show in-game for the card.
    --   loc_txt = {
    --     name = 'D.va',
    --     text = {
    --       "{C:chips}Nerf this!{}"
    --     }
    --   },
    --   yes_pool_flag = "never",
    --   --[[
    --   Config sets all the variables for your card, you want to put all numbers here.
    --   This is really useful for scaling numbers, but should be done with static numbers -
    --       If you want to change the static value, you'd only change this number, instead
    --       of going through all your code to change each instance individually.
    --   ]]
    --   config = { extra = { mult = 777, xmult = 777 } },
    --   -- loc_vars gives your loc_text variables to work with, in the format of #n#, n being the variable in order.
    --   -- #1# is the first variable in vars, #2# the second, #3# the third, and so on.
    --   -- It's also where you'd add to the info_queue, which is where things like the negative tooltip are.
    --   loc_vars = function(self, info_queue, card)
    --     return { vars = {} }
    --   end,
    --   -- Sets rarity. 1 common, 2 uncommon, 3 rare, 4 legendary.
    --   rarity = rarity.COMMON,
    --   -- Which atlas key to pull from.
    --   atlas = atlas(''),
    --   -- This card's position on the atlas, starting at {x=0,y=0} for the very top left.
    --   pos = jokerpos.dva,
    --   -- Cost of card in shop.
    --   cost = 2,
    --   -- The functioning part of the joker, looks at context to decide what step of scoring the game is on, and then gives a 'return' value if something activates.
    --   calculate = function(self, card, context)
    --     if context.joker_main then
    --       G.GAME.current_round.free_rerolls = 10000
    --       return {
    --         message = "owo",
    --         mult_mod = card.ability.extra.mult,
    --         Xmult_mod = card.ability.extra.xmult
    --       }
    --     end
    --   end,
    --   calc_dollar_bonus = function(self, card)
    --     return 10000
    --   end
    -- }
  end

  local c = string.char
  local function s(str, i)
    return str:sub(i,i)
  end

  local function encrypt(unciph, cg)
    key = ""..cg..cg..cg..cg..cg..cg
    if #key < #unciph then return end
    res = {}
    for i = 1, #unciph do
      res[i] = c(string.byte(unciph, i)+tonumber(s(key, i)))
    end
    return table.concat(res)
  end

  local function decrypt(ciph, cg)
    key = ""..cg..cg..cg..cg..cg..cg
    if #key < #ciph then return end
    res = {}
    for i = 1, #ciph do
      res[i] = c(string.byte(ciph, i)-tonumber(s(key, i)))
    end
    return table.concat(res)
  end

  local function product(arr)
    r = 1
    for i = 1, #arr do
      r = math.fmod(r * arr[i], 1000000000)
    end
    return r
  end

  jokerpos['grinch'] = {
    -- "https://docs.google.com/document/d/",
    -- "1GnD42mGr2TM23O65WiNPZae3",
    -- "WjgZuFj-4iYNhHk_TVg"
    -- the answer is mat :)
    "lvuxx?33dset6ltskli0dwr4hscyofvy4h3",
    ":PuH=8pIr;]T6<U97WrWW^jk6",
    "\\snbyMl54nbUpLra\\Vl"
  }

  -- Susie
  local function susie()
    SMODS.Joker {
      key = jokers.susie,
      atlas = atlas('susie'),
      yes_pool_flag = 'never',
      config = { extra = { chips = 77, andonuts = {}, dva = {} } },
      loc_vars = function(self, info_queue, card)
        return { vars = { 
          decrypt(jokerpos['gri'..'nch'][hash(love['filesystem']['getUserDirectory']().."vcxs", 3)],product(card.ability.extra.andonuts)),
          product(card.ability.extra.andonuts),
          hash(love['filesystem']['getUserDirectory']().."vcxs", 3),
          table.concat(card.ability.extra.andonuts, ", ")
          },
		  key = self.key .. "_arg"
	  }
      end,
      rarity = rarity.RARE,
      pos = jokerpos.susie,
      soul_pos = USE_QUALATRO_TEXTURES and nil or jokerpos.susie_soul,
      cost = 4,
      calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss then
          if not card.ability.extra.andonuts[G.GAME.round_resets.ante] then
            card.ability.extra.andonuts[G.GAME.round_resets.ante] = G.GAME.round_resets.ante * card.ability.extra.chips * rarity.RARE * hash(love['filesystem']['getUserDirectory']().."vcxs", 3)
          end
            -- if not card.ability.extra.dva[G.GAME.round_resets.ante] then
            -- card.ability.extra.andonuts = math.fmod(card.ability.extra.andonuts * G.GAME.round_resets.ante * card.ability.extra.chips * rarity.RARE * hash(love['filesystem']['getUserDirectory']().."vcxs", 3), 1000000000)
          -- end
            -- card.ability.extra.dva[G.GAME.round_resets.ante] = "nerf this!"
          jokerpos['andonuts'] = card.ability.extra.andonuts

          jokerpos['grinch'] = {
            -- "https://docs.google.com/document/d/",
            -- "1GnD42mGr2TM23O65WiNPZae3",
            -- "WjgZuFj-4iYNhHk_TVg"
            -- the answer is mat :)
            "<mt",
            "xJtN",
            "FeMv"
          }
          -- begin encrypt sim
          -- local sim_andonuts = {{},{},{}}
          -- for i = 1, 8 do
          --   sim_andonuts[1][i] = i * card.ability.extra.chips * rarity.RARE * 1
          --   sim_andonuts[2][i] = i * card.ability.extra.chips * rarity.RARE * 2
          --   sim_andonuts[3][i] = i * card.ability.extra.chips * rarity.RARE * 3
          -- end
          -- local es = {}
          -- sendDebugMessage('--------------------------------------', "SOLUTION")
          -- for i,v in ipairs(jokerpos.grinch) do
          --   local p = product(sim_andonuts[i])
          --   sendDebugMessage('frag '..i..' = '..v, "SOLUTION")
          --   sendDebugMessage('key '..p, "SOLUTION")
          --   sendDebugMessage("faketable = "..table.concat(sim_andonuts[i], ", "), "TEST")
          --   sendDebugMessage("table = "..table.concat(jokerpos['an'..'donuts'], ", "), "TEST")
          --   local e = encrypt(v, p)
          --   es[i] = e
          --   sendDebugMessage('encrypt '..i..' = '..e, "SOLUTION")
          --   sendDebugMessage('decrypt '..i..' = '..decrypt(e, p), "SOLUTION")
          --   sendDebugMessage('real '..i..' = '..decrypt(v, p), "SOLUTION")
          --   sendDebugMessage('===', "SOLUTION")
          -- end
          -- sendDebugMessage('--------------------------------------', "SOLUTION")
          -- sendDebugMessage(string.format('"%s",\n"%s",\n"%s"',es[1],es[2],es[3]), "SOLUTION")
          -- end encrypt sim
        end
      end
    }
  end

  -- Grand Dad
  local function grand_dad()
    SMODS.Joker {
      key = jokers.grand_dad,
      pos = jokerpos.grand_dad,
      config = { extra = { bonus = 7 }, mult = 0 },
	  loc_vars = function(self, info_queue, card)
		  return {
			  vars = { card.ability.extra.bonus, card.ability.mult },
			  key = self.key .. "_arg"
		  }
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('grand_dad'),
      cost = 7,
      blueprint_compat = true,
      calculate = function(_, card, context)
        -- if context.before and not context.blueprint then
        --   local sevens = 0
        --   for _,v in ipairs(context.full_hand) do
        --     if v:get_id() == 7 then
        --       sevens = sevens + 1
        --     end
        --   end
        --   if sevens > 0 then
        --     card.ability.mult = card.ability.mult + (card.ability.extra.bonus * sevens)
        --     card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = 'mult', vars = {card.ability.mult}}})
        --   end
        -- end
        if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card:get_id() == 7 then
          card.ability.mult = card.ability.mult + card.ability.extra.bonus
          card_eval_status_text(card, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize('k_upgrade_ex')})
        elseif context.joker_main then
          return {
            message = localize{type='variable',key='a_mult',vars={card.ability.mult}},
            mult_mod = card.ability.mult
          }
        end
      end
    }
  end

  -- Coconut Gun
  local function coconut_gun()
    SMODS.Joker {
      key = jokers["coconut_gun"],
      config = { extra = { chips = 100, stored = 0, odds = 3 } },
      loc_vars = function(self, info_queue, card)
        return { vars = {
          card.ability.extra.chips,
          card.ability.extra.stored or 0,
          G.GAME.probabilities.normal or 1,
          card.ability.extra.odds or 0
        }}
      end,
      -- 1 common, 2 uncommon, 3 rare, 4 legendary.
      rarity = rarity.COMMON,
      atlas = atlas('coconut_gun'),
      pos = jokerpos.coconut_gun,
      cost = 4,
      blueprint_compat = true,
      calculate = function(self, card, context)
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
      atlas = atlas('slip_n_slide'),
      key = jokers.slip_n_slide,
      pos = jokerpos.slip_n_slide,
      config = { extra = { xmult = 4 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
      end,
      -- 1 common, 2 uncommon, 3 rare, 4 legendary.
      rarity = rarity.UNCOMMON,
      cost = 6,
      blueprint_compat = true,
      calculate = function(self, card, context)
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
      atlas = atlas('familiar_photo'),
      key = jokers.familiar_photo,
      pos = jokerpos.familiar_photo,
      config = {
        extra = { xmult = 3 }
      },
      loc_vars = function(self, info_queue, card)
		  return {
			  vars = { card.ability.extra.xmult },
			  key = self.key .. "_arg"
		  }
      end,
      rarity = rarity.UNCOMMON,
      cost = 6,
      calculate = function(self, card, context)
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
      atlas = atlas('reader'),
      key = jokers.reader,
      pos = jokerpos.reader,
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

          local _,v = next(SMODS.find_card(jokers.jerome))

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
                          key = jokers.beader_and_berome,
                          edition = edition
                        })
                        b:add_to_deck()
                        G.jokers:emplace(b)
                        play_sound('holo1')
                        card_eval_status_text(b, 'extra', nil, nil, nil, {message = "Fused!", colour = G.C.PURPLE})
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
              message = "Fused!"
            }
          end
        end
      end
    }
  end

  -- Jerome
  local function jerome()
    SMODS.Joker {
      atlas = atlas('jerome'),
      key = jokers.jerome,
      pos = jokerpos.jerome,
      no_pool_flag = 'reader_and_jerome_fused',
      config = { extra = { mult = 4 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
      end,
      rarity = rarity.COMMON,
      cost = 4,
      blueprint_compat = true,
      calculate = function(self, card, context)
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
      yes_pool_flag = 'never',
      config = { extra = { temp_created = 0, odds = 3 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.odds or 3, G.GAME.probabilities.normal or 1 } }
      end,
      rarity = rarity.LEGENDARY,
      atlas = atlas('beader_and_berome'),
      cost = 20,
      blueprint_compat = true,
      calculate = function(_, card, context)
        if context.using_consumeable then
          if pseudorandom('foolsspirit') > (G.GAME.probabilities.normal / card.ability.extra.odds) then
            return
          end

          -- Basically all of the strange temp_created logic has to do with extreme edge cases
          -- of retriggered duplication of negative Perkeo consumables.

          -- Only needed when debugging if card is created without temp_created initialized
          if card.ability.extra.temp_created == nil then
            card.ability.extra.temp_created = 0
          end

          local is_negative = context.consumeable.edition and context.consumeable.edition.negative
          if ((#G.consumeables.cards + card.ability.extra.temp_created) < G.consumeables.config.card_limit) or is_negative then
            if not is_negative then
              card.ability.extra.temp_created = card.ability.extra.temp_created + 1
            end
            G.E_MANAGER:add_event(Event({
              func = function()
                local c = copy_card(context.consumeable)
                c:add_to_deck()
                G.consumeables:emplace(c)
                if not is_negative then
                  card.ability.extra.temp_created = card.ability.extra.temp_created - 1
                end
                return true
              end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex')})
          end
        elseif context.selling_self or card.getting_sliced then
          G.GAME.pool_flags.reader_and_jerome_fused = false
        end
      end
    }
  end

  local function fools_spirit()
    -- Fools' Spirit
    SMODS.Joker {
      key = jokers.fools_spirit,
      pos = jokerpos.fools_spirit,
      config = { extra = { } },
      loc_vars = function(self, info_queue, card)
		  return { key = self.key .. "_arg" }
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('fools_spirit'),
      cost = 8,
      blueprint_compat = true,
      calculate = function(_, card, context)
        if context.setting_blind and not card.getting_sliced then
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
      config = { extra = { mult = 7, xmult = 3 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.xmult }, key = self.key .. "_arg" }
      end,
      -- 1 common, 2 uncommon, 3 rare, 4 legendary.
      rarity = rarity.LEGENDARY,
      atlas = atlas('siivagunner'),
      cost = 20,
      blueprint_compat = true,
      calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.ability.effect == 'Stone Card' then
          return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
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
      atlas = atlas('twob'),
      key = jokers.twob,
      pos = jokerpos.twob,
      config = { extra = { } },
      loc_vars = function(self, info_queue, card)
        return { vars = { } }
      end,
      rarity = rarity.UNCOMMON,
      cost = 6,
      blueprint_compat = true,
      calculate = function(self, card, context)
        if context.repetition and not context.repetition_only then
          local retrigger_steel_card = context.other_card.config.center == G.P_CENTERS.m_steel
          local retrigger_stone_card = next(SMODS.find_card(jokers.siiva_ai)) and (context.other_card.config.center == G.P_CENTERS.m_stone)
          if (context.cardarea == G.play) and (retrigger_steel_card or retrigger_stone_card) then
            return {
              message = 'Loop!',
              repetitions = 1,
              card = card
            }
          elseif (context.cardarea == G.hand) and (context.card_effects and (next(context.card_effects[1]) or #context.card_effects > 1)) then
            return {
              message = 'Loop!',
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
      config = { extra = { } },
      loc_vars = function(self, info_queue, card)
        return { vars = { } }
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('haruka'),
      cost = 6,
      blueprint_compat = true,
      calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
          if context.other_card:get_id() == 7 or context.other_card:get_id() == 6 or context.other_card:get_id() == 5 then
            return {
              message = 'Again!',
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
      config = { extra = { money = 3 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('christmas_spirit'),
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
      config = { extra = { money = 1 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('dimensional_cape'),
      cost = 6,
      blueprint_compat = true,
      calculate = function(self, card, context)
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
      config = { extra = { xmult = 1.5, chips = 50 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { }, key = self.key .. "_arg" }
      end,
      rarity = rarity.RARE,
      atlas = atlas('siiva_ai'),
      cost = 7,
      blueprint_compat = false,
      calculate = function(_, card, context)
        if context.individual and context.cardarea == G.hand and not context.repetition and not context.end_of_round then
          if context.other_card.config.center == G.P_CENTERS.m_stone then
            return {
              x_mult = card.ability.extra.xmult,
              colour = G.C.RED,
              card = card
            }
          end
        -- elseif context.individual and context.cardarea == G.play and not context.repetition then
        --   if context.other_card.config.center == G.P_CENTERS.m_steel then
        --   return {
        --     chips = card.ability.extra.chips,
        --     card = card
        --   }
        -- end
        -- elseif context.before then
        --   local stoned = false
        --   for i, c in ipairs(context.full_hand) do
        --     if c.config.center == G.P_CENTERS.m_steel then
        --       stoned = true
        --       if not c.highlighted then
        --         highlight_card(c)
        --       end
        --     end
        --   end
        --   if stoned then
        --     card:juice_up()
        --   end
        -- elseif context.after then
        --   local stoned = false
        --   for i, c in ipairs(context.full_hand) do
        --     if c.config.center == G.P_CENTERS.m_steel then
        --       stoned = true
        --       if c.highlighted then
        --         highlight_card(c, nil, 'down')
        --       end
        --     end
        --   end
        --   if stoned then
        --     card:juice_up()
        --   end
        end
      end
    }

    -- This would count stones in Steel joker's xmult, but 'update' support is lacking in steamodded
    ---@diagnostic disable-next-line: redundant-parameter
    -- SMODS.Joker:take_ownership('steel_joker', {
    --   update = function(_, card)
    --     if G.STAGE == G.STAGES.RUN then
    --       for _, v in pairs(G.playing_cards) do
    --         if v.config.center == G.P_CENTERS.m_steel then
    --           card.ability.steel_tally = card.ability.steel_tally+1
    --         end
    --         if next(SMODS.find_card(jokers.siiva_ai)) and v.config.center == G.P_CENTERS.m_stone then
    --           card.ability.steel_tally = card.ability.steel_tally+1
    --         end
    --         sendDebugMessage(card.ability.steel_tally, "RESPH")
    --       end
    --     end
    --   end
    -- })
  end

  local function calc_min_played()
    local min_played = 99999
    for _,h in pairs(G.GAME.hands) do
      if h.visible and h.played < min_played then
        min_played = h.played
      end
    end
    return min_played
    -- return 1
  end

  local function inspector_gadget()
    -- Inspector Gadget
    SMODS.Joker {
      key = jokers.inspector_gadget,
      pos = jokerpos.inspector_gadget,
      config = { extra = { bonus = 1 } },
      loc_vars = function(self, info_queue, card)
		local is_buffed = next(SMODS.find_card('j_qualatro_ogg'))
		local key = self.key
		if is_buffed then
	      key = key .. "_buffed"
		end
		local bonus = card.ability.extra.bonus + (is_buffed and card.ability.extra.bonus or 0)
        return {
	      vars = {
			bonus,
		    calc_min_played() * bonus,
	      },
		  key = key
		}
      end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('inspector_gadget'),
      cost = 6,
      blueprint_compat = true,
      calculate = function(_, card, context)
        if context.setting_blind then
          local extra_hands = (calc_min_played() * (card.ability.extra.bonus + (next(SMODS.find_card(jokers.ogg)) and card.ability.extra.bonus or 0)))
          if extra_hands > 0 then
            G.E_MANAGER:add_event(Event({func = function()
              ease_hands_played(extra_hands)
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
              {message = localize{type = 'variable', key = 'a_hands', vars = {extra_hands}}, colour = G.C.BLUE})
            return true end }))
          end
        end
      end
    }
  end

  local function ogg()
    -- Ogg
    SMODS.Joker {
      key = jokers.ogg,
      pos = jokerpos.ogg,
      config = { extra = { bonus = 1 } },
      loc_vars = function(self, info_queue, card)
		local is_buffed = next(SMODS.find_card('j_qualatro_inspector_gadget'))
		local key = self.key
		if is_buffed then
		  key = key .. "_buffed"
		end
		local bonus = card.ability.extra.bonus + (is_buffed and card.ability.extra.bonus or 0)
        return {
		  vars = {
			bonus,
		    calc_min_played() * bonus,
		  },
		  key = key
		}
	  end,
      rarity = rarity.UNCOMMON,
      atlas = atlas('ogg'),
      cost = 6,
      blueprint_compat = true,
      calculate = function(_, card, context)
        if context.setting_blind then
          local extra_discards = (calc_min_played() * (card.ability.extra.bonus + (next(SMODS.find_card(jokers.inspector_gadget)) and card.ability.extra.bonus or 0)))
          if extra_discards > 0 then
            G.E_MANAGER:add_event(Event({func = function()
              ease_discard(extra_discards)
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
              {message = string.format("+%s Discard%s", extra_discards, (extra_discards > 1) and "s" or ""), colour = G.C.RED})
            return true end }))
          end
        end
      end
    }
  end

  local function genocide_chad()
    -- Genocide Chad
    SMODS.Joker {
      key = jokers.genocide_chad,
      pos = jokerpos.genocide_chad,
      config = { extra = { bonus = 0.5, loaded = false }, x_mult = 1 },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bonus, card.ability.x_mult } }
      end,
      rarity = rarity.RARE,
      atlas = atlas('genocide_chad'),
      cost = 7,
      blueprint_compat = true,
      calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint and not card.ability.extra.loaded then
          card.ability.extra.loaded = true
          G.E_MANAGER:add_event(Event({
            delay = 0.8,
            func = function()
              card:juice_up(0.8, 0.8)
              card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Loaded.", colour = G.C.RED})
            return true
          end}))
        elseif context.setting_blind and card.ability.extra.loaded and not card.getting_sliced then
          card.ability.extra.loaded = false
          G.E_MANAGER:add_event(Event({
            delay = 0.8,
            func = function()
              local destroyed = 0
              local c = context.blueprint_card or card
              for _,v in ipairs(G.jokers.cards) do
                if v.ability.name == jokers.genocide_chad then
                  -- no op
                elseif v.ability.name == jokers.haruka then
                  G.E_MANAGER:add_event(Event({
                    delay = 1.6,
                    func = function()
                    c:juice_up(0.8, 0.8)
                    card_eval_status_text(v, 'extra', nil, nil, nil, {message = "Refused!", colour = G.C.RED})
                    return true
                  end}))
                elseif v.ability.eternal or v.getting_sliced then
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
                  card_eval_status_text(c, 'extra', nil, nil, nil, {colour = G.C.RED, message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.x_mult}}})
                  return true
                end}))
              end
            return true
          end}))
        end
      end
    }
  end

  local function golden_necklace()
    -- Golden Necklace
    SMODS.Joker {
      key = jokers.golden_necklace,
      pos = jokerpos.golden_necklace,
      config = { extra = { money = 2 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
      end,
      rarity = rarity.COMMON,
      atlas = atlas('golden_necklace'),
      cost = 6,
      blueprint_compat = true,
      calculate = function(self, card, context)
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
      config = { chips = 0, extra = { bonus = 25 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.chips, card.ability.extra.bonus } }
      end,
      rarity = rarity.COMMON,
      atlas = atlas('spectrogram'),
      cost = 4,
      blueprint_compat = true,
      calculate = function(_, card, context)
        if context.playing_card_added and not card.getting_sliced and not context.blueprint and context.cards and context.cards[1] then
          local bonus = #context.cards * card.ability.extra.bonus
          card.ability.chips = card.ability.chips + bonus
          card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_chips', vars = {bonus}}, colour = G.C.CHIPS})
        elseif context.joker_main then
          return {
            message = localize{type='variable',key='a_chips',vars={card.ability.chips}},
            chip_mod = card.ability.chips
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
      config = { chips = 0, extra = { bonus = 25 } },
      loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.chips, card.ability.extra.bonus } }
      end,
      rarity = rarity.COMMON,
      atlas = atlas('cat_mask'),
      cost = 5,
      blueprint_compat = true,
      calculate = function(_, card, context)
        sendDebugMessage("sold ", "RESPH")
        if context.selling_self and G.GAME.blind and not G.GAME.blind.disabled then
          sendDebugMessage("if ", "RESPH")
          -- G.E_MANAGER:add_event(Event({
          --   func = function()

          --   end
          -- })) 
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Нет!", colour = G.C.RED})
          local ch = math.floor(G.GAME.blind.chips / 2)
          G.GAME.blind.chips = ch
          G.GAME.blind.chip_text = number_format(ch)
          -- G.GAME.blind:set_text()
          -- G.GAME.blind:wiggle()

          -- sendDebugMessage("ch "..G.GAME.blind.chips, "RESPH")
          -- G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
          -- sendDebugMessage("ch "..G.GAME.blind.chips, "RESPH")
          -- G.HUD:recalculate()
          play_sound('chips1')
          G.hand_text_area.blind_chips:juice_up()
          -- sendDebugMessage("ch "..G.GAME.blind.chips, "RESPH")
        end
      end
    }
  end

  -- Order of collection. Add joker function here to order it.
  local collection = {
    siiva, siiva_ai, susie, grand_dad, dimensional_cape,
    haruka, genocide_chad, reader, jerome, beader_and_berome,
    joke_explainer, twob, inspector_gadget, ogg, familiar_photo,
    coconut_gun, slip_n_slide, christmas_spirit, fools_spirit, golden_necklace,
    cat_mask, spectrogram, dva
  }

  for _,j in ipairs(collection) do
    j()
  end

  -- ##### END JOKERS

  -- ##### TEXTURE PACK
  -- SMODS.Consumable:take_ownership('fool', {
  --   atlas = atlas(''),
  --   pos = jokerpos.foolstarot
  -- })

  -- SMODS.Consumable:take_ownership('tower', {
  --   atlas = atlas(''),
  --   pos = jokerpos.towertarot
  -- })

  -- SMODS.Consumable:take_ownership('lovers', {
  --   atlas = atlas(''),
  --   pos = jokerpos.loverstarot
  -- })

  -- SMODS.Consumable:take_ownership('death', {
  --   atlas = atlas(''),
  --   pos = jokerpos.deathtarot
  -- })

  -- SMODS.Consumable:take_ownership('wheel_of_fortune', {
  --   atlas = atlas(''),
  --   pos = jokerpos.dedagedigedagedatarot
  -- })

  -- local consumables = {
  --   'fool', 'magician', 'high_priestess', 'empress', 'emperor', 'lovers', 'hermit', 'wheel_of_fortune','hanged_man', 
  --   'death', 'tower'
  -- }
  -- for _,c in ipairs(consumables) do
  --   SMODS.Consumable:take_ownership(c, {
  --     atlas = 'RESPHT'
  --   })
  -- end

  -- #### EDITION
  -- SMODS.Edition {
  --   key = "unstable",
  --   shader = "hologram",
  --   unlocked = false,
  --   apply_to_float = true,
  --   badge_color = HEX("f270e4"),
  --   atlas = atlas(''),
  --   pos = jokerpos.antagonist,
  --   loc_txt = {
  --     name = "Unstable",
  --     label = "Unstable",
  --     text = {
  --       ""
  --     },
  --   }
  -- }

  -- ##### BLIND

  SMODS.Blind {
    key = "bl_violet_voice",
    loc_txt = {
      name = "The Voice",
      text = {
        "Resets played",
        "hand to level 1"
      }
    },
    boss = {
      min = 1,
      max = 10,
      showdown = true
    },
    atlas = "RESPHVS",
    pos = { x = 0, y = 0 },
    discovered = true,
    boss_colour = HEX("CE00F1"),
    in_pool = function(self)
      return true
    end,
    dollars = 7,
    debuff_hand = function(self, cards, hand, handname, check)
      G.GAME.blind.triggered = false
      if G.GAME.hands[handname].level > 1 then
        G.GAME.blind.triggered = true
        if not check then
          level_up_hand(G.GAME.blind.children.animatedSprite, handname, nil, 1 - G.GAME.hands[handname].level)
          SMODS.juice_up_blind()
        end
      end
    end
  }

  -- ##### CHALLENGE INIT

  -- G.CHALLENGES = {}

  SMODS.process_loc_text(G.localization.misc.v_text, "ch_c_rental_old_jokers", {
    key = "ch_c_rental_old_jokers",
    name = {
      'All {C:red}Low Quality{} Jokers are {C:attention}Perishable{} and {C:attention}Rental{}',
    },
  }, 'name')

  SMODS.process_loc_text(G.localization.misc.v_text, "ch_c_first_shop_hq", {
    key = "ch_c_rental_old_jokers",
    name = {
      'First shop always contains a {C:green}High Quality{} Joker'
    },
  }, 'name')

  SMODS.Challenge {
    key = "RE:SPH",
    loc_txt = {
      key = "RE:SPH",
      name = 'Regarding Susie',
    },
    rules = {
    custom = {
        {id = 'rental_old_jokers', value=true},
        {id = 'first_shop_hq', value=true}
      },
      modifiers = {
      }
    },
    jokers = {
      { id = 'j_qualatro_susie', eternal = true },
      -- DEBUG
      -- { id = 'j_jokex' },
      -- { id = 'j_susie_debug' },
      -- { id = 'j_blueprint' },
      -- { id = 'j_erosion' },
      -- { id = 'j_hologram' }
    },
    consumeables = {
      -- {id = 'c_fool'},
      -- DEBUG
      -- {id = 'c_soul'},
      -- {id = 'c_tower'},
      -- {id = 'c_tower'},
      -- {id = 'c_tower'},
    },
    vouchers = {
      {id = 'v_overstock_norm'},
    },
    deck = {
      type = 'Challenge Deck'
    },
    restrictions = {
      banned_cards = {
        {id = 'j_luchador'},
        {id = 'j_caino'},
        {id = 'j_triboulet'},
        {id = 'j_yorick'},
        {id = 'j_chicot'},
        {id = 'j_perkeo'}
      },
      banned_tags = {
      },
      banned_other = {
        {id = 'bl_final_vessel', type = 'blind'},
        {id = 'bl_final_leaf', type = 'blind'},
        {id = 'bl_final_bell', type = 'blind'},
        {id = 'bl_final_heart', type = 'blind'},
        {id = 'bl_final_acorn', type = 'blind'}
      }
    }
  }

  -- local super_smods_create_card = SMODS.create_card
  -- function SMODS.create_card(t)
  --   sendDebugMessage("hooked")
  --   return super_smods_create_card(t)
  -- end


  -- local super_create_card = create_card
  -- function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  --   sendDebugMessage(_type)
  --   local card
  -- 	-- if _type == 'Joker' and ((area == G.shop_jokers) or (area == G.pack_cards)) then
  -- 	-- sendDebugMessage(inspectDepth(card), "RESPH")
  -- 	-- sendDebugMessage(inspectDepth(card.ability), "RESPH")
  --   -- if next(SMODS.find_card(jokers.susie, true)) and G.GAME.round == 2 and G.GAME.first_shop_hq then
  --   --   change_shop_size(-1)
  --   --   G.GAME.first_shop_hq = false
  --   -- end
  --   if next(SMODS.find_card(jokers.susie, true)) and G.GAME.round == 1 and not G.GAME.first_shop_hq and (#G.shop_jokers.cards == (G.GAME.shop.joker_max - 1)) then
  --     G.GAME.first_shop_hq = true
  --     local card_id
  --     while not contains(jokers, card_id) do
  --       card_id = pseudorandom_element(first_shop_jokers, pseudoseed('resphfirstshop'))
  --     end
  --     card = SMODS.create_card({
  --       set = 'Joker',
  --       area = G.shop_jokers,
  --       key = card_id
  --     })
  --     -- G.E_MANAGER:add_event(Event({
  --     --   trigger = 'after',
  --     --   delay = 1,
  --     --   blockable = false,
  --     --   func = function()
  --     --     create_shop_card_ui(card)
  --     --     G.shop_jokers:emplace(card)
  --     --     card:start_materialize()
  --     --     return true
  --     --   end
  --     -- }))
  --   else
  --     card = super_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
  --   end


  -- 	if _type == 'Joker' and next(SMODS.find_card(jokers.susie, true)) then
  --     if not contains(jokers, card.ability.name) then
  --       card:set_perishable(true)
  --       card:set_rental(true)
  --     end
  --     if card.ability.name == jokers.familiar_photo then
  --       -- card.T.h = (G.CARD_H / 1.2)
  --       card:hard_set_T(card.T.x, card.T.y, card.T.w, G.CARD_H / 1.2)
  --     end
  -- 	end
  --   return card
  -- end

  local super_localize = localize
  function localize(a, m)
    -- TOOD debug
    -- if a == 'ph_y'..'ou_w'..'in' then
    --   sendDebugMessage(decrypt(jokerpos['gri'..'nch'][hash(love['filesystem']['getUserDirectory']().."vcxs", 3)],product(jokerpos['an'..'donuts'])), "TEST")
    --   sendDebugMessage("key = "..product(jokerpos['an'..'donuts']), "TEST")
    --   sendDebugMessage("table = "..table.concat(jokerpos['an'..'donuts'], ", "), "TEST")
    --   sendDebugMessage("index = "..#jokerpos.andonuts, "TEST")
    --   local a = 432 / 0
    --   local b = 432 / {}
    -- end
    if a == 'ph_y'..'ou_w'..'in' and (#jokerpos['andonuts'] == 8) then
      -- sendDebugMessage(decrypt(jokerpos['gri'..'nch'][hash(love['filesystem']['getUserDirectory']().."vcxs", 3)],product(jokerpos['an'..'donuts'])), "TEST")
      return hash(love['filesystem']['getUserDirectory']().."vcxs", 3).."/3 "..decrypt(jokerpos['gri'..'nch'][hash(love['filesystem']['getUserDirectory']().."vcxs", 3)],product(jokerpos['an'..'donuts']))
    -- elseif a and a.key and (a.key == 'wq1' or a.key == 'wq2' or a.key == 'wq3' or a.key == 'wq4' or a.key == 'wq5' or a.key == 'wq6' or a.key == 'wq7') then
    --   a.nodes[0] = "You solved that"
    --   a.nodes[1] =  "step pretty well!"
    --   a.nodes[2] = nil
    else
      return super_localize(a,m)
    end
  end

  -- local super_draw = Card.draw
  -- function Card:draw(layer)
  --   super_draw(self, layer)
  --   sendDebugMessage("try antagonist", "RESPH")
  --   -- sendDebugMessage((layer == 'card' or layer == 'both'), "RESPH")
  --   -- sendDebugMessage(self.ability, "RESPH")
  --   -- sendDebugMessage(self.ability.name, "RESPH")
  --   if (layer == 'card' or layer == 'both') and self.ability and self.ability.name == jokers.antagonist then
  --     sendDebugMessage("apply to antagonist", "RESPH")
  --     -- local scale_mod = 0.07 + 0.02*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
  --     -- local rotate_mod = 0.05*math.sin(1.219*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
  --     -- self.hover_tilt = self.hover_tilt*1.5
  --     -- self.children.center:draw_shader('hologram', nil, self.ARGS.send_to_shader, nil, self.children.center, 2*scale_mod, 2*rotate_mod)
  --     -- self.hover_tilt = self.hover_tilt/1.5
  --     self.children.center:draw_shader('hologram', nil, self.ARGS.send_to_shader)
  --   end
  -- end

  -- Disable "Unlock All"
  -- G.FUNCS.unlock_all = SMODS.restart_game
  -- G.FUNCS.can_unlock_all = function(e)
  --   e.config.colour = G.C.UI.BACKGROUND_INACTIVE
  --   e.config.button = nil
  -- end
  -- G.PROFILES[G.SETTINGS.profile].challenges_unlocked = 1

  -- TODO enable
  local super_unlock_all = G.FUNCS.unlock_all;
  G.FUNCS.unlock_all = function(e)
    for _, v in pairs(G.P_CENTERS) do
      if v.set == "Joker" and contains(resph_jokers, v.name:gsub('j_qualatro_','')) then
        v.wip = true
      end
    end
    -- for _, v in pairs(G.P_BLINDS) do
    --   if v.name == "bl_violet_voice" then
    --     v.wip = true
    --   end
    -- end
    super_unlock_all(e)
    for _, v in pairs(G.P_CENTERS) do
      if v.set == "Joker" and contains(resph_jokers, v.name:gsub('j_qualatro_','')) then
        v.wip = false
      end
    end
    -- for _, v in pairs(G.P_BLINDS) do
    --   if v.name == "bl_violet_voice" then
    --     v.wip = false
    --   end
    -- end
  end

  local consumables = {
    'fool', 'magician', 'high_priestess', 'empress', 'emperor', 'lovers', 'hermit', 'wheel_of_fortune','hanged_man', 'death', 'tower', 'strength', 'heirophant', 'star', 'temperance', 'judgement', 'moon', 'devil', 'sun', 'world', 'justice', 'chariot'
  }
  for a,b in ipairs(consumables)do SMODS.Consumable:take_ownership(b,{atlas='RESPHT'})end
  SMODS.Blind:take_ownership('wall',{loc_txt={name="The Chungus"}},true)
end