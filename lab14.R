# 문제1

click <- read.table("data/product_click.log", header=TRUE)
table(click)
t(table(click))
barplot(as.matrix(click), main="세로바 그래프 실습", beside=T, ylab="클릭수", xlab="상품ID", col=terrain.colors(10), family="dog")
barplot(as.matrix(click), main="세로바 그래프 실습")

# 문제1 - 답안
product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

head(product_click)

click_table <- table(product_click$product)
png(filename="output/clicklog1.png", height=500, width=700, bg)

# 문제2

product_click <- read.table("data/product_click.log", sep=" ", col.names=c("time", "product"))

hour_click <- as.numeric(substr(product_click$time, 9, 10))
hour_table <- table(hour_click)
names(hour_table) <- paste0(names(hour_table), "~", as.numeric(names(hour_table))+1)

png(filename="output/clicklog2.png", height=500, width=700)





pie(as.matrix(click),labels=paste("-"), col=rainbow(20), clockwise=T, main="파이그래프 실습",
    family="dog")


# 문제3

(grade <- read.table("data/성적.txt", header=TRUE))
grade_index<- grade[3:5]
grade$성명 <- c('길동', '둘리', '또치', '도우너', '희동', '듀크', '턱시', '토토로', '올라프', '우디')
row.names(grade_index) <- grade$성명

barplot(t(grade_index), 
        col=c('orange','skyblue','pink'),
        family="dog")
title(main="학생별 점수", family="dog", col.main="orange")

legend(11,30, names(grade_index), cex=0.8, fill=c('orange','skyblue','pink'))

dev.off()
