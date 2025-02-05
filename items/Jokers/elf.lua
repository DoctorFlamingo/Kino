SMODS.Joker {
    key = "elf",
    order = 3,
    config = {
        extra = {
            repetitions = 1
        }
    },
    rarity = 1,
    atlas = "kino_atlas_1",
    pos = { x = 2, y = 0 },
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 then
                return {
                    message = 'Again!',
                    repetitions = card.ability.extra.repetitions,
                    card = context.other_card
                }
            end
        end
    end
}