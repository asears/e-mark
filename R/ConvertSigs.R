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
library(dplyr)
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

  #sigs <- htmltab(doc = url, which = "//caption[starts-with(text() = 'Signatures')]/ancestor::table")
  #head(sigs)
  
  sigs <- url %>%
    read_html() %>%
    html_nodes("table") %>%
    .[[3]] %>%
    html_table(fill = TRUE, header=TRUE)
  
  #sigs <- sigs[[1]]
  #sigs <- sigs[[1]]
  meta["date1"] <- gsub("Signatures Received: ","",colnames(sigs)[1])
  meta["date2"]<- gsub("Signatures Received: ","",colnames(sigs)[2])
  meta["date3"]<- gsub("Signatures Received: ","",colnames(sigs)[3])
  
  colnames(sigs) <- c('text1','text2','text3')  
  sigs <- merge(sigs, as_data_frame(meta))  
  colnames(sigs) <- c('text1','text2','text3','dates')  
  sigs <- merge(sigs, as_data_frame(url))  
  colnames(sigs) <- c('text1','text2','text3','dates','filename')  
  return(sigs)
}

# number of signatory pages to read
pages <- 2:391


# read the first dataframe
for (i in 1:1)
{
  df_all = readpage(i)
  #colnames(dftmp) <- c('text1','text2','text3')
  
}

# continue with the rest and merge

for (i in pages)
{
  # read the page
  df = readpage(i)
  
  # join the page to last page
  df_all <- rbind(df,df_all)
  
  # set this page to last page
  
}

saveRDS(df_all,"../data/sigs.rds")
str(df_all)

# plot as a table
# library(gridExtra)
# library(ggplot2)
# plt <- ggplot(dftmp)
# tt <- ttheme_default(colhead=list(fg_params = list(parse=TRUE)))
# tbl <- tableGrob(dftmp, rows=NULL, theme=tt)
# 
# grid.arrange(plt, tbl,
#              nrow=2,
#              as.table=TRUE,
#              heights=c(3,1))
