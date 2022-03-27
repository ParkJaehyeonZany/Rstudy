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

movie_gradev = NULL
movie_goodsv = NULL
movie_commentv = NULL

remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")
Sys.sleep(1)

grade <- remDr$findElements(using = "css selector", "div.story-point")
movie_grade <- sapply(grade, function(x) {x$getElementText()})
movie_gradev <- c(movie_gradev, unlist(movie_grade))
movie_gradev

goods <- remDr$findElements(using = "css selector", "div.story-recommend")
movie_goods <- sapply(goods, function(x) {x$getElementText()})
movie_goodsv <- c(movie_goodsv, unlist(movie_goods))
movie_goods

comment <- remDr$findElements(using = "css selector", "div.story-txt")
movie_comment <- sapply(comment, function(x) {x$getElementText()})
movie_commentv <- c(movie_commentv, unlist(movie_comment))
movie_commentv

for (i in 2:10) {
  nextCss <- paste0("#contentData > div > div.movie-idv-story > nav > a:nth-child(",i,")")
  nextListLink <- remDr$findElement(using = "css selector", nextCss)
  nextListLink$clickElement()
  Sys.sleep(1)
  
  grade <- remDr$findElements(using = "css selector", "div.story-point")
  movie_grade <- sapply(grade, function(x) {x$getElementText()})
  movie_gradev <- c(movie_gradev, unlist(movie_grade))
  movie_gradev
  
  goods <- remDr$findElements(using = "css selector", "div.story-recommend")
  movie_goods <- sapply(goods, function(x) {x$getElementText()})
  movie_goodsv <- c(movie_goodsv, unlist(movie_goods))
  movie_goods
  
  comment <- remDr$findElements(using = "css selector", "div.story-txt")
  movie_comment <- sapply(comment, function(x) {x$getElementText()})
  movie_commentv <- c(movie_commentv, unlist(movie_comment))
  movie_commentv
}
movie_df <- data.frame(movie_gradev, movie_goodsv, movie_commentv)
View(movie_df)
write.csv(movie_df, file = "oultput/movie.csv")
  
  
  