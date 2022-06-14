# Intro to R programming 2022-06 SWD1b
# Data structures

cats <- data.frame(coat = c("calico","black","tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

write.csv(cats, file = "data/feline.csv", row.names = FALSE)

rm(cats)

cats <- read.csv(file = "data/feline.csv")

cats$coat

paste("My cats coat is",cats$coat)

cats$weight * 10

cats$weight + cats$likes_string

# creating a vector

# this will create a vector containing 3 FALSEs
my_vector <- vector(length = 3)

my_vector2 <- vector(mode = "character", length = 3)

my_vector2

str(my_vector2)

## type coercion

my.vec <- c(1, 2, 3, "4")

my.vec

my.vec <- as.numeric(my.vec)

# coercing 0s and 1s to logical type
cats$likes_string <- as.logical(cats$likes_string)

cats

# factors

coats <- c("tabby","tortioseshell", "rainbow", "tabby", "black")

coats

CATegories <- factor(coats)

CATegories

str(CATegories)

typeof(coats)
typeof(CATegories)

# List

list_example <- list(1, "a", TRUE, 9i)

list_example

another_list <- list(title = "numbers",
                     numbers = 1:10,
                     data =TRUE)

another_list

another_list$numbers

# Matrix

my_matrix <- matrix(0, ncol = 3, nrow = 4)

my_matrix

my_matrix[3,]

# challenge 3

cats[1]
cats[[1]]
cats$coat
cats["coat"]
cats[1,1]
cats[1, ]
cats[, 1]
cats[ , ]

## challenge 5

my_matrix <- matrix(1:50, ncol = 5, nrow = 10)

my_matrix

?matrix

my_matrix_byrow <- matrix(1:50, ncol = 5, nrow = 10, byrow=TRUE)

my_matrix_byrow
