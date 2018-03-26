

# To simulate the winner's curse scenario

set.seed(10)

iteration <- 10000

n <- 10

effect_list <- c()
p_value_list <- c()

true_effect <- 1
true_sd <- 1

alpha_level <- 0.05

for (i in 1:iteration) {
    
    a <- rnorm(n, mean = true_effect, sd = true_sd)
    b <- rnorm(n, mean = 0, sd = true_sd)
    
    effect <- mean(a) - mean(b)
    p_value <- t.test(a, b)[['p.value']]
    
    effect_list[i] <- effect
    p_value_list[i] <- p_value
    
}

effect_select <- effect_list[p_value_list < alpha_level]
p_value_select <- p_value_list[p_value_list < alpha_level]

plot(effect_select, p_value_select)

sum(effect_select > true_effect) / length(effect_select)
