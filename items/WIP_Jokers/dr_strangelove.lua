SMODS.Joker {
    key = "dr_strangelove",
    order = 49,
    config = {
        extra = {
        }
    },
    rarity = 1,
    atlas = "kino_atlas_2",
    pos = { x = 0, y = 2},
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,
    calculate = function(self, card, context)
        -- Each round, choose a random hand type.
        -- If you play this hand type: BLOW IT UP (x5 and destroy all cards played and in hand.)

    end
}