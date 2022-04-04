library(tidyr)
library(dplyr)
library(ggplot2)
library(tm)
library(proxy)

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


### 문제1
grade <- read.csv("data/성적2.csv")

# 그림1
View(grade)

# 그림2
png("output/result1-2.png", width=960, height=540)
boxplot(grade$국어, grade$수학, range=1)$stat # boxplot(grande[,c(3:4)], range=1)$stat
dev.off()

# 그림3
grade$수학 <- ifelse(grade$수학 > 10, as.integer(mean(grade$수학, na.rm = T)), grade$수학)
View(grade)

# 그림4
grade %>% fill(국어, .direction="updown") %>% fill(수학, .direction="updown")

# 그림5
ggplot(grade, aes(국어, 수학)) + geom_point(size=3, aes(color=factor(성명))) # Warning message : 데이터 삭제 됨.
  
### 문제2
data <- read.csv("data/reshapedata.csv")
View(data)
# 1
longdata <- data %>% gather(key="exam", value="jumsu", math.mid:eng.final)
View(longdata)
# 2
widedata <- longdata %>% spread(key="exam", value="jumsu")
View(widedata)
# 3
result <- longdata %>%
  separate("eng.mid",
           c("subname","subnum")) %>% 
  separate(col = "eng.mid",
           into = c("eng", "mid"),
           sep = ".") %>% 
  separate(col = "math.final",
           into = c("eng", "final"),
           sep = ".") %>% 
  separate(col = "math.mid",
           into = c("math", "mid"),
           sep = ".")

### 문제3

듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <- c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")

students <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)

# 1
st_cps <- VCorpus(VectorSource(students))
st_tdm <- TermDocumentMatrix(st_cps, control=list(wordLengths = c(1, Inf)))
# names(st_tdm) <- c("듀크","둘리","또치","도우너","길동","희동")
inspect(st_tdm)
(st_m <- as.matrix(st_tdm))
# names(st_m) <- c("듀크","둘리","또치","도우너","길동","희동")
(st_v <- sort(rowSums(st_m), decreasing=T))

# 2
names(sort(rowSums(st_m), decreasing=T)[1])
# 3
names(sort(rowSums(st_m))[1])
