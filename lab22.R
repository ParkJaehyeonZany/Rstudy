library(dplyr)
library(ggplot2)

purifier <- read.csv("data/purifier.csv")
head(purifier)

new_purifier <- data.frame(purifier$purifier-purifier$old_purifier)
colnames(new_purifier) <- "new_purifier"

purifier <- cbind(purifier, new_purifier)
head(purifier)
pur <-lm(as_time ~ old_purifier + new_purifier, data=purifier)
summary(pur)

op <- par(mfrow=c(2,2))
plot(pur)
par(op)

df <- data.frame(as_time = 8*20)
predict.lm(pur, newdata = df)



#

rental<- read.csv("data/purifier.csv")

new_rental <- rental %>%
  mutate(young_purifier = puifier - old_purifier) %>% 
  select(young_purifier, old_purifier, as_times)

new_rental

rental_fit <- lm(as_time)