# Plots signatories on a map
# todo
#install.packages("maps")
library("maps")
library("dplyr")

# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# this would need to be ngram to correctly identify cities
# for now single-word cities

d <- read.csv(file = "../data/wordfreqs.csv")
colnames(d) <- c("X","world.cities","freq")

cities <- as.data.frame(data(world.cities))
colnames(cities)
head(cities)
