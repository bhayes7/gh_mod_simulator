# ------------------------- #
# Tests for ModifierReserve #
# ------------------------- #

blessings <- c("gh-am-pm-11.png", "gh-am-pm-12.png", "gh-am-pm-13.png",
               "gh-am-pm-14.png", "gh-am-pm-15.png", "gh-am-pm-16.png",
               "gh-am-pm-17.png", "gh-am-pm-18.png", "gh-am-pm-19.png",
               "gh-am-pm-20.png")

curses <- c("gh-am-pm-01.png", "gh-am-pm-02.png", "gh-am-pm-03.png",
            "gh-am-pm-04.png", "gh-am-pm-05.png", "gh-am-pm-06.png",
            "gh-am-pm-07.png", "gh-am-pm-08.png", "gh-am-pm-09.png",
            "gh-am-pm-10.png")

penalties <- c("gh-am-pm-21.png", "gh-am-pm-22.png", "gh-am-pm-23.png",
               "gh-am-pm-24.png", "gh-am-pm-25.png", "gh-am-pm-26.png",
               "gh-am-pm-27.png", "gh-am-pm-28.png", "gh-am-pm-29.png",
               "gh-am-pm-30.png", "gh-am-pm-31.png", "gh-am-pm-32.png",
               "gh-am-pm-33.png", "gh-am-pm-34.png", "gh-am-pm-35.png")

source("classes/ModifierReserve.R")

BlessDeck <- ModifierReserve$new(blessings)

print(BlessDeck)
