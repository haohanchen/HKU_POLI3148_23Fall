# Title:        R Basics
# Purpose:      This script perform basic operation on data 2
# Source:       https://intro2r.com/objects-in-r.html
# Author:       Chen Haohan
# Last update:  2023-09-13


# Matrix ----

my_mat <- matrix(1:16, nrow = 4, byrow = TRUE)
my_mat

##      [,1] [,2] [,3] [,4]
## [1,]    1    2    3    4
## [2,]    5    6    7    8
## [3,]    9   10   11   12
## [4,]   13   14   15   16

# what if
# Change: nrow = 2
# Change: byrow = FALSE


## Set row and column names ----

rownames(my_mat) <- c("A", "B", "C", "D")
colnames(my_mat) <- c("a", "b", "c", "d")
my_mat
##    a  b  c  d
## A  1  2  3  4
## B  5  6  7  8
## C  9 10 11 12
## D 13 14 15 16


## Transpose a matrix ----

my_mat_t <- t(my_mat)
my_mat_t
##   A B  C  D
## a 1 5  9 13
## b 2 6 10 14
## c 3 7 11 15
## d 4 8 12 16

## Get the diagonal elements ----

my_mat_diag <- diag(my_mat)
my_mat_diag
## [1]  1  6 11 16


## Addition and multiplication ----

mat.1 <- matrix(c(2, 0, 1, 1), nrow = 2)    # notice that the matrix has been filled 
mat.1                                     # column-wise by default
##      [,1] [,2]
## [1,]    2    1
## [2,]    0    1

mat.2 <- matrix(c(1, 1, 0, 2), nrow = 2)
mat.2
##      [,1] [,2]
## [1,]    1    0
## [2,]    1    2

mat.1 + mat.2           # matrix addition
##      [,1] [,2]
## [1,]    3    1
## [2,]    1    3

mat.1 * mat.2           # element by element products
##      [,1] [,2]
## [1,]    2    0
## [2,]    0    2

mat.1 %*% mat.2         # matrix multiplication
##      [,1] [,2]
## [1,]    3    2
## [2,]    1    2


# Array ----

my_array <- array(1:16, dim = c(2, 4, 2))
my_array
## , , 1
## 
##      [,1] [,2] [,3] [,4]
## [1,]    1    3    5    7
## [2,]    2    4    6    8
## 
## , , 2
## 
##      [,1] [,2] [,3] [,4]
## [1,]    9   11   13   15
## [2,]   10   12   14   16

# You need not worry too much about this type.
# You will almost never use it.


# List ----

list_1 <- list(c("black", "yellow", "orange"),
               c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
               matrix(1:6, nrow = 3))
list_1

# Extract elements of a list
list_1[[1]]
list_1[[2]]
list_1[[3]]

# You can also give names to a list's element
list_2 <- list(color = c("black", "yellow", "orange"),
               tf = c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE),
               a_matrix = matrix(1:6, nrow = 3))
list_2

list_2$color
list_2$tf
list_2$a_matrix


# Data frames (OUR MOST IMPORTANT) ----

rm(list=ls())

p.height <- c(180, 155, 160, 167, 181)
p.weight <- c(65, 50, 52, 58, 70)
p.names <- c("Joanna", "Charlotte", "Helen", "Karen", "Amy")

dataf <- data.frame(height = p.height, weight = p.weight, names = p.names)
dataf

##   height weight     names
## 1    180     65    Joanna
## 2    155     50 Charlotte
## 3    160     52     Helen
## 4    167     58     Karen
## 5    181     70       Amy

# Understand the basic units of data frames
class(dataf)
typeof(dataf) # Look, data frame is a special type of list


# Get columns (variables) of a data frame
dataf$height
dataf$weight
dataf$names

# Get columns by their positions
dataf[, 1]
dataf[, 2]
dataf[, 3]

# Get rows by their positions
dataf[1, ]
dataf[2, ]
dataf[3, ]

# Get to specific cell using positions
dataf[1, 1]


# Get basic summary statistics of a data frame
summary(dataf)

summary(dataf$height)
summary(dataf$names)

table(dataf$names)
