------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bongcloud
------------------------------------------------------------------------------------------------------------------------------------------------------
-- sticker.lua 
-- Defenitions of custom stickers
-- 
-- Hamester, 2025
------------------------------------------------------------------------------------------------------------------------------------------------------

-- Registering Atlas for Chess consumable type cards
SMODS.Atlas {
    key = "Stickers",
    path = "Stickers.png",
    px = 71,
    py = 95
}

-- Registering
SMODS.Sticker {
    key = "top_deck",
    atlas = "Stickers",
    pos = { x = 0, y = 0 },
    badge_colour = HEX("5555FF"),
    default_compat = true,
    sets = { Default = true },
    rate = 0,
    needs_enable_flag = false
}

-- Hooking into the deck shuffling function to always put the top decking cards on the top of the deck
LuaHooks.Inject_Tail {
	namespace = CardArea,
	original_func_name = "shuffle",
	injected_code = function(ret, self)
        if self ~= G.deck then
            return
        end

        local top_deck_cards = {}
        for i=1,#G.deck.cards do
            if G.deck.cards[i].ability["bongcloud_top_deck"] then
                table.insert(top_deck_cards, G.deck.cards[i])
            end
        end

        -- L9WEG1R1 to test
        for i=1,#top_deck_cards do
            for j=1,#G.deck.cards do
                if G.deck.cards[j] == top_deck_cards[i] then
                    G.deck.cards[j] = G.deck.cards[#G.deck.cards - i + 1]
                    G.deck.cards[#G.deck.cards - i + 1] = top_deck_cards[i]
                    break
                end
            end
        end
	end
}

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- sticker.lua End
------------------------------------------------------------------------------------------------------------------------------------------------------