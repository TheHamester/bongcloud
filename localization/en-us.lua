return {
	descriptions = {
		Other = {
			bongcloud_top_deck = {
				name = "Top Deck",
				text = {
					"Always appears at",
					"the top of the deck"
				}
			},
			p_bongcloud_chess_pack_1 = {
				name="Chess Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Chess{} cards",
                }
			},
			p_bongcloud_chess_pack_2 = {
				name="Chess Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Chess{} cards",
                }
			},
			undiscovered_chess = {
				name = 'Not Discovered',
				text = { 'Find it in the {C:attention}Chess Pack{}' },
			},
		},
		Chess = {
			c_bongcloud_the_pawn = {
				name = "The Pawn",
				text = {
					"Select up to #1# cards",
					"to become {C:attention}Queens{}"
				}
			},
			c_bongcloud_the_knight = {
				name = "The Knight",
				text = {
					"Add a {C:blue}Top Deck{}",
					"sticker on up",
					"to {C:attention}#1#{} cards",
					"{C:attention}+#2#{} Ante"
				}
			},
			c_bongcloud_the_bishop = {
				name = "The Bishop",
				text = {
					"Convert up to {C:attention}#1#{} selected cards",
					"with rank into a {C:attention}#1#{}-card straight",
					"starting from the {C:attention}leftmost{} card"
				}
			},
			c_bongcloud_the_rook = {
				name = "The Rook",
				text = {
					"{C:red}Destroy{} every card",
					"sharing the {C:attention}rank{} of",
					"the selected card"
				}
			},
			c_bongcloud_the_queen = {
				name = "The Queen",
				text = {
					"{C:red}Destroy{} up to {C:attention}#1#{}",
					"selected cards",
					"Upgrade every hand",
					"contained within",
					"by {C:attention}#2#{} levels"
				}
			},
			c_bongcloud_the_king = {
				name = "The King",
				text = {
					"{C:red}Destroy{} the",
					"selected",
					"{C:red}Rare{} Joker",
					"{C:attention}+#1#{} Joker Slot"
				}
			}
		}
	},
	misc = {
		labels = {
			bongcloud_top_deck = {
				"Top Deck"
			}
		},
		dictionary = {
			k_bongcloud_chess_pack="Chess Pack"
		}
	}
}
