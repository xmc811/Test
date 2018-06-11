library(tidyverse)

# dataset complete

topMean <- function(vector, n) {
        mean(sort(vector)[1:n])
}

famous <- names(sort(tapply(raw$time, raw$name, topMean, n = 10))[1:5])

data.famous <- raw %>% 
                filter(name %in% famous)


pic1 <- ggplot(data.famous, aes(x = date, y = time)) +
        geom_point(aes(col = name), size = 0.5) +
        geom_smooth(aes(col = name), method = "loess", se = F, span = 0.9) +
        scale_colour_brewer(palette="Set1") +
        scale_x_date(date_breaks = "2 years", date_labels = "%Y",
                     limit = as.Date(c('2003-01-01',NA)))

plot(pic1)


sort(tapply(raw$time, raw$name, topMean, n = 10))

