library("rvest")
library(stringr)
library(data.table)

# Install
#install.packages("tm")  # for text mining
#install.packages("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes
#install.packages("htmltab")
# Load text analytics libraries
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library(htmltab)

# define base path
uri <- c("http://agilemanifesto.org/display/")
#000000001
#00000001
#http://agilemanifesto.org/display/000000111.html
#uri

# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

readpage <- function (i) {
  i <- str_pad(i, 9, pad = "0")
  url <- paste('../data/sigs_',i,".html", sep="")
  
  print(url)
  
  #sigs <- htmltab(doc = url, which = "//caption[starts-with(text() = 'Signatures')]/ancestor::table")
  #head(sigs)
  
  sigs <- url %>%
    read_html() %>%
    html_nodes("table") %>%
    .[[3]] %>%
    html_table(fill = TRUE, header=TRUE)
  
  #sigs <- sigs[[1]]
  #sigs <- sigs[[1]]
  return(sigs)
}

# number of signatory pages to read
pages <- 2:391


# read the first dataframe
for (i in 1:1)
{
  dftmp = readpage(i)
}

# continue with the rest and merge

for (i in pages)
{
  df = readpage(i)
  merge(df,dftmp)
}

saveRDS(df,"../data/sigs.rds")
