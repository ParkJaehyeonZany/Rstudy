library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

library(ggmap)
register_google(key='AIzaSyDy81EbO46BRSnX1DOgg_F84bhsdbku2z4')

library(leaflet)

# 문제1

home <- geocode(enc2utf8("밀양시 창밀로 3530"), source = "google")
msg <- "<strong>Zany</strong>"

map <- leaflet() %>% 
  setView(lng = home$lon, lat = home$lat, zoom = 16) %>% 
  addTiles() %>% 
  addCircles(lng=home$lon, lat=home$lat, color="green", opacity=0.7, weight=7, popup=msg)

saveWidget(widget=map, file="output/lab19_1.html")

# 문제2
library(kormaps2014)
library(dplyr)
library(htmlwidgets)
head(korpop2)
# 1
korpop2 <- rename(korpop2,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)
# korpop2$name <- iconv(korpop2$name, "UTF-8","CP949") # 윈도우만..
seoulmap <- kormap2 %>% filter(startsWith(as.character(code), '11'))
myseoulpop <- korpop2 %>% filter(startsWith(as.character(code), '11'))
# 2
myseoulpop <- rename(myseoulpop, 외국인수="외국인_계_명")
head(myseoulpop)
# 3
myseoulpop$외국인수 <- as.numeric(myseoulpop$외국인수)
# 4
foreigner <- ggChoropleth(data = myseoulpop,    # 지도에 표현할 데이터
                          aes(fill = 외국인수,  # 색깔로 표현할 변수
                              map_id = code,    # 지역 기준 변수
                              tooltip = name),  # 지도 위에 표시할 지역명
                          map = seoulmap,       # 지도 데이터
                          palette="Purples",    # 칼라 팔레트
                          interactive = T)      # 인터랙티브

saveWidget(widget=foreigner, file="output/lab19_2.html")
