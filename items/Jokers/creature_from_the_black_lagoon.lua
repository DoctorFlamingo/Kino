SMODS.Joker {
    key = "creature_from_the_black_lagoon",
    order = 13,
    config = {
        extra = {
            perma_mult = 1
        }
    },
    rarity = 1,
    atlas = "kino_atlas_1",
    pos = { x = 0, y = 2 },
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.perma_mult
            }
        }
    end,
    calculate = function(self, card, context)
        -- If your played hand is only a Queen, destroy it and upgrade every card in your deck with +1 mult.

        -- Checks if only 1 card is played, and if it's a Queen.
        if context.destroying_card and not context.blueprint then 
            if #context.full_hand == 1 and context.full_hand[1]:get_id() == 12 then
                -- Iterate through every owned card.
                for i, v in ipairs(G.deck.cards) do
                    v.ability.perma_mult = v.ability.perma_mult or 0
                    v.ability.perma_mult = v.ability.perma_mult + card.ability.extra.perma_mult
                end
                return true
            end
        end

        -- if context.individual and context.cardarea == G.play then
        --     context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
        --     context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.perma_mult
        --     return {
        --         extra = {message = localize('k_upgrade_ex'), colour = G.C.CHIPS},
        --         colour = G.C.CHIPS,
        --         card = self
        --     }
        -- end
    end
}
