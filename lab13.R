# 문제1
library(KoNLP)

movie <- read.csv("output/movie_reviews3.csv")
movie[[4]]
movie_gsub <- gsub("[[:punct:][:digit:]A-Za-zㄱ-ㅎㅏ-ㅣ]","", movie[[4]])
movie_gsub
movie_noun <- sapply(movie_gsub, extractNoun)

movie_table <- table(unlist(movie_noun))
movie_sort <- sort(movie_table, decreasing = T)
movie_top10_df <- data.frame(head(movie_sort, 10))
colnames(movie_top10_df) <- c("wname","wcount")
View(movie_top10_df)
write.csv(movie_top10_df, "output/movie_top_word.csv")

# 문제1 - 예시1
movie_review <- read.csv("output/movie_reviews3.csv")
movie_review.v <- as.vector(movie_review[["vreview"]])
movieReview.R1 <- gsub("[[:punct:][:digit:]ㄱ-ㅎㅏ-ㅣa-zA-Z]", "", movie_review.v)
movieReview.R1

text_mining <- extractNoun(movieReview.R1)
un_text_mining <- unlist(text_mining) # unlist 왜 하는것인가
text_mining_word <- table(un_text_mining)
text_mining_result <- sort(text_mining_word, decreasing=T)

wname <- head(names(text_mining_result), 10);
str(wname)
wcount <- head(as.integer(text_mining_result), 10)

text_mining_df <- data.frame(wname, wcount)
View(text_mining_df)
write.csv(text_mining_df, "output/movie_top_word.csv", fileEncoding = "UTF-8")


# 문제1 - 예시2
movie_review <- read.csv("output/movie_reviews3.csv")
movie_review$vreview <- gsub("[ㄱ-ㅎㅏ-ㅣa-zA-Z[:punct:][:digit:]]", "", movie_review$vreview)
movie_review$vreview
word_data_noun <-sapply(movie_review$vreview, extractNoun)

word_table <-table(unlist(word_data_noun)) # unlist 왜 하는것인가
word_table2 <- sort(word_table, decreasing=T)
word_top10_df <- data.frame(head(word_table2, 10))
colnames(word_top10_df) <- c("wname", "wcount")
View(word_top10_df)
write.csv(word_top10_df, "output/movie_top_word2.csv")


# 문제2

library(htmlwidgets)
library(wordcloud2)

book <- readLines("output/yes24.txt")
book_n <- extractNoun(book, autoSpacing = T)
book_gusb <- gsub("[^ㄱ-ㅎㅏ-ㅣ가-힣] ", "", unlist(book_n)) # 왜 unlist...?

undata <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, book_gusb)
book_table <- table(undata)
book_sort <- sort(book_table, decreasing = T)
book_df <- data.frame(book_sort)

book_wc <- wordcloud2(book_df, fontFamily = "휴먼옛체")
book_wc
htmltools::save_html(book_wc, "output/yest24.html")
