# 박스플롯
(성적 <- read.table("data/성적.txt", header=TRUE));
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적", family='dog')


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("data/온도.txt", header=TRUE, sep=",")
head(data, n=5) 
dim(data)
boxplot(data)
boxplot(data, las = 2)
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)
# old <- par(family="maple")
boxplot(data, family='maple')  # 안됨!! 다른 아이들은 다 되는데!!

boxplot(data, axes=F)
axis(1, at=1:12, lab=names(data), family="maple") # x축 추가
axis(2, at=seq(-5, 15, 5), family="cat")
title("다양하게 폰트를 지정한 박스플롯", family="cat", cex.main=2)
box()

dev.copy(png, "output/mytest.png") 
dev.off()

rainbow(10)
heat.colors(10)
terrain.colors(10)
topo.colors(10)
cm.colors(10)
gray.colors(10)
colors()


# 데이터 전처리 - dplyr 패키지를 학습하자....

install.packages("dplyr") 
install.packages("ggplot2")

library(dplyr) # detach("package:dplyr")
str(ggplot2::mpg)
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
exam <- read.csv("data/csv_exam.csv")
str(exam)
dim(exam)
head(exam);tail(exam)
View(exam) 

# [ filter() ]
# exam에서 class가 1인 경우만 추출하여 출력
filter(exam, class == 1) # dplyr을 로드하지 않고 수행하면 stats 패키지의 filter()가 수행됨
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
# 2반인 경우만 추출
exam %>% filter(class == 2)
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5)  # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반에 해당하면 추출
# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
exam %>% filter(class == 2) -> class2
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기
