library(R6)
library(dplyr)
library(tidyr)
library(purrr)



# ModifierReserve: tracks one class of temporary modifier (blessings, curses, or
#   penalties) as they move into and out of modifier decks
ModifierReserve <- R6Class("ModifierReserve", list(
  
  initialize = function(cards) {
    private$cards <- as.list(cards)
    private$dealt <- list()
  },

  # retrieve an available modifier card and distribute it to the requesting
  # modifier deck
  deal = function() {
    # TODO implement
    # return(card)
    invisible(self)
  },

  # accept an expended modifier card
  undeal = function(card) {
    # TODO implement
    invisible(self)
  },

  print = function(...) {
    cat("ModifierReserve: tracking the following cards:\n  ")
    all_cards <- sort(c(unlist(private$cards), unlist(private$dealt)))
    cat(all_cards, sep = "\n  ")
    invisible(self)
  }
), private = list(
  # these will maintain the lists of available temporary modifiers
  cards = NULL,
  
  # this allows the reserve to track which cards have been dealt out to
  # a modifier deck already
  dealt = NULL,
  
  dummy = function() {
    return(NULL)
  }
))
