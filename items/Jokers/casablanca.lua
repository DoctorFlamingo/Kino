SMODS.Joker {
    key = "casablanca",
    order = 2,
    config = {
        extra = {
            mult = 2,
            chips = 10
        }
    },
    rarity = 1,
    atlas = "kino_atlas_1",
    pos = { x = 1, y = 0 },
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                    card = context.other_card
                }
            end
        end
    end
}