
library(tidyverse)

# build a normal q-q plot

n <- 2000

a <- rexp(n, rate = 1)
b <- rnorm(n, mean = 0, sd = 1)
c <- runif(n, min = -5, max = 5)


t_quantile_a <- pnorm(a, mean = mean(a), sd = sd(a))
s_quantile_a <- rank(a)/n

t_quantile_b <- pnorm(b, mean = mean(b), sd = sd(b))
s_quantile_b <- rank(b)/n

t_quantile_c <- pnorm(c, mean = mean(c), sd = sd(c))
s_quantile_c <- rank(c)/n

df_a <- data.frame(t_quantile_a, s_quantile_a, rep('A',n), stringsAsFactors = F)

df_b <- data.frame(t_quantile_b, s_quantile_b, rep('B',n), stringsAsFactors = F)

df_c <- data.frame(t_quantile_c, s_quantile_c, rep('C',n), stringsAsFactors = F)

coln <- c("theoretical_quantile","sample_quantile","batch")
                   
colnames(df_a) <- coln
colnames(df_b) <- coln
colnames(df_c) <- coln

df <- rbind(df_a, df_b, df_c)

pic <- ggplot(df, aes(x = theoretical_quantile, y = sample_quantile)) +
        geom_point(aes(col = batch), size = 1) +
        geom_abline(intercept = 0, slope = 1, size = 0.5)

plot(pic)
