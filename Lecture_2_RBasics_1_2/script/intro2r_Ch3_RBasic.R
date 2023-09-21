# Title:        R Basics
# Purpose:      This script perform basic vector operation
# Source:       https://intro2r.com/objects-in-r.html
# Author:       Chen Haohan
# Last update:  2023-09-13


# Getting started ----

2 + 2
log(1)
exp(1)
sqrt(4)
4^2
pi

# Objects in R ----

my_obj <- 48

my_obj


# Using functions in R ----

## Create a vector ----

my_vec <- c(2, 3, 1, 6, 4, 3, 3, 7)

my_vec

## Basic statistics of the vector ----

mean(my_vec)
var(my_vec)
sd(my_vec)
length(my_vec)

## Store the statistics in a new object ----

vec_mean <- mean(my_vec)
vec_mean

## Create a sequence of integers ----

my_seq <- 1:10
my_seq

my_seq2 <- 10:1
my_seq2

## Create a sequence with customized intervals ----
my_seq3 <- seq(from = 1, to = 5, by = 0.5)
my_seq3

## Create a repetitive sequence ----
my_seq4 <- rep(2, times = 10)
my_seq4

my_seq5 <- rep(1:5, times = 3)
my_seq5

my_seq6 <- rep(1:5, each = 3)
my_seq6

in_vec <- c(3, 1, 10, 7)
my_seq7 <- rep(in_vec, each = 3)
my_seq7

# Remove objects ----

## Remove a specific object ----
rm(my_vec)

## Remove multiple objects ----
rm(vec_mean, my_obj, in_vec)

## Remove ALL objects ----
rm(list = ls())


# Working with vectors ----

my_vec <- c(2, 3, 1, 6, 4, 3, 3, 7)


## Extract elements by positions ----

my_vec[3]     # extract the 3rd value

### Save the 3rd element of vector to a new object ----
val_3 <- my_vec[3]
val_3

### Extract several elements from the vector ----

my_vec[c(1, 5, 6, 8)]
my_vec[3:8]

## Extract elements by conditions ----

my_vec[my_vec > 4]

my_vec > 4

my_vec[c(FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE)]

my_vec[my_vec >= 4]        # values greater or equal to 4

my_vec[my_vec < 4]         # values less than 4

my_vec[my_vec <= 4]        # values less than or equal to 4

my_vec[my_vec == 4]        # values equal to 4

my_vec[my_vec != 4]        # values not equal to 4

## Combine several conditions ----

val26 <- my_vec[my_vec < 6 & my_vec > 2]
val26

val63 <- my_vec[my_vec > 6 | my_vec < 3]
val63

## Replace elements ----

# Replace the 4th element by 500
my_vec[4] <- 500
my_vec

# Replace the 6th and 7th element with 100
my_vec[c(6, 7)] <- 100
my_vec

# Replace element that are less than or equal to 4 with 1000
my_vec[my_vec <= 4] <- 1000
my_vec


## Ordering elements ----

vec_sort <- sort(my_vec)
vec_sort

vec_sort2 <- sort(my_vec, decreasing = TRUE)
vec_sort2

vec_sort3 <- rev(sort(my_vec))
vec_sort3


## Vectorization ----

# create a vector
my_vec2 <- c(3, 5, 7, 1, 9, 20)

# multiply each element by 5
my_vec2 * 5

# create a second vector
my_vec3 <- c(17, 15, 13, 19, 11, 0)

# add both vectors element-wise
my_vec2 + my_vec3

# multiply both vectors element-wise
my_vec2 * my_vec3

# Think: Under what condition the above vector addition and multiplication work?


## Missing data ----

temp  <- c(7.2, NA, 7.1, 6.9, 6.5, 5.8, 5.8, 5.5, NA, 5.5)
temp

mean_temp <- mean(temp)
mean_temp

mean_temp <- mean(temp, na.rm = TRUE)
mean_temp
