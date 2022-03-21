# 문제1
L1 <- list(
  name = 'scott',
  sal = 3000
)
result1 <- L1[[2]]*2 # L1[['sal']]*2
result1

# 문제2
L2 <- list(
  'scott',
  c(100,200,300)
)
L2

# 문제3
L3 <- list(c(3,5,7),c('A','B','C')) # L3 <- list(seq(3,7,2),LETTERS[1:3])
L3[[2]][1] <- 'Alpha'
L3

# 문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] + 10 # L4$alpha + 10

# 문제5
L5 <- list(
  data1 = LETTERS,
  data2 = head(read.csv('data/emp.csv'), n=3),
  data3 = L4
)
L5[[1]][1] # L5$data1[1]
L5[[2]][,2] # L5$data2$ename
L5$data3$gamma

# 문제6
L6 <- list(
  math = list(95,90),
  writing = list(90,85),
  reading = list(85,50)
)
# sum(unlist(L6)/length(unlist(L6)))
L6 <- unlist(L6)
sum(L6)/length(L6) # mean(unlist(L6))
