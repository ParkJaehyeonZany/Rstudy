# 1단계
emp <- read.csv("data/emp.csv")
View(emp)
# 1
emp %>% filter(job == "MANAGER")
# 2
emp %>% select(empno, ename, sal)
# 3
emp %>% select(-empno)
# 4
emp %>% select(ename, sal)
# 5
emp %>% count(job)
# 6
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename,sal,deptno)
# 7
emp %>% filter(job != "ANALYST") %>% select(ename, job, sal)
# 8 
emp %>% filter(job == "SALESMAN" | job == "ANALYST") %>% select(ename, job)
# 9
emp %>% group_by(deptno) %>% summarise(sum_sal = sum(sal))
# 10
emp %>% arrange(sal)
# 11
emp %>% arrange(desc(sal)) %>% head(1)
# 12
empnew <- emp %>% rename(salary="sal", commrate="comm")
str(empnew)
# 13
emp %>% count(deptno) %>% arrange(desc(deptno)) %>% head(1) %>% select(deptno)
# 14
emp %>% mutate(enamelength = nchar(ename)) %>% arrange(enamelength) %>% select(ename, enamelength)
# 15
emp %>% filter(!is.na(comm)) %>% count()

# 2단계

# 16

mpg <- as.data.frame(ggplot2::mpg)
#1
str(mpg)
#2
dim(mpg)
#3
head(mpg, 10)
#4
tail(mpg, 10)
#5
View(mpg)
#6
summary(mpg) # mpg를 열 단위로 요약한다
#7
mpg %>% count(manufacturer) # 데이터 프레임
mpg %>% group_by(manufacturer) %>% tally() # 티블

#8
mpg %>% group_by(manufacturer) %>% count(model) # 데이터 프레임
mpg %>% group_by(manufacturer, model) %>% count() # 데이터 프레임
mpg %>% count(manufacturer, model) # 티블

# 17

#1
mpg %>% rename(city="cty", highway="hwy") %>% str()
#2
mpg %>% rename(city="cty", highway="hwy") %>% head()

# 18

#1
displ_max4 <- mpg %>% filter(displ <= 4) %>% summarise(hwy_mean = mean(hwy))
displ_min5 <- mpg %>% filter(displ >= 5) %>% summarise(hwy_mean = mean(hwy))

if (displ_min5 < displ_max4) {
  cat("배기량이 4이하인 자동차가 고속도로 연비가 평균적으로 더 높다.")
} else {
  cat("배기량이 5이상인 자동차가 고속도로 연비가 평균적으로 더 높다.")
}

#2
mpg %>% 
  filter(manufacturer == "audi" | manufacturer == "toyota") %>% 
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty))
#3
mpg %>%
  filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda") %>%
  summarise(mean_hwy = mean(hwy))
mpg %>% filter(manufacturer %in% c("chevorolet","ford","honda")) %>% 
  summarise(mean_cty = mean(hwy))

# 19
#1
mpg3 <- mpg %>% select(class, cty)
head(mpg3)

#2
suv <-mpg3 %>% filter(class == "suv") %>% summarise(mean_cty = mean(cty))
compact <- mpg3 %>% filter(class == "compact") %>% summarise(mean_cty = mean(cty))
if (suv > compact) {
  cat("suv class의 도시연비가 더 높다.")
} else {
  cat("compact class의 도시연비가 더 높다.")
}

mpg3 %>% 
  filter(class=="suv" | class=="compact") %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# 20
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)
