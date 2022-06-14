# Intro to R programming 2022-06 SWD1b
# Using ggplot2 to make publication quality figures

install.packages(c("ggplot2"))

library(ggplot2)

gapminder <- read.csv(file = "data/gapminder_data.csv")

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       color = continent,
                                       by=country)) +
  geom_line() +
  geom_point()

# controlling aesthetics at the layer level
ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp,
                                       by=country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point(mapping = aes(color = "blue"))

## transformations

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 2, color = "red")

## multi panel figures

americas <- gapminder[gapminder$continent == "Americas",]
head(americas)

ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line(color = "red") + 
  facet_wrap(~ country) + 
  theme(axis.text.x = element_text(angle = 45)) 

ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + 
  facet_wrap(~ country) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    x = "Year",             # x axis title
    y = "Life expectancy",  # y axis title
    title = "Figure 1",     # figure title
    color = "Continent"     # legend title
  )

lifeExp_plot <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + 
  facet_wrap(~ country) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    x = "Year",             # x axis title
    y = "Life expectancy",  # y axis title
    title = "Figure 1",     # figure title
    color = "Continent"     # legend title
  )

## saving our plot

ggsave(filename = "figures/lifeExp.png", plot = lifeExp_plot,
       width = 16, height = 12, units = "cm", dpi = 300)





