
# A/B testing 

a <- 46
b <- 14

# Chi-square test of goodness-of-fit

x <- c(a, b)

chisq.test(x)$p.value

# Permutation test (binomial test)

2 * pbinom(min(a,b), size = a + b, prob = 0.5)


# More than 2 choices

y <- c(8, 21, 18, 33)

chisq.test(y)$p.value

# Multinomial test

library(XNomial)

multi_p <- 1 / length(y)

xmulti(y, rep.int(multi_p, length(y)), statName = "Prob")

# Post-hoc tests

k <- combn(c(1:length(y)), m = 2)

result_list <- c()
pair_list <- c()

for (i in 1:ncol(k)) {
    
    index <- k[,i]
    
    data_a <- y[index[1]]
    data_b <- y[index[2]]
    
    result <- binom.test(c(data_a, data_b))$p.value
    pair <- paste(LETTERS[index[1]], LETTERS[index[2]], sep = "_")
    
    result_list <- append(result_list, result)
    pair_list <- append(pair_list, pair)
}

adj_p_value_list <- p.adjust(result_list, method = 'holm')

p_value_list <- matrix(adj_p_value_list, ncol = 1, dimnames = list(pair_list, c('P-values')))





