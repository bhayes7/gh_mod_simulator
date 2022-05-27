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
  
  # returns vector of cards that are still in the reserve
  get_available_cards = function() {
    return(unlist(private$cards))
  },
  
  # returns vector of cards that have been dealt out already
  get_unavailable_cards = function() {
    return(unlist(private$dealt))
  },

  # retrieve an available modifier card and distribute it to the requesting
  # modifier deck
  deal = function() {
    if(length(self$get_available_cards()) == 0) {
      # TODO throw an error or something here idk
    }
    else {
      card <- private$cards[[1]]
      private$cards[[1]] <- NULL
      private$dealt <- c(private$dealt, card)
      return(card)
    }
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
  # this represents available modifier cards
  cards = NULL,
  
  # this allows the reserve to track which cards have been dealt out to
  # a modifier deck already
  dealt = NULL,
  
  dummy = function() {
    return(NULL)
  }
))
