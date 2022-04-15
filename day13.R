# [ select() ]
exam %>% select(math)  # math 추출
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외
exam %>% select(-math, -english)  # math, english 제외

# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)
# 가독성 있게 줄 바꾸기
exam %>% 
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head                # 앞부분 6행까지 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출

data(iris) # 아규먼트에 지정된 이름의 객체(데이터셋)를 로드하는 기능
str(iris)
View(iris)
iris %>% pull(Species) # 벡터로 리턴
iris %>% pull(Sepal.Length)
iris %>% pull(Sepal.Length, Species) # 뒤에 있는 아규먼트가 name으로 namedvector로 리턴
iris %>% pull(-1) # 위치 값으로 리턴 가능
iris %>% pull(-5)
iris %>% pull()
iris %>% select(Species)
iris %>% select_if(is.numeric) %>% head
iris %>% select(-Sepal.Length, -Petal.Length) %>% head

# Select column whose name starts with "Petal"
iris %>% select(starts_with("Petal")) %>% head(1)
iris %>% head(1) %>% select(starts_with("Petal"))
iris %>% select(starts_with("petal")) %>% head(1)
iris %>% select(starts_with("petal", ignore.case=F)) %>% head(1)

# Select column whose name ends with "Width"
iris %>% select(ends_with("Width")) %>% head(1)

# Select columns whose names contains "etal"
iris %>% select(contains("etal")) %>% head(1)
iris %>% select(contains(".")) %>% head(1)

# Select columns whose name maches a regular expression
iris %>% select(matches(".t.")) %>% head(1)
iris %>% select(matches("L|W")) %>% head(1)
iris %>% select(matches("\\.")) %>% head(1)
iris %>% select(matches("^P")) %>% head(1)


iris %>% select(one_of("aa", "bb", "Petal.Length", "Petal.Width")) %>% head(5) -> imsi

#[ arrange() ]
# 오름차순으로 정렬하기
exam %>% arrange(math)  # math 오름차순 정렬
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math 내림차순 정렬
# 정렬 기준 변수 여러개 지정
exam %>% arrange(desc(class), desc(math))  # class 및 math 오름차순 정렬
exam %>% arrange(desc(math)) %>% head(1)
exam %>% arrange(desc(math)) %>% head(3)


#[ mutate() ] 파생변수 생성
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출
m#여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수 추가
  head     
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = total/3) %>%   # 총평균 변수 추가
  head 

# 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출

# 전체 요약하기
# [ summarise() ]
exam %>% summarise(n = n()) # n()은 데이터 갯수를 추출하는 함수
exam %>% tally()

exam %>% summarise(mean_math = mean(math))  # math 평균 산출
mean(exam$math)


str(exam %>% summarise(mean_math = mean(math),
                       mean_english = mean(english),
                       mean_science = mean(science))) # 모든 과목의 평균 산출


# 집단별로 요약하기
exam %>%
  group_by(class) %>% summarise(n = n()) 
exam %>%
  group_by(class) %>% tally()   
exam %>% count(class)         # count() is a short-hand for group_by() + tally()
# add_tally() 와 add_count(..) 도 있음

exam %>%
  group_by(class) %>%                # class별로 분리
  summarise(mean_math = mean(math))  # math 평균 산출

exam %>%
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수

#[ 문제 ] 
#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 
#1~5위까지 출력하기
#절차	기능	dplyr 함수
#1	회사별로 분리	group_by()
#2	suv 추출	filter()
#3	통합 연비 변수 생성	mutate()
#4	통합 연비 평균 산출	summarise()
#5	내림차순 정렬	arrange()
#6	1~5위까지 출력	head()

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tdis= (cty+hwy)/2) %>% 
  summarise(mdis=mean(tdis)) %>% 
  arrange(desc(mdis)) %>% 
  head(5)

mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  mutate(tdis= (cty+hwy)/2) %>% 
  summarise(mdis=mean(tdis)) %>% 
  arrange(desc(mdis)) %>% 
  head(5)


# rename() 과 distinct()

myiris <- iris %>% rename(sl="Sepal.Length", sw="Sepal.Width") %>% head

iris %>% select(Species)
iris %>% distinct(Species)
exam %>% select(class, english)
exam %>% distinct(class, english)

# 여러 데이터프레임 합치기

# 학생 1~5번 시험 데이터 생성
(group_a <- data.frame(id = c(1, 2, 3, 4, 5),  test = c(60, 80, 70, 90, 85)))
# 학생 6~10번 시험 데이터 생성
(group_b <- data.frame(id = c(6, 7, 8, 9, 10),  test = c(70, 83, 65, 95, 80)))

bind_rows(group_a, group_b)  
bind_cols(group_a, group_b) 

one <- data.frame(c(x = c(1:1000000), y = c(1:1000000))) 
two <- data.frame(c(x = c(1:1000000), y = c(1:1000000)))
system.time(rbind(one, two)) 
system.time(bind_rows(one, two)) 

library(dplyr)

# 중간고사 데이터 생성
(test1 <- data.frame(no = c(1, 2, 3, 4, 5, 6),  
                     midterm = c(60, 80, 70, 90, 85, 100)))
# 기말고사 데이터 생성
(test2 <- data.frame(no = c(1, 5, 3, 4, 2, 7),  
                     final = c(70, 80, 65, 95, 83, 0)))


inner_join(test1, test2, by = "no")  
left_join(test1, test2, by = "no") 
right_join(test1, test2, by = "no") 
full_join(test1, test2, by = "no")

# join 함수와 merge 함수는 기능은 같지만 join이 수행속도가 더 빠름.
merge(test1, test2) 
merge(test1, test2, all.x = T)
merge(test1, test2, all.y = T)
merge(test1, test2, all = T)

# 다른 데이터 활용해 변수 추가하기
# 반별 담임교사 명단 생성
(exam <- read.csv("data/csv_exam.csv"))
(tname <- data.frame(class = c(1, 2, 3, 4, 5), teacher = c("kim", "lee", "park", "choi", "jung")))
# class 기준 합치기
(exam_new <- left_join(exam, tname, by = "class"))




# 데이터 정제 : 결측치(NA)와 이상치 처리
# 먼저 결측치부터~~~~~~

df <- data.frame(sex = c("M", "F", NA, "M", "F"), 
                 score = c(5, 4, 3, 4, NA))
View(df)
# 결측치 확인하기
is.na(df)         # 결측치 확인
table(is.na(df))  # 결측치 빈도 출력
# 변수별로 결측치 확인하기
table(is.na(df$sex))    # sex 결측치 빈도 출력
table(is.na(df$score))  # score 결측치 빈도 출력
# 결측치 포함된 상태로 분석
mean(df$score)  # 평균 산출
sum(df$score)   # 합계 산출


# 결측치 있는 행 제거하기
library(dplyr) # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거
# 결측치 제외한 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출
# 여러 변수 동시에 결측치 없는 데이터 추출하기
# score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss  
# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출
df_nomiss2
#분석에 필요한 데이터까지 손실 될 가능성 유의
# 함수의 결측치 제외 기능 이용하기 - na.rm = T
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출


#summarise()에서 na.rm = T사용하기
# 결측치 생성
exam <- read.csv("data/csv_exam.csv")            # 데이터 불러오기
table(is.na(exam))
exam[c(3, 8, 15), "math"] <- NA             # 3, 8, 15행의 math에 NA 할당
table(is.na(exam))


#평균 구하기
exam %>% summarise(mean_math = mean(math))             # 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  # 결측치 제외하고 평균 산출
# 다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출
boxplot(exam$math) # 결측치는 제거하고 그려줌
mean(exam$math, na.rm = T)  # 결측치 제외하고 math 평균 산출


# 평균으로 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
table(is.na(exam$math))                               # 결측치 빈도표 생성
sum(is.na(exam$math))
mean(exam$math)  # math 평균 산출



df <- airquality
head(df)
dim(df)
View(df)
is.na(df)
row_na_cnt = apply(df, 1, function(x){sum(is.na(x))})
table(row_na_cnt)
col_na_cnt = apply(df, 2, function(x){sum(is.na(x))})
table(col_na_cnt)

df[is.na(df$Solar.R), "Solar.R"] = mean(df$Solar.R, na.rm = TRUE) 
df[is.na(df$Ozone), "Ozone"] = mean(df$Ozone, na.rm = TRUE) 
View(df)



# install.packages("tidyr") # 추가
library(tidyr)
library(dplyr)

exam <- read.csv("data/csv_exam.csv")            
exam[c(1, 5, 3, 8, 15, 20), "math"] <- NA 
exam

fill(exam, math, .direction = "down") # 바로 위에 데이터의 값을 가져옴
fill(exam, math, .direction = "up") # 바로 아래 데이터의 값을 가져옴
fill(exam, math, .direction = "updown") # 먼저 올려서 채운 다음에 나머지는 내려서 채움.

exam[c(1, 5, 6, 7, 20), "english"] <- NA 
exam

fill(exam, math, english, .direction = "updown")
fill(exam, everything(), .direction = "updown")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%
  fill(math2, .direction = "down")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%
  fill(math2, .direction = "up")

exam %>%
  mutate(math2 = math) %>%
  group_by(class) %>%
  fill(math2, .direction = "downup")

exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(math2, english2, .direction = "downup")

exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(everything(), .direction = "downup")


exam %>%
  mutate(math2 = math, english2 = english) %>%
  group_by(class) %>%
  fill(ends_with("2"), .direction = "downup")



# 날짜 또는 날짜+시간 데이터 셋 만들기
dd <- seq(Sys.Date(),Sys.Date() + 10, "day")
dd
class(dd)
seq(Sys.time(),Sys.time() + 60*60*10, "hour")
seq(Sys.time(),Sys.time() + 60*10, "min")


seq(Sys.Date(), as.Date("2050-12-31"), "10 year")

seq(Sys.Date(), length.out=10, by="year")
seq(Sys.Date(), length.out=10, by="10 year")
seq(Sys.Date(), length.out=10, by="day")
seq(Sys.time(), length.out=10, by="hour")
seq(Sys.time(), length.out=10, by="min")
seq(Sys.time(), length.out=10, by="sec")

data.frame(num=1:9, point=as.POSIXct(c("2022-01-04 09:30:02", "2022-01-04 09:30:04",
                                       "2022-01-04 09:30:06", "2022-01-04 09:30:08", "2022-01-04 09:30:10", 
                                       "2022-01-04 09:30:12", "2022-01-04 09:30:14", "2022-01-04 09:30:16",
                                       "2022-01-04 09:30:18")))

data.frame(num=1:9, point=seq(as.POSIXct("2022-01-04 09:30:02"), length.out=9,by="2 sec"))
data.frame(num=1:9, point=seq(as.POSIXct("2022-01-04 09:30:02"), length.out=9,by="sec"))

info <- data.frame(num=1001:1009, point=seq(as.POSIXct("2022-01-04 09:30:02"), length.out=9,by="2 sec"))
info
str(info)
info[c(1,3,9), "point"] <- NA
info
a<-fill(info, point, .direction = "updown")
plot(a)
str(a)
plot(a$point, a$num)

