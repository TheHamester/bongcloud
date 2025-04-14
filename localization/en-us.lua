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
					"to use immediately",
                }
			},
			p_bongcloud_chess_pack_2 = {
				name="Chess Pack",
                text={
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:joker} Chess{} cards",
					"to use immediately",
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
					"Select up to {C:attention}#1#{} cards to {C:attention}always{}",
					"to apply {C:blue}Top Deck{} sticker to",
					"Up the ante by {C:attention}#2#{}",
				}
			},
			c_bongcloud_the_bishop = {
				name = "The Bishop",
				text = {
					"Select up to {C:attention}#1#{} cards",
					"Turns selected cards to the right",
					"of the {C:attention}left-most{} selected card into",
					"its direct {C:attention}successors{} by rank"
				}
			},
			c_bongcloud_the_rook = {
				name = "The Rook",
				text = {
					"Destroys every instance of a card",
					"in the deck with the same {C:attention}rank{}",
					"as the selected card"
				}
			},
			c_bongcloud_the_queen = {
				name = "The Queen",
				text = {
					"Select up to {C:attention}#1#{} cards",
					"Destroy them, and upgrade every hand",
					"contained within by {C:attention}#2#{} levels"
				}
			},
			c_bongcloud_the_king = {
				name = "The King",
				text = {
					"Select a {C:red}Rare{} joker to destroy",
					"Increase joker slots by {C:attention}#1#{}"
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