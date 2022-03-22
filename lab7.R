# 문제1
countEvenOdd <- function(num) {
  even <- 0
  odd <- 0
  if (!is.numeric(num)) {
    return()
  } else {
    for (i in num) {
      if (i%%2 == 0) {
        even <- even + 1
      } else {
        odd <- odd + 1
      }
    }
    return(list(even,odd))
  }
}

countEvenOdd(c(1,2,3,4,5))
countEvenOdd(1:10)
countEvenOdd(c('asd',1,2,3))

# 문제2
vmSum <- function(num) {
  if (!is.vector(num)) {
    return('벡터만 전달하숑!')
  } else if (!is.numeric(num)) {
    print('숫자 벡터를 전달하숑!')
    return(0)
  } else {
    result <- sum(num)
    return(result)
  }
}

vmSum(c(1,2,3,4,5))
vmSum(1:10)
vmSum(c('asd',1,2,3))
vmSum(matrix)

# 문제3
vmSum2 <- function(v) {
  if (!is.vector(v)) {
    stop('벡터만 전달하숑!')
  } else if (!is.numeric(v)) {
    warning('숫자 벡터를 전달하숑!')
    return(0)
  } else {
    return(sum(v))
  }
}
  
vmSum2(c(1,2,3,4,5))
vmSum2(1:10)
vmSum2(c('asd',1,2,3))
vmSum2(matrix)

# 문제4
mySum <- function(v) {
  oddSum <- 0
  evenSum <- 0
  if (is.null(v)) {
    return()
  } else if (!is.vector(v)) {
    stop('벡터만 처리 가능!!')
  } else if (any(is.na(v))) {
    warning('NA를 최저값으로 변경하여 처리함!!')
    v[is.na(v)] <- min(v, na.rm = T)
  }
  oddSum <- sum(v[seq(from=1, to=length(v), by=2)])
  evenSum <- sum(v[seq(from=2, to=length(v), by=2)])
  return(list(evenSum, oddSum))
}

mySum(array(1:10))
mySum(c(19,1,NA,5,4,NA,11))
mySum(1:10)
mySum(NULL)

# 문제5
myExpr <- function(x) {
  if(!is.function(x)) {
    stop('수행 안할거임!!')
  } 
  num <- sample(1:45,6)
  return(x(num))
}

myExpr(min)
myExpr(max)
myExpr(sum)
myExpr(mean)

# 문제6
createVector1 <- function(...) {
  data <- c(...)
  if (is.null(data)) {
    return()
  } else if (any(is.na(data))) {
    return(NA)
  } else {
    return(data)
  }
}

createVector1(1:20)
createVector1(1,2,3,4,5)
createVector1(LETTERS, 1:10)
createVector1(TRUE)
createVector1(NA)
createVector1(NULL)
createVector1()
createVector1(1,'a string', TRUE)
createVector1(1,'a string', TRUE, NA)

# 문제7
creatVector2 <- function(...) {
  data <- c(...)
  if (is.null(data)) {
    return()
  } else {
    for (i in data) {
      if (is.character(i)) {
        char.vec <- c(char.vec, i)
      } else if (is.numeric(i)) {
        num.vec <- c(num.vec, i)
      } else if (is.logical(i)) {
        bool.vec <- c(bool.vec, i)
      }
    }
    return(list(char.vec, num.vec, bool.vec))
  }
}

createVector2()
createVector2("안녕", 1, TRUE, 2, 3, "끝", "end")
createVector2("안녕", 1, 2, 3, "끝", "end", F)
