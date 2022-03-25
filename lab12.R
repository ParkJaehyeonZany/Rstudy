library(RSelenium)

url <- "https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700"
remDr$navigate(url)

df <- NULL

for (i in 1:10+1) {
  moviegradenodes <- remDr$findElements(using = "css selector", paste0("#contentData > div > div.movie-idv-story > ul > li:nth-child(", i, ") > div.story-area > div.story-box > div > div.story-cont > div.story-point > span"))
  moviegrade <- sapply(moviegradenodes, function(x) {x$getElementText()})
  
  moviegoodsnodes <- remDr$findElements(using = "css selector", paste0("#contentData > div > div.movie-idv-story > ul > li:nth-child(", i, ") > div.story-area > div.story-box > div > div.story-cont > div.story-recommend > em"))
  moviegoods <- list(sapply(moviegoodsnodes, function(x) {x$getElementText()}))
  
  moviecommentnodes <- remDr$findElements(using = "css selector", paste0("#contentData > div > div.movie-idv-story > ul > li:nth-child(", i, ") > div.story-area > div.story-box > div > div.story-cont > div.story-txt"))
  moviecomment <- sapply(moviecommentnodes, function(x) {x$getElementText()})

  df <- data.frame(grade=unlist(moviegrade), goods=unlist(moviegoods), comment=unlist(moviecomment))
}

df





#

movie_point = NULL
movie_recommend = NULL
movie_txt = NULL

remDr <- remoteDriver(remoteServerAddr = "localhost")