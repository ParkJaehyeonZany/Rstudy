# 문제1
movie <- read.csv("output/movie_reviews3.csv")
movie_gsub <- gsub("[[:punct:]][A-Za-z0-9ㄱ-ㅎㅏ-ㅣ]","", movie)

movie_n <- extractNoun(movie_gsub)
movie_table <- table(unlist(movie_n[4]))
movie_data <- Filter(function(x) {nchar(x) >= 2}, movie_table)


# 문제2
book <- readLines("output/yes24.txt")
book_n <- extractNoun(book, autoSpacing = T)
book_gusb <- gsub("[^가-힣] ", "", book_n)

undata <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, book_gusb)
length(undata)
table(undata)
