#todo - clean this up with pacman

library("rvest")
library(stringr)
library(data.table)

# Install
#install.packages("tm")  # for text mining
#install.packages("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes
#install.packages("htmltab")
#install.packages("RWeka")

# Load text analytics libraries
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("RWeka")

library(htmltab)

library("ggplot2")

# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# load file previously created by DownloadSigs.R and ConvertSigs.R

df <- readRDS("../data/sigs.rds")

# keep only the text1, text2, text3 (drop dates, filename)
df <- df[c(1:3)]
# create a corups from page
docs <- Corpus(VectorSource(df))

# tidy page
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, "\n")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("inc", "ltd","will",
                                    "\u0085ç\u009bã\u0080\u0082",
                                    "â\u0080\u0093"
                                    #"team","people","process","working",
                                    #"years",
                                    #"business","projects",
                                    #"agile", "manifesto", 
                                    "http", 
                                    #"principles", "development",
                                    "software", "work", "project", "way", "support",
                                    #"can","just","get",
                                    "true","value","believe"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
#docs <- tm_map(docs, stemDocument)
inspect(docs)
saveRDS(dtm,"../data/docs.rds")

dtm <- TermDocumentMatrix(docs)
saveRDS(dtm,"../data/dtm.rds")

m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

#write.csv(d, file = "../data/wordfreqs.csv")

# This takes awhile
#BigramTokenizer <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 5))

#btm <- TermDocumentMatrix(docs, control = list(tokenize = BigramTokenizer))
#m <- as.matrix(btm)
#v <- sort(rowSums(m),decreasing=TRUE)
#d <- data.frame(word = names(v),freq=v)
#saveRDS(d,"../data/5grams.rds")
#head(d)

# find associated terms
assoc <- findAssocs(dtm, terms = "adventureland", corlimit = 0.3)
assoc <- as.data.frame(assoc)

set.seed(1234)


stop()
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

findFreqTerms(dtm, lowfreq = 4)

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")