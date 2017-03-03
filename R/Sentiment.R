# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
df <- readRDS("../data/sigs.rds")

#ls()
#names(df)
#str(df)
#dim(df)
#class(df)
#colnames(df)
#head(df)

#library(devtools)
#install.packages("TTR")
#install_github("mannau/tm.plugin.sentiment")


# retrieve corpus
require(tm.plugin.webmining)
library(tm.plugin.sentiment)
#corp = WebCorpus(GoogleFinanceSource("AAPL"))
corp =Corpus(VectorSource(df))
# score corpus
corp <- score(corp)
sentixts <- metaXTS(corp)
stem <- tm_map(corp, stemDocument)
# chart sentiment scores
chartSentiment(sentixts)

# find companies ()
# find names : ":

#install.packages("rex")
library("rex")
companies <- 
 re_matches(df,
                        rex(
                          "(",
                          capture(name = "text", except_any_of(")")),
                          ")"),
                        global = TRUE)

companies[[1]]$text


#install.packages("RTextTools")
library(RTextTools);

training_data <- df[sample(1:699,size=600,replace=FALSE),]

matrix <- create_matrix(training_data, language="english", 
                        removeNumbers=FALSE, 
                        stemWords=FALSE, 
                        removePunctuation=FALSE, 
                        weighting=weightTfIdf)
# 
# container <- create_container(matrix,t(training_data),trainSize=1:200, testSize=201:600,virgin=FALSE)
# 
# models <- train_models(container, algorithms=c(
#                                                #"MAXENT",
#                                                #"SVM",
#                                                #"GLMNET",
#                                                #"SLDA",
#                                                #"TREE",
#                                                #"BAGGING",
#                                                #"BOOSTING",
#                                                "RF"
#                                                ))
# results <- classify_models(container, models)
# 
# 
# # VIEW THE RESULTS BY CREATING ANALYTICS
# analytics <- create_analytics(container, results)
# 1
# analytics@ensemble_summary


