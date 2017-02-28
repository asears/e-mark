#!/usr/bin/env Rscript
# sample script to read a file based on parameter %1
# Rscript --vanilla Params.R myfile
args = commandArgs(trailingOnly=TRUE)

if(length(args) == 0){
  stop("Usage: Params.R myparam.n", call.=FALSE)
} else if (length(args) == 1){
  args[2] == "out.txt"
}

df = read.table(args[1], header = TRUE)
num_vars = which(sapply(df, class) == "numeric")
df_out = d[ , num_vars]
write.table(df_out, file-args[2], row.names = FALSE)
