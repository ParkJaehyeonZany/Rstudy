url <- 'http://unico2013.dothome.co.kr/crawling/exercise_bs.html'
texts <- read_html(url)


# <h1> 태그의 컨텐츠
nodes <- html_nodes(texts,"h1")


# <a> 태그의 컨텐츠와 href 속성값
a <- html_nodes(texts,"a")
html_attr(a, "href")


# <img> 태그의 src 속성값
img <- html_nodes(texts,"img")
html_attr(img, "src")


# 첫번째 <h2> 태그의 컨텐츠
html_text(html_nodes(texts, "h2:nth-of-type(1)"))
html_text(html_nodes(texts, "h2:nth-child(9)"))


# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(texts,"ul > [style$=green]")) # css 선택자를 잘 이용해야함


# 두번째 <h2> 태그의 컨텐츠
html_text(html_nodes(texts, "h2:nth-of-type(2)"))


# <ol> 태그의 모든 자식 태그들의 컨텐츠
html_text(html_nodes(texts, "ol > li"))
html_text(html_nodes(texts, "ol > *")) # *는 all을 의미함


# <table> 태그의 모든 자손 태그들의 컨텐츠
html_text(html_nodes(texts, "table *")) 
  # >는 바로 밑 자손에게만 적용 그래서 여기는 *만 적용


# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(texts, "tr.name"))


# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(texts, "td#target"))

