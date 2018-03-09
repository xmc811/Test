

# permutation test for 2-sample mean comparisons (two-tailed)

a <- rnorm(100, mean = 70, sd = 15)
b <- rnorm(100, mean = 80, sd = 15)

n <- length(a)

mix <- sort(append(a, b))

iteration <- 10000000

count <- 0


for (i in 1:iteration) {

    index_new_a <- sample.int(n + length(b), n, replace = FALSE)
    
    new_a <- mix[index_new_a]
    
    mean_new_a <- mean(new_a)
    mean_new_b <- (sum(mix) - sum(new_a)) / (length(mix) - n)
    
    
    if (abs(mean_new_a - mean_new_b) > abs(mean(a) - mean(b))) {
        count <- count + 1
    }

}

p_value <- count / iteration


