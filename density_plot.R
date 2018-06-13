
library(tidyverse)

n <- 201

x_upper <- 2
x_lower <- -2

y_upper <- 7
y_lower <- 0

x <- seq(from = x_lower, to = x_upper, by = (x_upper - x_lower)/(n-1))
y <- seq(from = y_lower, to = y_upper, by = (y_upper - y_lower)/(n-1))

tib_x <- rep(x, times = n)
tib_y <- rep(y, each = n)

m <- tibble(x = tib_x, y = tib_y, 
            density = dnorm(x, mean = 1, sd = 1) * dgamma(y, shape = 3, rate = 1))


pic <- ggplot(m, aes(x, y, z = density)) + 
        geom_raster(aes(fill = density)) + 
        geom_contour(colour = "white", size = 0.1)
plot(pic)
