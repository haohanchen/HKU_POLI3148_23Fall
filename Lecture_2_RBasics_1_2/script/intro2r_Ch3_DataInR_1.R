# Title:        R Basics
# Purpose:      This script perform basic operation on data 1
# Source:       https://intro2r.com/objects-in-r.html
# Author:       Chen Haohan
# Last update:  2023-09-13

# Check data type of an object ----
num <- 2.2
class(num)
## [1] "numeric"

char <- "hello"
class(char)
## [1] "character"

logi <- TRUE
class(logi)
## [1] "logical"

# Question 1: What about vectors?
# Question 2: What about vectors with multiple types?


# Check whether an object belongs to a data type ----
is.numeric(num)
## [1] TRUE

is.character(num)
## [1] FALSE

is.character(char)
## [1] TRUE

is.logical(logi)
## [1] TRUE

# Coerce an object into certain data type ----

# coerce numeric to character
class(num)
## [1] "numeric"
num_char <-  as.character(num)
num_char
## [1] "2.2"
class(num_char)
## [1] "character"

# coerce character to numeric! (PROBLEMATIC)
class(char)
## [1] "character"
char_num <- as.numeric(char)
## Warning: NAs introduced by coercion

# What about coercing a character-type variable that contains number?
