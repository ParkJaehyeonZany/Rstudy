library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("http://gs25.gsretail.com/gscvs/ko/products/event-goods")

# 2+1 행사 클릭
btn1css <- "#TWO_TO_ONE"
btn1Page <- remDr$findElements(using = 'css selector', btn1css)
sapply(btn1Page, function(x) {x$clickElement()})
Sys.sleep(3)

#
gs_goods = NULL
endFlag <- FALSE
page <- 1

#
repeat {
  for(index in 1:8) {
    goodsnameCss <- paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(", index, ") > div > p.tit")
    goodsnamenodes <- remDr$findElements(using='css selector',  goodsnameCss)
    goodsname <- sapply(goodsnamenodes, function(x) {x$getElementText()})
    if (length(goodsname) == 0) {
      cat("종료\n")
      endFlag <- TRUE
      break
    }
    goodspriceCss <- paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li:nth-child(", index, ") > div > p.price > span")
    goodspricenodes <- remDr$findElements(using = "css selector", goodspriceCss)
    goodsprice <- sapply(goodspricenodes, function(x) {x$getElementText()})
    goodsprice <- gsub("[,원]","", goodsprice)
    df <- data.frame(goodsname = unlist(goodsname), goodsprice = unlist(goodsprice))
    gs_goods <- rbind(gs_goods, df)
  }
  if(endFlag)
    break;
  
  # next page
  if(page == 10){
    page <- 1
    nextPagecss <- "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next"
  }
  else{
    page <- page+1;
    nextPagecss <- paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a:nth-child(", page, ")")
  }
  nextPageLink<-remDr$findElements(using='css selector', nextPagecss) 
  sapply(nextPageLink, function(x) {x$clickElement()})  
  Sys.sleep(3)
  print(page)
}
View(gs_goods)
write.csv(gs_goods, "output/gs25_twotoone.csv")
