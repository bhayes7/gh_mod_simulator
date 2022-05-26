# ----------------------
# Tests for ModifierDeck
# ----------------------

source("classes/ModifierDeck.R")

# filenames for all of the cards in the standard modifier deck
# for testing purposes only
default_deck_cards <- c("gh-am-p1-01.png", "gh-am-p1-02.png", "gh-am-p1-03.png", "gh-am-p1-04.png",
                        "gh-am-p1-05.png", "gh-am-p1-06.png", "gh-am-p1-07.png", "gh-am-p1-08.png",
                        "gh-am-p1-09.png", "gh-am-p1-10.png", "gh-am-p1-11.png", "gh-am-p1-12.png",
                        "gh-am-p1-13.png", "gh-am-p1-14.png", "gh-am-p1-15.png", "gh-am-p1-16.png",
                        "gh-am-p1-17.png", "gh-am-p1-18.png", "gh-am-p1-19.png", "gh-am-p1-20.png")

demo_deck <- ModifierDeck$new(default_deck_cards)

print(demo_deck)
demo_deck$draw()
print(demo_deck)
demo_deck$shuffle()
print(demo_deck)

# this will, as expected, throw an error:
# failure_demo_deck_1 <- ModifierDeck$new(c("gh-am-p1-01.png"))

# this will also fail:
# failure_demo_deck_2 <- ModifierDeck$new(1:20)