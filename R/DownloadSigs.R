
# Install

# define base path
uri <- c("http://agilemanifesto.org/display/")
#000000001
#00000001
#http://agilemanifesto.org/display/000000111.html
#uri

# set working folder
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# function to download pages
wgetpage <- function (i) {
  i <- str_pad(i, 9, pad = "0")
  uri_incr <- paste(uri, i, ".html", sep = "")
  dest_incr <- paste('../data/sigs_',i,".html", sep="")
  print(uri_incr)
  
  download.file(url=uri_incr,
                destfile=dest_incr, method='curl')

}

# number of signatory pages to read
# up to July 2016 there were 391 pages
pages <- 1:391

# go get coffee
for (i in pages)
{
  df = wgetpage(i)
}
