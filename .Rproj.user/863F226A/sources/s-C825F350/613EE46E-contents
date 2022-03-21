# 문제1
# Case1
exam1 <- function() {
  alpha <- paste(LETTERS,letters,sep='')
  return(alpha)
}
exam1()

# Case2
exam1 <- function() {
  return(paste0(LETTERS,letters))
}
exam1()


# 문제2
# Case1
exam2 <- function(num){
  sum <- 0
  for(i in 1:num) {
    sum = sum + i
  }
  return(sum)
}
cat('함수 호출 결과 :', exam2(10))
cat('함수 호출 결과 :', exam2(100))

# Case2
exam2 <- function(num){
  return(sum(c(1:num)))
}
cat('함수 호출 결과 :', exam2(10))
cat('함수 호출 결과 :', exam2(100))


# 문제3
# Case1
exam3 <- function(n1,n2) {
  if(n1 >= n2) {
    result = n1 - n2
  } else if (n2 > n1) {
    result = n2 - n1
  }
  return(result)
}
print(paste('함수 호출 결과 :', exam3(10,3)))
print(paste('함수 호출 결과 :', exam3(5,5)))
print(paste('함수 호출 결과 :', exam3(7,10)))

# Case2
exam3 <- function(x,y){
  return(abs(x-y)) # abs() : 절댓값
}
print(paste('함수 호출 결과 :', exam3(10,3)))
print(paste('함수 호출 결과 :', exam3(5,5)))
print(paste('함수 호출 결과 :', exam3(7,10)))


# 문제4
exam4 <- function(n1,oper,n2) {
  if (oper == '+') {
    result = n1 + n2
  } else if (oper == '-') {
    reulst = n1 - n2
  } else if (oper == '*') {
    result = n1 * n2
  } else if (oper == '%/%' | oper == '%%') {
    if (n1 == 0) {
      return('오류1')
      next()
    } else if (n2 == 0){
      return('오류2')
      next()
    }
    if (oper == '%/%') {
      result = n1 %/% n2
    } else if (oper == '%%') {
      result = n1 %% n2
    }
  } else{
    result = '규격의 연산자만 전달하세요.'
  }
  return(result)
}
exam4(3,'+',3)
exam4(3,'-',3)
exam4(3,'*',3)
exam4(3,'%/%',3)
exam4(3,'%%',3)
exam4(0,'%/%',3)
exam4(3,'%%',0)
exam4(1,'1',1)

# 문제5
# Case1
exam5 <- function(n, p='#') {
  if (n >= 0) {
    for (i in 1:n) {
      cat(p)
    }
  }
  return(NULL)
}
exam5(5, '*')
exam5(5)

# Case2
exam5 <- function(num, ch='#'){
  if(num >= 0){
    print(rep(ch, num))
  }
  return()
}
exam5(5, '*')
exam5(5)

# 문제6
exam6 <- function(p) {
  for (score in p) {
    if (is.na(score)) {
      print('NA는 처리불가')
      next()
    } else if (score >= 0 & score <= 100) {
      if (score >= 85) {
        result = '상'
      } else if (score >= 70) {
        result = '중'
      } else {
        result = '하'
      }
    }
    print(paste(score, '점은', result, '등급입니다.'))
  }
}
exam6(c(80,50,70,66,NA,35))



