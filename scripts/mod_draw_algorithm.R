# the algorithm for drawing a modifier card is:
# 
# STEP 1: determining the modifier for an attack
# if modifier deck is empty:
#   immediately shuffle
# if the attack has neither advantage nor disadvantage:
#   draw the top card of the modifier deck
#   do:
#     total modifier += drawn card modifier
#     effects list += drawn card effect
#     drawn card goes to discard pile
#   while drawn card is rolling
#   if crit in effects list:
#     return total modifier * 2, effects list minus crit
#   if miss in effects list:
#     return 0, effects list minus miss
#   else:
#     return total modifier, effects list
#
# if the attack has advantage:
#   perform the above algorithm twice, yielding mod1 and mod2
#   if total modifier of mod1 >= total modifier of mod 2 && length of effects list of mod1 >= length of effects list of mod2:
#     return mod1
#   if total modifier of mod1 =< total modifier of mod 2 && length of effects list of mod1 =< length of effects list of mod2:
#     return mod2
#   else:
#     flip a coin to determine whether to return mod1 or mod2
#
# if the attack has disadvantage:
#   perform the above algorithm twice, yielding mod1 and mod2
#   if total modifier of mod1 <= total modifier of mod 2 && length of effects list of mod1 <= length of effects list of mod2:
#     return mod1
#   if total modifier of mod1 >= total modifier of mod 2 && length of effects list of mod1 >= length of effects list of mod2:
#     return mod2
#   else:
#     flip a coin to determine whether to return mod1 or mod2
#
# note: may later decide to allow player to determine result of advantage/disadvantage, since it is not necessarily
# the case that the modifier with the higher damage value and longer list of effect would be the preferable one.
# This could be circumvented somewhat by ranking all possible effects, i.e. immobilize < disarm < stun,
# but even this becomes impossible because the value of, say, infusefire vs. infuseice is entirely contextual.
#
# STEP 2: handling the discard pile
#   for each card in the discard pile:
#     if the card is disposable, remove it
#   if any card in the discard pile is shuffle:
#     unlock shuffle option
#   when shuffle option is selected:
#     add all cards remaining in discard pile to the deck
#     randomly re-determine the deck's order

library(R6)
library(dplyr)
library(tidyr)

cards <- read.csv("mod_data/pl_all_mod_cards.csv",
                  row.names = 1,
                  colClasses = c("character", "character", "numeric",
                                 "character", "logical", "logical",
                                 "logical", "numeric", "character",
                                 "character", "character"))

# the "deck" value that initializes a ModifierDeck object should
# be a vector of filenames for the cards that are in the deck
ModifierDeck <- R6Class("ModifierDeck", list(
  deck = NULL,
  discard = NULL,
  
  initialize = function(deck, discard = NULL) {
    stopifnot(is.character(deck), length(deck) >= 2) # I take it as a rule that ANY modifier deck must contain natural crit and miss
                                                     # while I don't check for those cards specifically, that means that decksize >= 2
    self$deck <- as.list(deck)
    self$discard <- list() # discard initializes as an empty list
    
    self$shuffle()
  },
  
  # TODO add the entire rest of the drawcard algorithm to this shit
  draw = function() {
    drawn_card <- self$deck[[1]]
    self$deck[[1]] <- NULL
    self$discard <- c(self$discard, drawn_card)
    return(drawn_card)
  },
  
  shuffle = function() {
    # if discard is empty, all cards are in deck, so we get to skip this step
    if(length(self$discard) > 0){
      self$deck <- c(self$deck, self$discard) # add discards back into deck
      self$discard <- list()                  # discard made back into empty list
    }
    self$deck <- self$deck[sample(1:length(self$deck))] # here is the actual shuffle
    invisible(self)
  },
  
  print = function(...) {
    cat("ModifierDeck: \n")
    if(length(self$deck) == 0){cat("  Cards in deck: deck is empty", "\n", sep = "")}
    else{cat("  Cards in deck:", unlist(self$deck), sep = "\n    ")}
    
    if(length(self$discard) == 0){cat("  Cards in discard: discard is empty", "\n", sep = "")}
    else{cat("  Cards in discard:", unlist(self$discard), sep = "\n    ")}
    invisible(self)
  }
))

################
# TESTING ZONE #
################

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
