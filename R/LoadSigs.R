# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df <- readRDS("../data/sigs.rds")

ls()
names(df)
str(df)
dim(df)
class(df)
colnames(df)
head(df)