# 문제1
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

product_click <- read.table("data/product_click.log", col.names=c("time","clickCount"))
# 
a <- product_click[1,1]
year <- substr(a, 1,4)
mon <- substr(a, 5,6)
day <- substr(a, 7,8)
b <- paste(year, mon, day, sep="-")
(date <- as.POSIXlt(b))


# 문제2

movie_review <- read.csv("output/movie_reviews3.csv")
  # title <- movie_review$vtitle
point <- movie_review$vpoint
  # df <- data.frame(title, point)

hist(point, main="영화 평점 히스토그램(auto)", family="maple",
     xlab="평점", ylab="평가지수", col=heat.colors(10))
hist(point, main="영화 평점 히스토그램(1~5,6~10)", family="maple",
     xlab="평점", ylab="평가지수", col=c("skyblue","pink"), breaks=2)
hist(point, main="영화 평점 히스토그램(1~5,6,7,8,9,10)", family="maple", col.main="red",
     xlab="평점", ylab="평가지수", col=c("skyblue","pink"), breaks=c(1,5,6,7,8,9,10), freq=T)

# 문제3
one <- read.csv("data/one.csv")


area <- one$구별
space <- one$X1인가구

df <- data.frame(area, space)
head(df)

head(t(one))
t(df)
as.data.frame(t(df))
as.vector(t(df))
