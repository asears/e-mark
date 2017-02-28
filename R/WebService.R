library(plumber)
r <- plumb("RandomSigs.R")
r$run(port=8000)