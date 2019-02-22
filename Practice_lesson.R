#practic for lesson
#friday, february 22, 2019

library("ggplot2")
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
view(gapminder)
View(gapminder)

#data subsetting
#looking at row 1, column 1
gapminder[1,1]

#look at row 1
gapminder[1,]

#preview top few lines
head(gapminder)

#preview bottom few lines
tail(gapminder)

#let's look at the middle
gapminder[900:905, ]

#call ggplot function to create new plot, GLOBAL option
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()
library(ggplot2)
