# 문제1
product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

head(product_click)

click_table <- table(product_click$product)
barplot(click_table, main="세로바 그래프 실습", col.main="red", col=terrain.colors(10),
        xlab="상품ID", ylab="클릭수", cex.axis=0.7, cex.names=0.7, cex.lab=0.7)

png(filename="output/clicklog1.png", height=500, width=700, bg="white")

dev.off()

# 문제2

product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

hour_click <- as.numeric(substr(product_click$time, 9, 10))
hour_table <- table(hour_click)
names(hour_table) <- paste0(names(hour_table), "~", as.numeric(names(hour_table))+1)

pie(hour_table, main="파이그래프 실습", radius=1, col.main="blue", col=rainbow(20),
    cex.axis=0.7, cex.names=0.7)

png(filename="output/clicklog2.png", height=500, width=700, bg="white")

dev.off()



# 문제3
library(showtext)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")

(grade <- read.table("data/성적.txt", header=TRUE))
grade_index<- grade[3:5]
grade$성명 <- c('길동', '둘리', '또치', '도우너', '희동', '듀크', '턱시', '토토로', '올라프', '우디')
row.names(grade_index) <- grade$성명

barplot(t(grade_index), 
        col=c('orange','skyblue','pink'),
        family="dog")
title(main="학생별 점수", family="dog", col.main="orange")

legend(11,30, names(grade_index), cex=0.8, fill=c('orange','skyblue','pink'))

png(filename="output/clicklog3.png", height=500, width=700, bg="white")

dev.off()
