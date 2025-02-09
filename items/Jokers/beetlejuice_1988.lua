SMODS.Joker {
    key = "beetlejuice_1988",
    order = 47,
    config = {
        extra = {
            x_mult = 2
        }
    },
    rarity = 1,
    atlas = "kino_atlas_2",
    pos = { x = 3, y = 2},
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        -- After you've played a hand a multiple of 3 times,
        -- 2x.
        if context.joker_main then
            if G.GAME.hands[context.scoring_name].played % 3 == 0 then
                return {
                    message = localize{type='variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}},
                    Xmult_mod = card.ability.extra.x_mult,
                }
            end
        end
    end
}