library(RSelenium)

movie_point = NULL
movie_recommend = NULL
movie_txt = NULL

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")
Sys.sleep(1)

doms1<-remDr$findElements(using ="css selector","div.story-point")
movie_p <- sapply(doms1,function(x){x$getElementText()})
movie_point <- c(movie_point, unlist(movie_p))
movie_point

doms2<-remDr$findElements(using ="css selector","div.story-recommend")
movie_r <- sapply(doms2,function(x){x$getElementText()})
movie_recommend <- c(movie_recommend, unlist(movie_r))
movie_recommend

doms3<-remDr$findElements(using ="css selector","div.story-txt")
movie_t <- sapply(doms3,function(x){x$getElementText()})
movie_txt <- c(movie_txt, unlist(movie_t))
movie_txt

for (i in 2:10) {
  nextCss <- paste("#contentData > div > div.movie-idv-story > nav > a:nth-child(",i,")", sep="")               
  nextListLink<-remDr$findElement(using='css selector',nextCss)
  nextListLink$clickElement()
  Sys.sleep(1)
  
  doms4<-remDr$findElements(using ="css selector","div.story-point")
  movie_p <- sapply(doms4,function(x){x$getElementText()})
  movie_point <- c(movie_point, unlist(movie_p))
  
  doms5<-remDr$findElements(using ="css selector","div.story-recommend")
  movie_r <- sapply(doms5,function(x){x$getElementText()})
  movie_recommend <- c(movie_recommend, unlist(movie_r))
  
  doms6<-remDr$findElements(using ="css selector","div.story-txt")
  movie_t <- sapply(doms6,function(x){x$getElementText()})
  movie_txt <- c(movie_txt, unlist(movie_t))
}
movie_df <- data.frame(movie_point, movie_recommend, movie_txt)
View(movie_df)
write.csv(movie_df, file = "output/movie.csv")

