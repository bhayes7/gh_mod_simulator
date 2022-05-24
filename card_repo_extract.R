library(dplyr)
library(tidyr)

# extracts filenames and paths for all player modifier cards

modCardImageFolder <- "./modifier_cards"

# BASE CARDS

# the core 20 card modifier deck plus an image of the back, 4 copies
baseImageFolder <- paste(modCardImageFolder, "/base/player", sep = "")
baseFilenames <- list.files(path = baseImageFolder, full.names = FALSE)
baseFilepaths <- list.files(path = baseImageFolder, full.names = TRUE)

# all base modifiers (blessings, curses, misc. -1s)
baseModImageFolder <- paste(modCardImageFolder, "/base/player-mod", sep = "")
baseModFilenames <- list.files(path = baseModImageFolder, full.names = FALSE)
baseModFilepaths <- list.files(path = baseModImageFolder, full.names = TRUE)

# let's wrap these up
baseCards <- data.frame(c(baseFilenames, baseModFilenames),
                        c(baseFilepaths, baseModFilepaths))
colnames(baseCards) <- c("filename", "filepath")


# MERC-SPECIFIC CARDS

# omit base since it's differently structured and we've already handled that
mercDirs <- list.files(modCardImageFolder)[-c(1)]

mercCardsList <- lapply(mercDirs, function(merc){
  path <- paste(modCardImageFolder, merc, sep = "/")
  filenames <- list.files(path = path, full.names = FALSE)
  filepaths <- list.files(path = path, full.names = TRUE)
  return(data.frame(merc = rep_len(merc, length(filenames)), 
                    filename = filenames, filepath = filepaths))
})
mercCards <- do.call(rbind, mercCardsList)

# all together now!
allCards <- full_join(baseCards, mercCards)

# file export
write.csv(allCards, "pl_mod_cards.csv")
