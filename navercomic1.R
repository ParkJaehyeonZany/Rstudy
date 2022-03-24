library(rvest)

url <- "https://comic.naver.com/genre/bestChallenge.nhn"
webtoon <- read_html(url)

comic.name <- html_text(html_nodes(webtoon, "h6 > a"), trim=T)
comic.name

comic.summary <- html_text(html_nodes(webtoon, "div.challengeInfo > div.summary"))
comic.summary

comic.grade <- html_text(html_nodes(webtoon, "div.challengeInfo > div.rating_type > strong"))
comic.grade

comic.df <- data.frame(comic.name, comic.summary, comic.grade)
View(comic.df)