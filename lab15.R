# 문제1
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

product_click <- read.table("data/product_click.log", col.names=c("time","clickCount"))
 
# a <- product_click[1,1]
# year <- substr(a, 1,4)
# mon <- substr(a, 5,6)
# day <- substr(a, 7,8)
# b <- paste(year, mon, day, sep="-")

weekday_click <- as.POSIXlt(paste(substr(product_click$time, 1,4),
                                  substr(product_click$time, 5,6),
                                  substr(product_click$time, 7,8),
                                  sep="-"))$wday
weekday_click_table <- table(weekday_click)
names(weekday_click_table) <- c("월요일","화요일","수요일","목요일","금요일","토요일")

png(filename="output/clicklog4.png", height=400, width=700, bg="white")

par(mfrow=c(1,2))
plot(weekday_click_table,
     main="요일별 클릭 수",
     ylim=c(0,300),
     ylab="",
     col="orange",
     type="o",
     pch=16,
     family="cat",
     cex.axis=0.8,
     cex.main=2)
barplot(weekday_click_table,
        main="요일별 클릭수",
        ylim=c(0,300),
        col=topo.colors(6),
        family="cat",
        cex.axis=0.8,
        cex.main=2)

dev.off()


# 문제2

movie_review <- read.csv("output/movie_reviews3.csv", header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
  # title <- movie_review$vtitle
point <- movie_review$vpoint
  # df <- data.frame(title, point)


png(filename="output/clicklog5.png", height=400, width=1200, bg="white")
par(mfrow=c(1,3))
hist(point, main="영화 평점 히스토그램(auto)", family="maple",
     xlab="평점", ylab="평가지수", col=heat.colors(10))
hist(point, main="영화 평점 히스토그램(1~5,6~10)", family="maple",
     xlab="평점", ylab="평가지수", col=c("skyblue","pink"), breaks=2)
hist(point, main="영화 평점 히스토그램(1~5,6,7,8,9,10)", family="maple", col.main="red",
     xlab="평점", ylab="평가지수", breaks=c(1,5,6,7,8,9,10), freq=T)

dev.off()

# 문제3
one <- read.csv("data/one.csv", header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")

area <- one$구별
space <- one$X1인가구
df <- data.frame(area, space)
head(df)

png(filename="output/clicklog6.png", height=800, width=700, bg="white")

par(mfrow=c(1,1))
boxplot(space~area,
        main="구별 1인가구",
        col=cm.colors(25),
        axes=F,
        ann=F)
axis(1, at=seq(1,25), lab=names(table(area)), family="maple", las=2)
axis(2, at=seq(0,10000,2000), family="maple", col.main="orange", cex.main=2, las=2)
title("구별 1인가구", col.main="orange", family="maple", cex.main=2)

dev.off()