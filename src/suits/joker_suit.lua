SMODS.Suit {
    key = "suit_" .. SMODS.current_mod.id .. "_jokers",
    card_key =  "J",
    pos = {x = 0, y = 0},
    ui_pos = {x = 0, y = 0},
    hc_atlas = SMODS.current_mod.id .. "joker_suit",
    lc_atlas = SMODS.current_mod.id .. "joker_suit",
    hc_ui_atlas = SMODS.current_mod.id .. "ui",
    lc_ui_atlas = SMODS.current_mod.id .. "ui",
    hc_colour = "FE5F55",
    lc_colour = "FE5F55",
    loc_txt = {
        name = "Joker",
        text = {
            ""
        },
        plural = "Jokers",
        singular = "Joker"
    },
    disabled = false,
    populate = function(self)
        for _, other in pairs(SMODS.Ranks) do
            if not other.disabled and other.shorthand == 'Jkr' then
                self:inject_p_card(other)
            end
        end
        self.disabled = nil
    end,
    inject = function(self)
    end
}

local inject_p_card_ref = SMODS.inject_p_card
function SMODS.inject_p_card(suit, rank)
    if suit.key == "suit_mjst_mod_joker_deck_jokers" then
        if rank.shorthand == "Jkr" then
            G.P_CARDS[suit.card_key .. '_' .. rank.card_key] = {
                name = rank.key .. ' of ' .. suit.key,
                value = rank.key,
                suit = suit.key,
                pos = { x = rank.pos.x, y = rank.pos.y },
                lc_atlas = rank.suit_map[suit.key] and rank.lc_atlas or suit.lc_atlas,
                hc_atlas = rank.suit_map[suit.key] and rank.hc_atlas or suit.hc_atlas,
            }
        else
        end
    else
        if rank.shorthand == "Jkr" then
        else
            inject_p_card_ref(suit, rank)
        end
    end
end