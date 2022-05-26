# --------------------
# Tests for CardReader
# --------------------

# import all maingame card data
cards <- read.csv("mod_data/pl_all_mod_cards.csv",
                  row.names = 1,
                  colClasses = c("character", "character", "numeric",
                                 "character", "logical", "logical",
                                 "logical", "numeric", "character",
                                 "character", "character"))

default_deck_cards <- c("gh-am-p1-01.png", "gh-am-p1-02.png", "gh-am-p1-03.png", "gh-am-p1-04.png",
                        "gh-am-p1-05.png", "gh-am-p1-06.png", "gh-am-p1-07.png", "gh-am-p1-08.png",
                        "gh-am-p1-09.png", "gh-am-p1-10.png", "gh-am-p1-11.png", "gh-am-p1-12.png",
                        "gh-am-p1-13.png", "gh-am-p1-14.png", "gh-am-p1-15.png", "gh-am-p1-16.png",
                        "gh-am-p1-17.png", "gh-am-p1-18.png", "gh-am-p1-19.png", "gh-am-p1-20.png")

source("classes/CardReader.R")

OmniReader <- CardReader$new(cards)

# CLASS PRINT METHOD
print(OmniReader)

# CARD PRINT METHODS

# Random single card:
OmniReader$print_cards(default_deck_cards[sample(1:length(default_deck_cards), 1)])
# Random set of 5 cards:
OmniReader$print_cards(default_deck_cards[sample(1:length(default_deck_cards), 5)])

# GETTER METHODS
# TODO make this less crap (I need to completely overhaul tests anyways...)
card1 <- default_deck_cards[1]

OmniReader$get_filepath(card1) == "./modifier_cards/base/player/gh-am-p1-01.png"
OmniReader$get_mod(card1) == 0
is.na(OmniReader$get_effect(card1)) 
OmniReader$get_rolling(card1) == FALSE
OmniReader$get_shuffle(card1) == FALSE
OmniReader$get_disposable(card1) == FALSE
OmniReader$get_merc_num(card1) == 0
OmniReader$get_merc_short(card1) == "P1"
OmniReader$get_merc_long(card1) == "Player 1"
OmniReader$get_merc_spoiler(card1) == "Player 1"
OmniReader$get_fields(card1) # TODO test this too
