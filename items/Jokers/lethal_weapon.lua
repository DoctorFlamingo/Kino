SMODS.Joker {
    key = "lethal_weapon",
    order = 5,
    config = {
        extra = {
            mult = 0,
            mult_mod = 1
        }
    },
    rarity = 1,
    atlas = "kino_atlas_1",
    pos = { x = 4, y = 0 },
    cost = 4,
    blueprint_compat = true,
    perishable_compat = false,
    kgenre = "Action",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = self.kgenre}
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)

        if context.before and next(context.poker_hands["Pair"]) and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                focus = card,
                message = localize({type='variable', key='a_mult', vars = {card.ability.extra.mult}}),
                colour = G.C.MULT,
                card = self
            }

        end

        if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss and not context.blueprint_card and not context.retrigger_joker then
            card.ability.extra.mult_mod = card.ability.extra.mult_mod * 2
            return {
                focus = card,
                message = localize({type='variable', key='k_upgrade_ex', vars = {card.ability.extra.mult_mod}}),
                colour = G.C.MULT,
                card = self
            }
        end

        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }},
            }
        end
    end
}