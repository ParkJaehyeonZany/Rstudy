# 문제1
str(iris)

# 문제2
x <- 1:5
y <- seq(2,10,2)
df1 <- data.frame(x, y)

df1 <- data.frame(x=1:5, y=seq(2,10,2))
df1

# 문제3
df2 <- data.frame(col1=1:5, col2=letters[1:5], col3=6:10)
df2

# 문제4
제품명 <- c('사과','딸기','수박')
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명,가격,판매량)
df3

# 문제5
  # 과일 가격의 평균
mean(df3$가격)
  # 과일 판매량의 평균
mean(df3$판매량)

# 문제6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
str(df4)
# a
df4$stat <- c(76, 73, 95, 82, 35)
# b
df4$score <- df4$math + df4$stat
# c
df4$grand <- ifelse(df4$score>=150,'A',
                    ifelse(df4$score>=100,'B',
                           ifelse(df4$score>=70,'C','D')))

# 문제7
myemp <- read.csv('data/emp.csv')
str(myemp)

# 문제8
myemp[3:5,]
myemp[c(3,4,5),]

# 문제9
myemp[,-4]

# 문제10
myemp[,2]
myemp[,'ename']
myemp$ename
myemp[,2, drop=F]
myemp[,'ename', drop=FALSE]
myemp[2]
myemp['ename']


# 문제11
myemp[,c(2,6)]
myemp[,c('ename','sal')]
subset(myemp, , c(ename,sal))
subset(myemp, select = c('ename','sal'))

# 문제12
subset(myemp,myemp$job == 'SALESMAN',c('ename','sal','job'))
myemp[myemp$job == 'SALESMAN', c('ename','sal','job')]

# 문제13
subset(myemp,myemp$sal >= 1000 & myemp$sal < 3000, c('ename','sal','deptno'))
myemp[myemp$sal >= 1000 & myemp$sal <= 3000, c('ename','sal','deptno')]

# 문제14
subset(myemp,!myemp$job == 'ANALYST', c('ename','job','sal'))
subset(myemp,myemp$job != 'ANALYST', c('ename','job','sal'))
myemp[myemp$job != 'ANALYST', c('ename','sal','job')]

# 문제15
subset(myemp,myemp$job == 'SALESMAN' | myemp$job == 'ANALYST', c('ename','job'))
myemp[myemp$job == 'SALESMAN' | myemp$job == 'ANALYST', c('ename','job')]

# 문제16
subset(myemp,is.na(myemp$comm), c(2,6))
myemp[is.na(myemp$comm), c('ename','sal')]

# 문제17
myemp[order(myemp$sal),]

# 문제18
nrow(myemp)
ncol(myemp)

dim(myemp)

# 문제19
summary(factor(myemp$deptno))
table(factor(myemp$deptno))

myemp$deptno <- as.factor(myemp$deptno)
summary(myemp$deptno)
table(myemp$deptno)

# 문제20
summary(factor(myemp$job))
table(factor(myemp$job))

myemp$job <- as.factor(myemp$job)
summary(myemp$job)
table(myemp$job)
