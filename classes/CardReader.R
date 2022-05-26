library(R6)
library(dplyr)
library(tidyr)
library(purrr)

# TODO better class documentation
# this class interprets the filenames of cards and extracts relevant information
# from a provided card directory
CardReader <- R6Class("CardReader", list(
  
  initialize = function(data) {
    # TODO implement data sanitation checks (make sure it's a dataframe,
    # that is has the correct columns, etc.)
    
    private$data <- data
  },
  
  # is this overkill??? Probably. But it'll make my life easier down the line
  
  get_filepath = function(card) {
    return(private$get_field(card, "filepath"))
  },
  
  get_mod = function(card) {
    return(private$get_field(card, "mod"))
  },
  
  get_effect = function(card) {
    return(private$get_field(card, "effect"))
  },
  
  get_rolling = function(card) {
    return(private$get_field(card, "rolling"))
  },
  
  get_shuffle = function(card) {
    return(private$get_field(card, "shuffle"))
  },
  
  get_disposable = function(card) {
    return(private$get_field(card, "disposable"))
  },
  
  get_merc_num = function(card) {
    return(private$get_field(card, "merc_num"))
  },
  
  get_merc_short = function(card) {
    return(private$get_field(card, "merc_short"))
  },
  
  get_merc_long = function(card) {
    return(private$get_field(card, "merc_long"))
  },
  
  get_merc_spoiler = function(card) {
    return(private$get_field(card, "merc_spoiler"))
  },
  
  # return all card fields as a list
  get_fields = function(card) {
    return(as.list(private$data[card,]))
  },
  
  # neatly print all info for given card(s)
  # accepts either a single filename or a vector of filenames
  print_cards = function(cards) {
    map(cards, private$print_card)
    invisible(self)
  },
  
  print = function(...) {
    cat("CardReader: \n")
    cat("  This reader contains data for ", private$num_cards(), " cards.\n", sep = "")
    invisible(self)
  }
),
private = list(
  # card database should not be modified after creation of reader
  data = NULL,
  
  # internal method for determining total # of distinct cards available to the reader
  num_cards = function() {
    return(nrow(private$data))
  },
  
  # card and field are both strings
  # I'm not sure what the best way to implement this is but I'm just gonna
  # GO FOR IT
  get_field = function(card, field) {
    return(private$data[card, field])
  }, 
  
  # this is only called by the multi-card print function
  print_card = function(card) {
    card_data <- private$data[card,]
    keys <- colnames(card_data)
    vals <- map(1:ncol(card_data), function(x){card_data[[x]]}) # is there a simpler way to do this?
    
    cat("Card: ", card, "\n  ",  sep = "")
    cat(paste(keys, ": ", vals, sep = ""), sep = "\n  ")
    
    invisible(self)
  }
))