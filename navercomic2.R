library(rvest)

url <- "https://comic.naver.com/genre/bestChallenge?&page="

webtoon_info <- NULL

for (page in 1:50) {
  url_page <- read_html(paste0(url,page))
  print(url_page)
  comic.name <- html_text(html_nodes(url_page, "div.challengeInfo > h6 > a"), trim=T)
  comic.summary <- html_text(html_nodes(url_page, "div.challengeInfo > div.summary"))
  comic.grade <- html_text(html_nodes(url_page, "div.challengeInfo > div.rating_type > strong"))
  
  info <- data.frame(comic.name, comic.summary, comic.grade)
  webtoon_info <- rbind(webtoon_info, info)
}

View(webtoon_info)
write.csv(webtoon_info, "navercomic.csv")
