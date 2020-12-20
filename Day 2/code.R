rm(list = ls())
library(tidyverse)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

input <- read_delim("input.txt", delim = ":", col_names = FALSE) 
input <- input %>% 
  separate(X1, c("num", "letter"), sep = " ") %>%
  separate(num, c("min", "max"))
input <- input %>% rename(password = X2)
input <- input %>% 
  mutate(n = str_count(password, letter),
         min = as.numeric(min),
         max = as.numeric(max),
         valid = (n >= min & n <= max))
sum(input$valid)


input <- input %>%
  transmute(first = min, second = max, letter, password)
input <- input %>%
  mutate(password = str_trim(password),
         letter = str_trim(letter),
         first_letter = str_sub(password, first, first),
         second_letter = str_sub(password, second, second),
         first_valid = letter == first_letter,
         second_valid = letter == second_letter,
         valid = first_valid + second_valid == 1)
sum(input$valid)
