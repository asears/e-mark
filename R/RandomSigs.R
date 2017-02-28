#todo - clean this up with pacman

library("rvest")
library(stringr)
library(data.table)
library(jsonlite)

# Install
#install.packages("tm")  # for text mining
#install.packages("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes
#install.packages("htmltab")
#install.packages("RWeka")
#install.packages("R2HTML")
# Load text analytics libraries
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")
library("RWeka")

library(htmltab)

library("ggplot2")

# plumber web services
#install.packages("plumber")

# export to html
library(R2HTML)

# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# load file previously created by DownloadSigs.R and ConvertSigs.R
# TODO - ConvertSigs lost some fidelity

df <- readRDS("../data/sigs.rds")

# keep only the text1, text2, text3 (drop dates, filename)
df <- df[c(1:3)]
# create a corups from page
docs <- Corpus(VectorSource(df))

#$content chr
# first delimiter :
# second delimiter ()

# there are 3 elemends in VCorpus
# first set of content row from each element
#docs[[1]][1]$content[1]
#docs[[2]][1]$content[1]
#docs[[3]][1]$content[1]

# last set of content row
#docs[[2]][1]$content[1564]


# random sample from any of these docs

#* @get /agilefortune
agileFortune <- function(){
  docrnd <- sample(1:3,1)
  contentrnd <- sample(1:1564,1)

  responsebody <- (docs[[docrnd[1]]][1]$content[contentrnd[1]])
  responsebody <- toJSON(responsebody)
  return (responsebody)
}

#agileFortune()
# 
# # Now write all the items to html file
# HTMLStart(outdir="../data", file="sigs",
#           extension="html", echo=FALSE, HTMLframe=TRUE)
# HTML.title("Signatories of Agile Manifesto", HR=1)
# HTMLhr()
# options("max.print"=1000000) 
# docs[[1]][1]$content
# docs[[2]][1]$content
# docs[[3]][1]$content
# 
# HTMLStop()
