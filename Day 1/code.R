rm(list = ls())
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

input <- read.delim("input.txt", header = FALSE) 
input <- as.matrix(input)

## Part 1: x + y = 2020
for (i in 1:length(input)) {
  j <- 2020 - input[i]
  n <- which(input == j)
  if (length(n) > 0) stop("puzzle solved!")
}
input[n]
input[i]
input[i] + input[n]
input[i] * input[n]


## Part 2: x + y + z = 2020
for (i in 1:length(input)) {
  x <- input[i]
  yz <- 2020 - x
  rest <- input[-i]
  for (k in 1:length(rest)) {
    y <- rest[k]
    z <- yz - y
    n <- which(rest == z)
    if (length(n) > 0) stop("puzzle solved!")
  }
}

x
y
z
x + y + z
x*y*z
