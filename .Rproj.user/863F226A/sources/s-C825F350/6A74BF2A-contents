# 문제1
grade <- sample(1:6,1)
if (grade<=3) {
  cat(grade,"학년은 저학년입니다.")
}else {
  cat(grade,"학년은 고학년입니다.")}

# 문제2
choice <- sample(1:5,1)
if (choice == 1) {
  result <- 300 + 50
}else if (choice == 2){
  result <- 300 - 50
}else if (choice == 3){
  result <- 300 * 50
}else if (choice == 4){
  result <- 300 / 50
}else {
  result <- 300 %% 50
}
cat('결과값 :', result, '\n')

result <- switch(EXPR=choice,
                 300+50,
                 300-50,
                 300*50,
                 300/50,
                 300%%50)
cat('결과값 :', result, '\n')

# 문제3
count <- sample(3:10,1)
deco <- sample(1:3,1)
if (deco == 1){
  for (i in 1:count){
    cat('*')
  }
}else if (deco == 2){
  for (i in 1:count){
    cat('$')
  }
}else if (deco == 3){
  for (i in 1:count){
    cat('#')
  }
}


if (deco == 1){
  rep('*',count)
}else if (deco == 2){
  rep('$',count)
}else if (deco == 3){
  rep('#',count)
}

rep(switch(EXPR=deco, '*', '$', '#'),count)

# 문제4
score <- sample(1:100,1)
score_G <- as.character(score %/% 10) # score_G <- paste(score %/% 10)
level <- switch(EXPR = score_G,
                '10' = , '9' = 'A 등급',
                '8' = 'B 등급',
                '7' = 'C 등급',
                '6' = 'D 등급',
                'F 등급')
cat(score,'점은',level,'입니다.', '\n')
                
                
# 문제5
(alpha <- paste(LETTERS, letters, sep = ''))

# 문제6
iotest1 <- scan('data/iotest1.txt')
cat('오름차순 :', sort(iotest1), '\n')
cat('내림차순 :', rev(sort(iotest1)), '\n') # cat('내림차순 :', sort(iotest1, decreasing = T))
cat('합 :', sum(iotest1), '\n')
cat('평균 :', mean(iotest1), '\n')

# 문제7
iotest2 <- scan('data/iotest2.txt', what='')
cat('가장 많이 등장한 단어는', names(which.max(table(iotest2))), '입니다.', '\n')
    