# 라이브러리 설치
install.packages('dplyr')
library(dplyr)

install.packages("gapminder")
library(gapminder)

install.packages('ggplot2')
library(ggplot2)

install.packages('gridExtra')
library(gridExtra)

# 한 수량향 변수 그래프 (histogram)
glimpse(gapminder)

p1= gapminder %>% ggplot(aes(x=pop)) + geom_histogram()
p2= gapminder %>% ggplot(aes(x=lifeExp)) + geom_histogram()
grid.arrange(p1,p2,nrow=2)

# diamonds histogram 
glimpse(diamonds)

d1= diamonds %>% ggplot(aes(x=price)) + geom_histogram()
d2 = diamonds %>% ggplot(aes(x=carat)) + geom_histogram()
grid.arrange(d1,d2, nrow=2)

# 한 범주형 변수
diamonds %>% ggplot(aes(cut)) + geom_bar()

# 위 데이터를 원형 그래프로 표현
diamonds %>%
group_by(cut) %>% 
tally() %>%  
mutate(pct=round(n/sum(n)*100,1))  

diamonds %>% ggplot(aes(x=factor(1),fill=factor(cut))) + geom_bar() + coord_polar(theta="y")

#  연습1
diamonds %>%
group_by(color) %>%  
tally() %>%  
mutate(pct=round(n/sum(n)*100,1))  

# 연습2
diamonds %>%
group_by(clarity) %>%
tally() %>%
mutate(pct=round(n/sum(n)*100, 1))

# 두 수량형 변수
diamonds %>%
ggplot(aes(carat, price))+ geom_point()

diamonds %>% ggplot(aes(carat, price)) + geom_jitter()

p1 = diamonds %>% ggplot(aes(carat, price)) + geom_point()
p2 = diamonds %>% ggplot(aes(carat, price)) + geom_point(alpha=.01)
p3 = mpg %>% ggplot(aes(cyl, hwy)) + geom_point()
p4 = mpg %>% ggplot(aes(cyl, hwy)) + geom_jitter()
grid.arrange(p1,p2,p3,p4,nrow=2,ncol=2)

# 연습 1
d1 = diamonds %>% ggplot(aes(depth, price)) + geom_jitter()
d2 = diamonds %>% ggplot(aes(x, y)) + geom_point()
grid.arrange(d1,d2,nrow=2)

# boxplot 
mpg %>% ggplot(aes(class, hwy)) + geom_boxplot() 
diamonds %>% ggplot(aes(cut, price)) + geom_boxplot()

# +a
p1 = mpg %>% ggplot(aes(class, hwy)) + geom_jitter(col='gray') + geom_boxplot(alpha=.5)
p2 = mpg %>% mutate(class=reorder(class, hwy, median)) %>% ggplot(aes(class, hwy)) +
  geom_jitter(col='gray') +geom_boxplot(alpha=.5)
p3 = mpg %>% mutate(class=factor(class, levels=c("2seater", "subcompact", "compact",
                                                 "midsize","minivan","suv", "pickup"))) %>% ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5)
p4 = mpg %>% mutate(class=factor(class, levels=c("2seater", "subcompact", "compact",
                                                 "midsize","minivan","suv", "pickup"))) %>% ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5) + coord_flip()
grid.arrange(p1,p2,p3,p4,nrow=2,ncol=2)


# 두 범주형 변수
glimpse(data.frame(Titanic))
par(mfrow=c(1,2)) 
mosaicplot(Titanic, main = "Survial on the Titanic")
mosaicplot(Titanic, main = "Survial on the Titanic", color = TRUE)

t2=data.frame(Titanic)
t2 %>% group_by(Sex) %>% summarize(n=sum(Freq), survivors = sum(ifelse(Survived=="Yes", Freq,
                                                                       0))) %>% mutate(rate_survival = survivors/n)
t2 %>% group_by(Class) %>% summarise(n=sum(Freq), survivors=sum(ifelse(Survived=="Yes", Freq,
                                                                       0)))
t2 %>% group_by(Age) %>% summarise(n=sum(Freq), survivors=sum(ifelse(Survived=="Yes", Freq,
                                                                       0)))


glimpse(mpg)

#연습
p2 = mpg %>% mutate(class=reorder(class, hwy, median)) %>% ggplot(aes(class, hwy)) +
  geom_jitter(col='gray') +geom_boxplot(alpha=.5)

m1 = mpg %>% ggplot(aes(trans, hwy)) + geom_jitter(col='gray')+geom_boxplot()
m2 = mpg %>% ggplot(aes(trans, cty)) + geom_jitter(col='gray')+geom_boxplot()
m3 = mpg %>% ggplot(aes(model, hwy)) + geom_jitter(col='gray')+geom_boxplot()
m4 = mpg %>% ggplot(aes(model, cty)) + geom_jitter(col='gray')+geom_boxplot()
grid.arrange(m1,m2,m3,m4,nrow=2,ncol=2)
