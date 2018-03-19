
## This is the experimental code for poisson distribution

set.seed(7)

a <- rpois(10000, 1)
b <- rpois(10000, 1)

sum(a > b)
sum(a == b)
sum(a < b)

## 34.5% : 31% : 34.5% (0 - 4)

set.seed(7)

a <- rpois(10000, 0.5)
b <- rpois(10000, 2)

sum(a > b)
sum(a == b)
sum(a < b)

## 8.5% : 18.5% : 73% (25 - 39)

set.seed(7)

a <- rpois(10000, 3/4)
b <- rpois(10000, 4/3)

sum(a > b)
sum(a == b)
sum(a < b)

## 21% : 28% : 51% (5 - 14)

set.seed(7)

a <- rpois(10000, 3/5)
b <- rpois(10000, 5/3)

sum(a > b)
sum(a == b)
sum(a < b)

## 13% : 22% : 63% (15 - 24)

set.seed(7)

a <- rpois(10000, 0.4)
b <- rpois(10000, 2.5)

sum(a > b)
sum(a == b)
sum(a < b)

## 4.5% : 12.5% : 83% (40 - 59)

set.seed(7)

a <- rpois(10000, 1/3)
b <- rpois(10000, 3)

sum(a > b)
sum(a == b)
sum(a < b)

## 2.5% : 7.9% : 89.5% (60 - 79)

set.seed(7)

a <- rpois(10000, 2/7)
b <- rpois(10000, 7/2)

sum(a > b)
sum(a == b)
sum(a < b)

## 1.4% : 5% : 93.6% (80 - 99)

set.seed(7)

a <- rpois(10000, 0.25)
b <- rpois(10000, 4)

sum(a > b)
sum(a == b)
sum(a < b)

## 0.7% : 3.1% : 96.2% (100 - 139)

set.seed(7)

a <- rpois(10000, 0.2)
b <- rpois(10000, 5)

sum(a > b)
sum(a == b)
sum(a < b)

## 0.2% : 1.2% : 98.6% (140 - 179)

set.seed(7)

a <- rpois(10000, 1/6)
b <- rpois(10000, 6)

sum(a > b)
sum(a == b)
sum(a < b)

## 0.06% : 0.41% : 99.53% (>179)

set.seed(7)

a <- rpois(10000, 1/2.3)
b <- rpois(10000, 2.3)

sum(a > b)
sum(a == b)
sum(a < b)

