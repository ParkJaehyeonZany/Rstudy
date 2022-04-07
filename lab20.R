library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")
library(fmsb)

stats <- read.csv("data/picher_stats_2017.csv")
View(stats)
dim(stats)


# 강윤구 107

# 문제1
player <- stats[107,c(3,4,11,12,13)]
max.stats <- rep(30,5)
min.stats <- rep(0,5)
player.stats <- data.frame(rbind(max.stats, min.stats, player))
colnames(player.stats) <- c("승","패","삼진","볼넷","홈런")

# radarchart(player.stats)
png("output/lab20.png", width=500, height=500)
radarchart(player.stats,                           # 데이터프레임
           pcol='dark green',            # 다각형 선의 색 
           pfcol=rgb(0.2,0.5,0.5,0.5),   # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=4,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           caxislabels=seq(0,30,5),    # 축의 레이블 값
           title='강윤구 선수의 성적',
           family="dog"
           )
dev.off()

### 문제2
library(ggplot2)
library(dplyr)
iris
# 1 
head(iris)
iris.mean <- mean(iris$Sepal.Width)           # 평균
iris.sd <- sd(iris$Sepal.Width)               # 표준편차
iris.quan <- quantile(iris$Sepal.Width, 0.75) # 3분위수
summary(iris$Sepal.Width)[5]                  # 3분위수
# 2
hist(iris$Sepal.Width, xlab="Sepal.Width", ylab="Frequency", main="꽃받침 너비", family="maple")
# 3
aggregate(iris$Sepal.Width, by=list(Species=iris$Species), FUN=min)
# 4
agg.min <- aggregate(iris$Sepal.Width, by=list(Species=iris$Species), FUN=min)
agg.min <- rename(agg.min, min="x")
agg.max <- aggregate(iris$Sepal.Width, by=list(Species=iris$Species), FUN=max)
agg.max <- rename(agg.max, max="x")
agg.sw <- merge(agg.max, agg.min, by="Species")
(agg.sw <- mutate(agg.sw, x=max-min))
o <- order(agg.sw$x, decreasing=T)[1]
agg.sw[o,]
# 5
test <- iris %>% filter(Species=="virginica")
test <- test[,-5]
head(test)
test <- iris %>% filter(Species=="virginica") %>% select(-Species)
head(test)
# 6
cor(test)
