------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bongcloud
------------------------------------------------------------------------------------------------------------------------------------------------------
-- chess.lua 
-- Definitions of Chess consumable cards
-- 
-- Hamester, 2025
------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Registering Chess Booster Packs
------------------------------------------------------------------------------------------------------------------------------------------------------

-- Registering Atlas for Chess consumable type cards
SMODS.Atlas {
    key = "ChessBoosters",
    path = "ChessBoosters.png",
    px = 71,
    py = 95
}

for i=1,2 do
    SMODS.Booster{
        key = "chess_pack_"..i,
        atlas = "ChessBoosters",
        pos = { x = i - 1, y = 0 },
        kind = "Chess",
        cost = 6,
        weight = 0.2,
        draw_hand = false,
        config = { extra = 2, choose = 1 },
        group_key = "k_bongcloud_chess_pack",
        select_card = "consumeables",
        create_card = function(self, card)
            return create_card("Chess", G.pack_cards, nil, nil, true, true, nil, nil)
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("CCCCCC"))
            ease_background_colour({ new_colour = HEX("888888"), special_colour = HEX("333333"), contrast = 2 })
        end,
    }
end

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Registering Chess consumable type cards
------------------------------------------------------------------------------------------------------------------------------------------------------

-- Registering Chess consumable type
SMODS.ConsumableType {
    key = "Chess",
    primary_colour = HEX("AAAAAA"),
    secondary_colour = HEX("111111"),
    collection_rows = { 6 },
    loc_txt = {
        name = "Chess",
        collection = "Chess"
    },
    default = "c_bongcloud_the_pawn"
}

-- Registering Atlas for Chess consumable type cards
SMODS.Atlas {
    key = "Chess",
    path = "Chess.png",
    px = 71,
    py = 95
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Pawn
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_pawn",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = false,
    loc_vars = function(_, info_queue, card)
        return { vars = { card.ability.extra.select_limit } }
    end,


    cost = 1,
    config = { extra = { select_limit = 3 } },
    use = function(_, _, _, _)
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3,0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local queen = string.sub(G.hand.highlighted[i].base.suit, 1, 1)..'_Q'
                    G.hand.highlighted[i]:set_base(G.P_CARDS[queen])
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.select_limit
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Knight
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_knight",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 1, y = 0 },
    unlocked = true,
    discovered = false,
    loc_vars = function(_, info_queue, card)
        info_queue[#info_queue + 1] = { key = "bongcloud_top_deck", set = "Other", vars = {} }
        return { vars = { card.ability.extra.select_limit, card.ability.extra.ante_up } }
    end,

    cost = 3,
    config = { extra = { ante_up = 1, select_limit = 5 } },
    use = function(_, card, _, _)
        ease_ante(card.ability.extra.ante_up)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + card.ability.extra.ante_up

        for i=1,#G.hand.highlighted do
            G.hand.highlighted[i]:juice_up(0.3, 0.3)
            G.hand.highlighted[i]:add_sticker("bongcloud_top_deck")
        end
    end,
    can_use = function(_, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.select_limit
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Bishop
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_bishop",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 2, y = 0 },
    unlocked = true,
    discovered = false,
    loc_vars = function(_, _, card) return { vars = { card.ability.extra.select_limit } } end,

    cost = 3,
    config = { extra = { select_limit = 3 } },
    use = function(_, _, _, _)
        table.sort(G.hand.highlighted, function (left, right) return left.T.x < right.T.x end)

        for i = 2, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3,0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 2, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    G.hand.highlighted[i]:set_base(G.hand.highlighted[1].base)
                    assert(SMODS.modify_rank(G.hand.highlighted[i], i - 1))
                    return true
                end
            }))
        end
        for i = 2, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(_, card)
        local all_have_rank = true
        for i=1,#G.hand.highlighted do
            if SMODS.has_no_rank(G.hand.highlighted[i]) then
                all_have_rank = false
                break
            end
        end

        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.select_limit and all_have_rank
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Rook
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_rook",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 3, y = 0 },
    unlocked = true,
    discovered = false,

    cost = 5,
    use = function(_, _, _, _)
        local id = G.hand.highlighted[1].base.id 
        for i = 1,#G.hand.cards do
            if G.hand.cards[i].base.id == id then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:start_dissolve(nil, false)
                        return true
                    end
                }))
            end
        end

        for i = 1, #G.deck.cards do
            if G.deck.cards[i].base.id == id then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.deck.cards[i]:start_dissolve(nil, false)
                        return true
                    end
                }))
            end
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(_, _)
        return #G.hand.highlighted == 1 and not SMODS.has_no_rank(G.hand.highlighted[1])
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Queen
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_queen",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 4, y = 0 },
    unlocked = true,
    discovered = false,
    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.select_limit, card.ability.extra.levels } }
    end,

    cost = 9,
    config = { extra = { select_limit = 5, levels = 2 } },
    use = function(_, card, _, _)
        local poker_hands = evaluate_poker_hand(G.hand.highlighted)
        for k,v in pairs(poker_hands) do
            if k ~= "top" and v[1] then
                update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 }, {
                    handname = localize(k, "poker_hands"),
                    chips = G.GAME.hands[k].chips,
                    mult = G.GAME.hands[k].mult,
                    level = G.GAME.hands[k].level,
                })
                level_up_hand(card, k, false, card.ability.extra.levels)
                delay(0.1)
            end
        end
        update_hand_text(
            { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = "", level = "" }
        )

        local highlighted = {}
        for i=1,#G.hand.highlighted do
            highlighted[i] = G.hand.highlighted[i]
        end
       
        for i = 1,#highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    highlighted[i]:start_dissolve(nil, false)
                    return true
                end
            }))
        end

        delay(0.5)
    end,
    can_use = function(_, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.select_limit
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- The King
------------------------------------------------------------------------------------------------------------------------------------------------------

SMODS.Consumable {
    key = "the_king",
    set = "Chess",
    atlas = "Chess",
    pos = { x = 5, y = 0 },
    unlocked = true,
    discovered = false,
    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.extra_joker_slots } }
    end,

    cost = 9,
    config = { extra = { extra_joker_slots = 1 } },
    use = function(self, card, area, copier)
        G.jokers.highlighted[1]:start_dissolve(nil, false)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.extra_joker_slots
    end,
    can_use = function(self, card)
        return #G.jokers.highlighted == 1 and G.jokers.highlighted[1].config.center.rarity == 3
    end
}

------------------------------------------------------------------------------------------------------------------------------------------------------
-- chess.lua End
------------------------------------------------------------------------------------------------------------------------------------------------------