# Learning about the dplyr package
gapminder <- read.csv("data/gapfinder_data.csv")
gapminder <- read.csv("gapfinder_data.csv")

#misnamed gapfinder so was not working
gapfinder <- read.csv("data/gapminder_data.csv")

#subset in base R
mean(gapminder[gapminder$continent=="Africa","gdpPercap"])

#dplyr and ggplot are part of the tidyverse

#load our package
library(dplyr)

#select columns
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)

year_country_gdp_africa <- gapminder %>% filter(continent=="Africa") %>%
  select(year,country,gdpPercap)
head(year_country_gdp_africa)

# summarise by groups
gdp_by_continents <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continents

#tipples are super fancy versions of data frames - prints onto console differently

#calculate the average life expectancy per country
year_country_lifeExp <- gapminder %>% select(year,country,lifeExp)

year_country_lifeExp <- gapminder %>% filter(continent=="Africa") %>%
  select(year,country,lifeExp)
head(year_country_lifeExp_africa)

#solution

lifeexp_by_country <- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_life = mean(lifeExp))

#want all rows where mean life is min or equal to mean life usiing filter
lifeexp_by_country %>%  filter(mean_life==min(mean_life))
lifeexp_by_country %>%  filter(mean_life==max(mean_life))

#using
lifeexp_by_country %>% arrange(mean_life)
lifeexp_by_country %>% arrange(desc(mean_life))

#using arrange and head
lifeexp_by_country %>% arrange(mean_life) %>%  head()

#using base R instead
lifeexp_by_country[lifeexp_by_country$mean_life==max(lifeexp_by_country$mean_life),]

#use count to find the number of rows
gapminder %>% 
  filter(year == 2007) %>% 
  count(continent)
unique(gapminder$year)

# perform more than one function inside summarize
gapminder %>% 
  group_by(continent) %>% 
  summarise(
    mean_life = mean(lifeExp),
    se_life = sd(lifeExp)/sqrt(n())
  )
  )

# using mutate
gdp_pop_summary <- gapminder %>% 
  mutate(gdp_billions = gdpPercap*pop/10^9) %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdp_bill = mean(gdp_billions))
head(gdp_pop_summary)  

#R for data science is available through UCSB as pdf

# New section using cmmd shift R ------------------------------------------


# another new section -----------------------------------------------------


