library(RSelenium)
library(XML)

# 문제 1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("맛집")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>
text <- gsub("&[A-Za-z]+t;", "", text) # &.+t; --> &at;, &abct;, &lt;, &lllt; ... &lt;, &gt;, &quot;, 
#text[81]
text

# 문제2
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No)
url
doc <- xmlParse(url, encoding="UTF-8")
doc
busNm <- xpathSApply(doc, "//busRouteNm", xmlValue)
busId <- xpathSApply(doc, "//busRouteId", xmlValue)
busLen <- xpathSApply(doc, "//length", xmlValue)
busSt <- xpathSApply(doc, "//stStationNm", xmlValue)
bused <- xpathSApply(doc, "//edStationNm", xmlValue)
busterm <- xpathSApply(doc, "//term", xmlValue)

cat("[", busNm, "번 버스정보]", "\n", "노선ID : ", busId, "\n", "노선길이 : ",
    busLen, "\n", "기점 : ", busSt, "\n", "종점 : ", bused, "\n", "배차간격 : ", busterm)

# 문제3
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text

# 고속도로 공공데이터 포털 Open API - JSON 응답 처리

library(jsonlite)
library(httr)
url <- 'https://data.ex.co.kr/openapi/restinfo/restWeatherList?key=4062158448&type=json&sdate=20210821&stdHour=10'
url
response <- GET(url)
json_data <- content(response, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
class(json_obj)
df <- data.frame(json_obj)
View(df)
df_new <- df[c('list.unitName', 'list.unitCode', 'list.routeName', 'list.addr', 'list.weatherContents', 'list.tempValue')]
View(df_new)

