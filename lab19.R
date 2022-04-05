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

map <- leaflet() %>% setView(lng = seoul_lonlat$lon, lat = seoul_lonlat$lat, zoom = 16)  

map %>% addTiles()
