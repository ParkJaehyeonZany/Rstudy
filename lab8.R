# 문제1
v <- 1:10
v <- sample(1:26,10)
sapply(v, function(num) LETTERS[num])


# 문제2
memo <- readLines("data/memo.txt", encoding="UTF-8")
memo[1] <- gsub("[&$!#@%]", "", memo[1])
memo[2] <- gsub("e", "E", memo[2]) # m2 <- toupper(memo[2])
memo[3] <- gsub("[1234567890]", "", memo[3]) 
memo[4] <- gsub("[A-Za-z]", "", memo[4])
memo[4] <- gsub("  ", " ", memo[4])
memo[5] <- gsub("[!<>12345678]", "", memo[5]) # memo[5] <- ("[^가-힣. ", "" memo[5])
memo[6] <- gsub("[[:space:]]", "", memo[6])
memo[7] <- tolower(memo[7]) # memo[7] <- gsub("([[:upper:]])", "\\L\\1", memo[7], perl=T)
write(memo, "memo_new.txt")


# 문제3
birth <- as.POSIXlt('1996/07/10')
weekdays(birth)
