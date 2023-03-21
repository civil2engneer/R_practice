# adult data 다운
URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
download.file(URL, destfile = "adult.data")

# housing data 다운
URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data"
download.file(URL, destfile = "housing.data")

# boston data load, library dplyr
boston <- read.table("housing.data")
install.packages('dplyr')
library(dplyr)
glimpse(boston)

names(boston) <- c('crim', 'zn', 'indus', 'chas', 'nox', 'rm', 'age', 'dis', 'rad', 'tax', 'ptratio', 'black', 'lstat', 'medv')
glimpse(boston)

plot(boston)
summary(boston)

# gapminder data
install.packages("gapminder")
library(gapminder)
as.data.frame(gapminder)
gapminder[gapminder$country == 'Korea, Rep.',]

# gapminder data --> excel
write.table(gapminder, "gapminder.data")
getwd() # 파일 저장위치 확인

# 이후 gapminder --> df라 칭함 df의 country가 'Korea, Rep.'인 경우의 인구와 1인당 gdp 추출ㄹ
gapminder[gapminder$country=='Korea, Rep.', c('pop', 'gdpPercap')]

gapminder[gapminder$country=='Korea, Rep.', ]

gapminder[gapminder$year==2007, ]

gapminder[gapminder$country=='Korea, Rep.' & gapminder$year==2007, ]

# 동일 결과
gapminder[1:10,]
head(gapminder, 10)

gapminder[order(gapminder$year, gapminder$country),]
gapminder[, c('pop', 'gdpPercap')]
gapminder[, 1:3]

# gapminderdata --> container 집어 넣기
f2 = gapminder
names(f2)
names(f2)[6] = 'gdp_per_cap'

f2 = gapminder
f2$total_gdp = f2$pop * f2$gdpPercap

#f2 결과 확인
f2

# $gdp_per_cap --> $gdpPercap 수정
median(f2[f2$country == 'Korea, Rep.',]$gdpPercap)
summary(f2)

# dplyr 실습 (%>% 연산자 활용)

# gapminder[gapminder$country=='Korea, Rep.', ] 동일
filter(gapminder, country=='Korea, Rep.')
gapminder %>% filter(country=='Korea, Rep.')


# gapminder[gapminder$year==2007, ] 동일
filter(gapminder, year==2007)
gapminder %>% filter(year==2007)

# gapminder[gapminder$country=='Korea, Rep.' & gapminder$year==2007,] 동일 
filter(gapminder, country=='Korea, Rep.' & year==2007)
gapminder %>% filter(country=='Korea, Rep.' & year==2007)

# 행(관측치)을 정렬하는 arrange()
arrange(gapminder, year, country)
gapminder %>% arrange(year, country)

# 열을 선택하는 select 함수
select(gapminder, pop, gdpPercap)
gapminder %>% select(pop, gdpPercap)

gapminder %>% filter(year == 2007) %>% group_by(continent) %>% summarize(median(lifeExp))

# boston 데이터의 주택 가격이 20달러 이상중에서 도시순환 고속도로 접근 용이지수에 따라  구별하고 학생 선생 비율의 중앙값을 요약한다.
boston %>% filter(medv >=20.0) %>% group_by(rad) %>% summarize(median(ptratio))

# gapminder데이터에서 1인당 gdp가 2000 달러 이상 데이터 중 대륙별로 정리하고 최소 기대수명을 요약한다.
gapminder %>% filter(gdpPercap>=2000.0) %>% group_by(continent) %>% summarise(min(lifeExp))

# 만든 문제
boston %>% filter(chas ==1) %>% group_by(rad) %>% summarize(max(nox))
# boston 데이터에서 찰스강과 인접한 데이터중 접근 용이지수에 따라 구분하고 산화질소 오염도의 최댓값을 요약한다.

# 유의할점은 대륙 필터링할때 문자열 데이터기에 따움표를 잊지 않고 해줘야 한다.
f2 %>% filter(continent=='Asia') %>% group_by(year) %>% summarise(max(lifeExp))
