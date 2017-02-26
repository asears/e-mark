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
pages <- 2:2



for (i in 1:1)
{
  dftmp = readpage(i)
}

for (i in pages)
{
  df = readpage(i)
  merge(df,dftmp)
}


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
docs <- tm_map(docs, removeWords, c("inc", "agile"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
#docs <- tm_map(docs, stemDocument)
inspect(docs)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 1000)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

findFreqTerms(dtm, lowfreq = 4)

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")