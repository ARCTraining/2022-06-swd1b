# Intro to R programming 2022-06 SWD1b
# control flow

# if statement
x <- 8

if (x >= 10) {
  print("x is greater than or equal to 10")
} else if (x > 5) {
  print("x is greater than 5, but less than 10")
} else {
  print("x is less than 5")
}

# if() statement is looking for a logical type TRUE, FALSE

x <- 4 == 3

if (x) {
  print("4 equal 3")
} else {
  print("4 does not equal 3")
}

## tip: ifelse()

y <- -3

ifelse(y < 0, "y is a negative number", "y is either a positive number or zero")

## repeating operations

for(i in 1:10){
  print("hello world")
}


for(i in 1:5){
  for(j in c("a","b","c","d","e")){
    print(paste(i,j))
  }
}

# growing a vector using a loop
# is a bit slow
output_vector <- c()

for(i in 1:5){
  for(j in c("a","b","c","d","e")){
    temp_output <- paste(i, j)
    output_vector <- c(output_vector, temp_output)
  }
}

output_vector

## while loop

z <- 1

while(z > 0.1) {
  z <- runif(1)
  cat(z, "\n")
}



