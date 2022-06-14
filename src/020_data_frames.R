# Intro to R programming 2022-06 SWD1b
# Exploring data frames

source(file = "src/010_data_structures.R")

cats

age <- c(2, 3, 5)

cats <- cbind(cats, age)

nrow(cats)

length(age)

## to add a new row we use a list

newRow <- list("rainbow", 3.3, TRUE, 9)

cats <- rbind(cats, newRow)

cats

cats[-4, ]

cats[, -4]

cats2 <- cats[-4, ]

cats[-c(3,4), ]

cats[c(-3, -4),]

cats[-3:-4, ]

cats[, c("likes_string")]

## dropping a column by name

names(cats)

names(cats) %in% "likes_string"

string_mask <- names(cats) %in% "likes_string"

cats[, !string_mask]

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", 
              destfile = "data/gapminder_data.csv")

gapminder <- read.csv(file = "data/gapminder_data.csv")

str(gapminder)

summary(gapminder)

head(gapminder)

tail(gapminder)

x <- c(5.4, 6.5, 7.8, 9.0)
names(x) <- c("a","b","c","d")

x <- c(a = 1, a = 2, a = 3)

x[!names(x) %in% c("a","c")]



## subsetting dataframes

gapminder[["pop"]]

head(gapminder[["pop"]])

head(gapminder$pop)

gapminder[1:3,]

gapminder[3,]

gapminder[(gapminder$year == 1952) |
            (gapminder$continent == "Asia"),]
