# 1
news <- read_html("https://news.daum.net/")
newscategory <- NULL
newstitle <- NULL

for (index in 1:20) {
  newscategory[index] <- html_text(html_nodes(news, paste0("ul > li:nth-child(", index, ") > div > div > span > span.txt_category")))
  newstitle[index] <- html_text(html_nodes(news, paste0("ul > li:nth-child(", index, ") > div > div > strong > a")), trim=T)
  article <- append(newscategory, newstitle)
}

page <- data.frame(newscategory,newstitle)
View(page)

write.csv(page, "output/daumnews.csv")


# 2
url <- read_html("https://news.daum.net/")
newstitle <- html_text(html_nodes(url, "div.box_g.box_news_issue > ul > li > div > div > strong > a"), trim=T)
newstitle
newscategory <- html_text(html_nodes(url, "div.box_g.box_news_issue > ul > li > div > div > span > span.txt_category"))
newscategory

daumnews <- data.frame(newstitle, newscategory)
View(daumnews)
write.csv(daumnews, "output/daumnews.csv")

