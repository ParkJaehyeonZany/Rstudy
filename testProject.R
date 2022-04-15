library(dplyr)
library(ggplot2)

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


#####################

trafic <- read.csv("도로교통공단_서울시 사망사고 개별 정보_20181231.csv", fileEncoding = "euc-kr")
head(trafic)
# View(trafic)

traficman <- trafic %>% select("가해자연령") %>% filter(가해자연령 != "불명", 가해자연령 != "20세이하")
head(traficman)
summary(traficman)

trafic_table <- table(traficman)

# ggplot(traficman, aes(x=가해자연령)) +
#   geom_bar()




haveCar <- read.csv("HAVECAR.csv", fileEncoding = "euc-kr")
# View(haveCar)
haveCar <- haveCar[1:2,]
haveCar <- t(haveCar)

haveCar <-haveCar[3:11,]
colnames(haveCar) <- c("남자","여자")

haveCar <- as.data.frame(haveCar)
haveCar

for (j in 1:2) {
  for (i in 1:9) {
    haveCar[i,j] <- gsub("[[:punct:]]", "", haveCar[i,j])
  }
}
mode(haveCar$남자) <- "numeric"
mode(haveCar$여자) <- "numeric"
summary(haveCar)
# View(haveCar)

haveCar <- haveCar[-1,]

haveCar <- rbind(haveCar,"X70대 이상"=c(sum(haveCar[6:8,1]), sum(haveCar[6:8,2])))
for (i in 1:3) {
  haveCar <- haveCar[-6,]
}

carSum <- NULL
for (i in 1:6) {
  S <- sum(c(haveCar$남자[i], haveCar$여자[i]))
  carSum <- c(carSum, S)
}

haveCar <- cbind(haveCar, "총"=carSum)

# barplot(haveCar$총,
#         ylim=c(0, 800000))

Car <- haveCar
Car$연령대 <- rownames(haveCar)

Car <- cbind(Car, trafic_table)
tr1 <- ggplot(Car) +
  geom_col(aes(x=traficman, y=총))

tr2 <- ggplot(Car) +
  geom_col(aes(x=traficman, y=Freq))
library(gridExtra)
grid.arrange(tr1, tr2, nrow = 2)

##########

license <- read.csv("data/LicenseData.csv", fileEncoding = "euc-kr")
View(license)

license <- license[-c(1:3),c(2,5,6,10)]
colnames(license) <- c('연령별', '1종대형', '1종보통', '2종보통')


for (j in 2:4) {
  for (i in 1:13) {
    license[i,j] <- gsub("[[:punct:]]", "", license[i,j])
  }
}
for (i in 2:4){
  mode(license[,i]) <- "numeric"
}
license2 <- license[,-1]
rbind(license2, "20대"=c(sum(license2[1:2,1]), sum(license2[1:2,2]), sum(license2[1:2,3])))
for (i in 1:5) {
  license2 <- rbind(license2, 
                    c(sum(license2[(i*2-1):(i*2),1]), 
                      sum(license2[(i*2-1):(i*2),2]), 
                      sum(license2[(i*2-1):(i*2),3])))
}
license2 <- rbind(license2, c(sum(license2[11:13,1]),sum(license2[11:13,2],sum(license2[11:13,3]))))

license2 <- license2[14:19,]
row.names(license2) <- c("20대","30대","40대","50대","60대","70대이상")
summary(license2)

Car <- cbind(Car, license2)
colnames(Car) <- c("man","woman","total","age","ages","traficFreq","X1종대형","X1종보통","X2종보통")
View(Car)
Car <- Car %>% mutate(total_license=X1종보통+X2종보통) %>% group_by(ages)
summary(Car)
tr1 <- ggplot(Car) +
  geom_col(aes(x=ages, y=total)) +
  geom_point(aes(x=ages, y=total_license))

tr2 <- ggplot(Car) +
  geom_col(aes(x=ages, y=traficFreq))

grid.arrange(tr1, tr2, nrow = 2)

as.data.frame(Car)

###
accident <- read.csv("accident.csv", fileEncoding="euc-kr")

View(accident)
accident <- accident[1:3,c(-1,-2)]

for (j in 2:9) {
  for (i in 1:3) {
    accident[i,j] <- gsub("[[:punct:]]", "", accident[i,j])
  }
}
for (i in 2:9){
  mode(accident[,i]) <- "numeric"
}

acc_per <- c()
for (i in 2:9) {
  acc_per <- c(acc_per, (accident[2,i]/accident[1,i]*100))
}

accident <- rbind(accident,c("치명률", acc_per))

#
###
accident <- read.csv("accident.csv", fileEncoding="euc-kr")

# View(accident)
accident <- accident[1:3,c(-1,-2)]
rownames(accident) <- accident$구분
accident <- t(accident)
accident <- accident[-1,]

for (i in 1:8) {
  for (j in 1:3) {
    accident[i,j] <- gsub("[[:punct:]]", "", accident[i,j])
  }
}
for (i in 1:3){
  mode(accident[,i]) <- "numeric"
}
acc1 <- data.frame(as.numeric(accident[,1]))
acc2 <- data.frame(as.numeric(accident[,2]))
acc3 <- data.frame(as.numeric(accident[,3]))
accident3 <- data.frame(c(acc1,acc2,acc3))
colnames(accident3) <- c("발생건수","사망자수","부상자수")

summary(accident3)
acc_per <- c()
for (i in 1:8) {
  acc_per <- c(acc_per, (accident3[i,2]/accident3[i,1]*100))
}

accident3 <- cbind(accident3, 치명률 = acc_per)

rownames(accident3) <- c("합계","안전운전의무불이행","중앙선침범","과속","신호위반","교차로통행방법위반","안전거리미확보","기타")
accident3 <- cbind(accident3, 사고유형 = c("합계","안전운전의무불이행","중앙선침범","과속","신호위반","교차로통행방법위반","안전거리미확보","기타"))
View(accident3)

ggplot(accident3,aes(x=사고유형, y=치명률),group=1) +
  geom_point() +
  geom_line(aes(group=1))




ggplot(Car) +
  geom_col(aes(x=ages, y=total)) +
  geom_point(aes(x=ages, y=total_license))

ggplot(Car) +
  geom_col(aes(x=ages, y=traficFreq))

ggplot(accident3,aes(x=사고유형, y=치명률),group=1) +
  geom_point() +
  geom_line(aes(group=1))

ggplot(Car, aes(x = ages)) + 
  geom_line(aes(y = total, group=1)) + 
  geom_line(aes(y = traficFreq, group=1)) +
  scale_y_continuous(name = "자동차 보유량",  ## 첫번째 Y축 이름 설정
                     sec.axis = sec_axis(trans=~ ./5, name="교통사고 사망률")) +## 두번째 Y축 변환식과 이름 설정
  scale_x_date(name = '연령대') + ## X축 이름 설정
  scale_color_discrete(name = '취업자 종류', breaks = c('전체 취업자', '교육분야 취업자')) + ## 범례 순서 조정과 범례 제목 설정
  theme(legend.position = "bottom") ## 범례 위치 조정
