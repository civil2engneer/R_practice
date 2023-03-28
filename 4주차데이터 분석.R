# 라이브러리 설치
install.packages('dplyr')
library(dplyr)

install.packages("gapminder")
library(gapminder)

install.packages('ggplot2')
library(ggplot2)

install.packages('gridExtra')
library(gridExtra)

# gapminder 데이터에서 2007년 데이터중 대륙별로 기대수명의 중앙값을  요약
gapminder %>%
filter(year == 2007) %>%
group_by(continent) %>%
summarize(median(lifeExp))

# ggplot 활용 그림 그리기
g1 = gapminder %>% ggplot(aes(x=lifeExp)) + geom_histogram()
g2 = gapminder %>% ggplot(aes(x = gdpPercap)) + geom_histogram()
g3 = gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram() + scale_x_log10()
g4 = gapminder %>% ggplot(aes(x=gdpPercap, y= lifeExp)) + geom_point() +scale_x_log10()+ geom_smooth()
grid.arrange(g1,g2,g3,g4,nrow=2,ncol=2)

cor(gapminder$lifeExp, gapminder$gdpPercap)

# diamonds 예제 만들기
diamonds <- diamonds
glimpse(diamonds)


diamonds %>%
filter(price >= 330) %>%
group_by(cut) %>%  
summarise(max(carat))  

diamonds %>%
filter(depth>=60.0) %>%
group_by('clarity') %>%
summarise(median(price))

# 시각화 예제
p1=mpg %>% ggplot(aes(cty,hwy)) + geom_point()
p2=mpg %>% ggplot(aes(cty,hwy)) + geom_jitter()
p3=mpg %>% ggplot(aes(x=cyl))+ geom_histogram()
grid.arrange(p1,p2,p3, nrow=2, ncol=2)

mpg %>% ggplot(aes(class, hwy)) + geom_boxplot() 

