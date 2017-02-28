# This will consume the plumber web service running on port 8000
library(httr)

result <- GET("http://localhost:8000/agilefortune")

dat <- jsonlite::fromJSON(content(result, as="text"), flatten=TRUE)
