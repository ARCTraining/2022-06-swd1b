# Intro to R programming 2022-06 SWD1b
# Using dplyr for data manipulation

install.packages(c("dplyr"))

library(dplyr)

gapminder <- read.csv(file = "data/gapminder_data.csv")

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])

# select()

year_country_gdp <- select(gapminder, year, country, gdpPercap)

year_country_gdp <- gapminder %>% select(year, country, gdpPercap)

year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

## group_by and summarize

str(gapminder)

str(gapminder %>% group_by(continent))

gapminder %>% 
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

# group_by multiple columns

gdp_percontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))

gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap))


gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)


gapminder %>% 
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))
  
# if we wanted to create new variables/columns on the fly
# we use mutate()

gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpbillion = mean(gdp_billion),
            sd_gdpbillion = sd(gdp_billion))




  

