# Title:        R Basics
# Purpose:      This script use R to perform basic analysis
# Author:       Chen Haohan
# Last update:  2023-09-14
# Memo:         Code in line 9 not working yet.


# 2.1 Getting started ----

2 + 2
log(1)
log10(1)
exp(1)
sqrt(4)

4^2

pi

# 2.2 Objects in R ----

## Numeric object ----

my_obj <- 48
my_obj <- 36

my_obj
print(my_obj)

ChenHaohan <- 111

# No leading number
# No space
8my_obj <- 48 # WRONG
my obj <- 48

# "." are allowed, but not recommended
my.obj <- 48

# Give informative names
gdp_growth_china <- 10


## Character objects ----

obj_character <- "R is cool"
obj_character_2 <- 'R is cool'

obj_character_3 <- "R's cool"


# Remove objects ----

# Remove a single object
rm(my_obj)

# Remove all the objects from the environment
rm(list = ls())

# 2.3 Vector ----

## Basic functions applied to vectors ----

my_vec <- c(2, 3, 1, 6, 4, 3, 3, 7)

my_vec

mean(my_vec)
var(my_vec)
sd(my_vec)

length(my_vec)

## Create sequences ----

my_seq <- 1:10
my_seq_revers <- 10:1

my_seq_advanced <- seq(from = 1, to = 5, by = 0.5)

my_seq_advanced <- seq(from = 0, to = 3, by = 0.3)
my_seq_advanced

## Create repetition ----

my_seq_rep <- rep(2, times = 10)
my_seq_rep

my_seq_rep <- rep(1:5, times = 10)
my_seq_rep

# Missing values ----

temp <- c(1, 2, 3, NA)
temp

# NA is the indicator of missing values in R
mean(temp)
mean(temp, na.rm = TRUE)
# na.rm stands for NA remove

# Getting Help ----

?mean


# Chapter 3: Data in R ----

## Data types ----

rm(list = ls())

### Numeric ----

obj_numeric <- 4.3

class(obj_numeric)
typeof(obj_numeric)

is.numeric(obj_numeric)

### Integer ----

obj_numeric_2 <- 4L

class(obj_numeric_2)
typeof(obj_numeric_2)

is.integer(obj_numeric_2)


### Logical ----

obj_logical <- TRUE
obj_logical <- T

obj_logical <- FALSE
obj_logical <- F

is.logical(obj_logical)

### Character ----

obj_character <- "R is cool"

is.character(obj_character)


### Coersion ----

obj_to_change <- c("1", "3", "missing", "4", "5")

mean(obj_to_change)

obj_changed <- as.numeric(obj_to_change)
obj_changed


# List ----

list_1 <- list(
  c("black", "orange", "yellow"),
  c(T, F),
  matrix(1:6, nrow = 3)
)

list_1

list_1[[2]]

list_2 <- list(
  color = c("black", "orange", "yellow"),
  truth = c(T, F),
  mat = matrix(1:6, nrow = 3)
)

list_2

list_2$color

list_3 <- list(
  color = c("black", "orange", "yellow"),
  truth = c(T, F, T)
)

as.data.frame(list_3)


# Data Frame ----

p.height <- c(180, 155, 160, 167, 181)
p.weight <- c(65, 60, 52, 58, 70)
p.names <- c("Joanna", "Charlotte", "Helen", "karen", "Amy")

dataf <- data.frame(height = p.height, 
                    weight = p.weight, 
                    names = p.names)

summary(dataf)
names(dataf)
dim(dataf)

summary(dataf$height)
summary(dataf$weight)

summary(dataf$names)
table(dataf$names)

## Get to specific locations of a data frame

### Row 1
dataf[1, ]

### Column 2
dataf[, 2]

### Cell at row 1, column 2
dataf[1, 2]
