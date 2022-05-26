library(R6)
library(dplyr)
library(tidyr)
library(purrr)

# TODO better class documentation
# the "deck" value that initializes a ModifierDeck object should
# be a vector of filenames for the cards that are in the deck
# I've decided it's for the best if this class only keeps track of modifier cards
# as filenames, interpretation will occur elsewhere
# that way, whatever battle algorithms I come up with won't be dependent on
# the specifics of the filestructure
ModifierDeck <- R6Class("ModifierDeck", list(
  # TODO should these be private fields???
  deck = NULL,
  discard = NULL,
  
  initialize = function(deck, discard = NULL) {
    stopifnot(is.character(deck), length(deck) >= 2) # I take it as a rule that ANY modifier deck must contain natural crit and miss
                                                     # while I don't check for those cards specifically, that means that decksize >= 2

    self$deck <- as.list(deck)
    self$discard <- list() # discard initializes as an empty list
    
    # give the deck a starting shuffle so that the first draw will be randomized
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
  
  # TODO implement function
  add_to_deck = function(card) {
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
), private = list(
  
  # putting this here to appease my OCD
  dummy = function() {
    return(NULL)
  }
))