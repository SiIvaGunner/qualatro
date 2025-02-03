-- Create joker in Qualatro.lua with key "watch"
-- press ctrl + '/' and run `watch center Mods/qualatro/watch_joker.lua`
return {
    key = "j_qualatro_watch",
    atlas = 'QualatroJokers',
    loc_txt = {
        name = "Watched Joker",
        text = {"Watched"}
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 999,
    calculate = function(_, card, context)
        -- if context.individual then
        --     -- debugplus.logger(context)
        --     sendDebugMessage(inspectDepth(context), "RESPH")

        -- end
        if context.joker_main then
            -- sendDebugMessage(tostring(G.hand.cards[1]:calculate_enhancement(context)), "RESPH")
            SMODS.trigger_effects(effects, card)
        end
    end
}
