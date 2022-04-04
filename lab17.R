library(ggplot2)
library(showtext)
showtext_auto()
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

mpg <- as.data.frame(ggplot2::mpg)
View(mpg)

# 문제1
ggplot(mpg,aes(cty, hwy)) + geom_point(color="blue")
ggsave("output/result1.png")

# 문제2
ggplot(mpg, aes(class)) + geom_bar(aes(fill=drv))
ggsave("output/result2.png")

# 문제3
product_click <- read.table("data/product_click.log")
View(product_click)

ggplot(product_click,aes(V2)) + geom_bar(aes(fill=V2)) + theme_bw() + 
  labs(title = "제품당 클릭수", subtitle="제품당 클릭수를 바그래프로 표현", x="상품ID", y="클릭수")
ggsave("output/result3.png")

# 문제4
library(treemap)
data("GNI2014")
head(GNI2014)

png("output/result4.png", width=600, height=600)
treemap(GNI2014, 
        vSize="population", 
        index=c("continent","iso3"), 
        border.col="green", 
        title="전세계 인구 정보",
        fontsize.title=20,
        fontfamily.title="maple")

dev.off()
