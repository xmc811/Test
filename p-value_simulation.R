
# To simulate the distribution of p-values

set.seed(10)

genome_size <- 50000

sample_size <- 20

p_values <- c()
t_values <- c()

for (i in 1:genome_size) {
    
    a <- rnorm(sample_size, mean = 80, sd = 10)
    b <- rnorm(sample_size, mean = 80, sd = 10)
    
    pt <- t.test(a, b)
    
    p <- pt[[3]]
    
    t <- pt[[1]]
    
    p_values <- append(p_values, p)
    t_values <- append(t_values, t)
    
}

hist(p_values)
hist(t_values)

