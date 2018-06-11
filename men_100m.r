library(tidyverse)


raw <- read.delim(file = "~/Desktop/men_100m.txt", header = FALSE, sep = "\t", stringsAsFactors=FALSE)

colnames(raw) <- c("time", "wind", "name", "country", "birth", "race", "location", "date")

raw_na <- filter(raw, date == '')
raw <- filter(raw, date != '')

## data cleaning
raw_na[,7:8] <- raw_na[,6:7]
raw_na[c(1,6),6] <- raw_na[c(1,6),5]
raw_na[c(1,6),5] <- NA

raw_na[4,6] <- NA

raw_na[c(2,3,5,7,8,9,10,11),c(3:6)] <- raw_na[c(2,3,5,7,8,9,10,11),c(2:5)]
raw_na[c(2,3,5,7,8,9,10,11),2] <- NA

raw <- rbind(raw, raw_na)
rm(raw_na)

raw <- arrange(raw, time)

## date formatting
raw <- mutate(raw, birth = paste0(substr(birth,1,6), "19", substr(birth,7,8)))

raw <- mutate(raw, date = as.Date(date, format = "%d.%m.%Y"))
raw <- mutate(raw, birth = as.Date(birth, format = "%d.%m.%Y"))
raw <- mutate(raw, age = as.numeric((date - birth)/365.25)) # dataset complete

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

