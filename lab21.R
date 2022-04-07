library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


fac <- read.csv("data/factory.csv")
head(fac)

# 1
plot(fac, 
     xlab="사용연도", ylab="정비비용", 
     col.main="red",
     pch=16,
     col="blue",
     main="사용연도와 정비비용",
     cex.main=2,
     family="maple")

# 2
cor(fac)

# 3
cor.test(fac$age,fac$cost)

# 4
factory.lm = lm(cost ~ age, data = fac)

# 5
abline(factory.lm,col="red")

# 6
summary(factory.lm)
summary(factory.lm)$r.squared

# 7
df <- data.frame(age = 4)
predict.lm(factory.lm, newdata = df)

b_0 = summary(factory.lm$coefficients[1,1])
b_1 = summary(factory.lm$coefficients[2,1])
(estimate_4 = b_1*4 + b_0)
