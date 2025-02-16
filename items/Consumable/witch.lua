SMODS.Consumable {
    key = "witch",
    set = "Tarot",
    order = 4,
    pos = {x = 5, y = 0},
    atlas = "kino_tarot",
    config = {
        mod_conv = 'm_kino_fantasy', 
        max_highlighted = 2,
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_kino_demonic
        return {
            vars = {
                self.config.max_highlighted
            }
        }
    end

}