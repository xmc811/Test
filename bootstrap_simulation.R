

a <- rnorm(10000, mean = 1, sd = 0.5)
b <- rnorm(10000, mean = 3, sd = 1)
c <- 2 ** a

merged <- append(a, c)

s1 <- sample(merged, 50, replace = FALSE)

alpha <- 0.05

iteration <- 100000

est <- c()

for (i in 1:iteration) {
    
    s2 <- sample(s1, length(s1), replace = TRUE)
    est[i] <- sd(s2)
    
}

quantile(est, c(alpha / 2, 1 - (alpha / 2)))

