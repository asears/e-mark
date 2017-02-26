# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df <- readRDS("../data/sigs.rds")

