# 실습1

searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
  
query <- URLencode("맛집")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_type" = "application/xml",
                            "X-Naver-Client-Id" = Client_ID, "X-Naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")              # <- xmlParse()
blog.masjib <- xpathSApply(doc2, "//item/description", xmlValue)
blog.masjib <- gsub("</?b>", "", blog.masjib)
blog.masjib
write(blog.masjib, "./output/naverblog.txt")

# 실습2

API_key <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No)
url
doc <- xmlParse(url, encoding="UTF-8")
busID <- xpathSApply(doc, "//itemList/busRouteId", xmlValue)
buskm <- xpathSApply(doc, "//itemList/length", xmlValue)
busStart <- xpathSApply(doc, "//itemList/stStationNm", xmlValue)
busEnd <- xpathSApply(doc, "//itemList/edStationNm", xmlValue)
busterm <- xpathSApply(doc, "//itemList/term", xmlValue)
cat("[ 360번 버스 정보 ]", "\n", "노선ID :", busID, "\n", "노선길이 :", buskm, "\n",
    "기점 :", busStart, "\n", "종점 :", busEnd, "\n", "배차간격 :", busterm)


# 실습3

searchUrl <- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
jsondoc <- GET(url, add_headers("Content_type" = "application/json",
                                "X-Naver-Client-Id" = Client_ID, "X-Naver-Client-Secret" = Client_Secret))
json.data <- content(jsondoc, type="text", encoding = "UTF-8")
json.obj <- fromJSON(json.data)
str(json.obj)
# CASE 1
json.df <- data.frame(json.obj)
json.newsdf <- json.df["items.title"]
json.newsdf <- gsub("</?b>", "", json.newsdf)
json.newsdf <- gsub("&[a-z]+;", "", json.newsdf)
write(json.newsdf, "output/navernews.txt")
# CASE 2
newsv <- json.obj$items$title
newsv <- gsub("</?b>", "", newsv)
newsv <- gsub("&[a-z]+;", "", newsv)
write(newsv, "output/nevernews2.txt")



