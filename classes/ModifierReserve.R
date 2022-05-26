library(R6)
library(dplyr)
library(tidyr)
library(purrr)

# ModifierReserve: tracks the temporary modifiers (blessings, curses, and
#   penalties) as they move into and out of modifier decks
ModifierReserve <- R6Class("ModifierReserve", public = list(
  
  initialize = function() {
    private$blessings <- c("gh-am-pm-11.png", "gh-am-pm-12.png",
                           "gh-am-pm-13.png", "gh-am-pm-14.png",
                           "gh-am-pm-15.png", "gh-am-pm-16.png",
                           "gh-am-pm-17.png", "gh-am-pm-18.png",
                           "gh-am-pm-19.png", "gh-am-pm-20.png")
    
    private$curses <- c("gh-am-pm-01.png", "gh-am-pm-02.png", "gh-am-pm-03.png",
                        "gh-am-pm-04.png", "gh-am-pm-05.png", "gh-am-pm-06.png",
                        "gh-am-pm-07.png", "gh-am-pm-08.png", "gh-am-pm-09.png",
                        "gh-am-pm-10.png")
    
    private$penalties <- c("gh-am-pm-21.png", "gh-am-pm-22.png",
                           "gh-am-pm-23.png", "gh-am-pm-24.png",
                           "gh-am-pm-25.png", "gh-am-pm-26.png",
                           "gh-am-pm-27.png", "gh-am-pm-28.png",
                           "gh-am-pm-29.png", "gh-am-pm-30.png",
                           "gh-am-pm-31.png", "gh-am-pm-32.png",
                           "gh-am-pm-33.png", "gh-am-pm-34.png",
                           "gh-am-pm-35.png")
    
    private$dealt <- list()
    
  },
  
  # retrieve an available modifier card of the specified type and distribute
  # it to the requesting modifier deck
  deal = function(mod_type) {
    # TODO implement
    return(card)
  },
  
  # accept an expended modifier card 
  return = function(card) {
    # TODO implement
    invisible(self)
  }
  
  print = function(...) {
    invisible(self)
  }
), private = list(
  # these will maintain the lists of available temporary modifiers
  blessings <- NULL,
  curses <- NULL,
  penalties <- NULL,
  # this allows the reserve to track which cards have been dealt out to
  # a modifier deck already
  dealt <- NULL,
  
  dummy = function() {
    
  }
))
