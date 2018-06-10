# load libraries

library(tidyverse)
library(gapminder)
library(ggrepel)
library(ggpubr)
library(gridExtra)
library(grid)

# subset data

data1 <- gapminder %>%
                filter(year == 2007)

data2 <- gapminder %>%
                filter(year == 1952)

data3 <- gapminder %>%
                filter(year == 1972)

data4 <- gapminder %>%
                filter(year == 1992)


pic1 <- ggplot(data1, aes(y = lifeExp, x = gdpPercap)) +
        geom_point(aes(col = continent)) + 
        geom_smooth(method = "loess", span = 0.8) +
        scale_colour_brewer(palette="Set1") +
        # geom_encircle(data = subset(data1, (gdpPercap > 5000 & lifeExp <60)|(gdpPercap > 4000 & lifeExp <45)), expand = 0.05, size = 1.5, s_shape = 0.1) +
        geom_text_repel(aes(label = ifelse((gdpPercap > 5000 & lifeExp <60)|(gdpPercap > 4000 & lifeExp <50), as.character(country), '')),
                      box.padding   = 0.35, 
                      point.padding = 0.5,
                      segment.color = 'grey50',
                      direction = "y",
                      xlim = c(15000, NA),
                      size = 3.6) +
        # guides(col = F) +
        ggtitle("2007") +
        xlab("GDP per capita ($)") +
        ylab("Life Expectancy (years)") +
        theme(plot.title = element_text(size = 10),
              axis.title=element_text(size=10))


pic2 <- ggplot(data2, aes(y = lifeExp, x = gdpPercap)) +
        geom_point(aes(col = continent)) + 
        xlim(c(NA,15000)) +
        geom_smooth(method = "loess", span = 0.8) +
        scale_colour_brewer(palette="Set1") +
        # geom_encircle(data = subset(data2, (gdpPercap > 5000 & lifeExp <58)|(gdpPercap > 3000 & lifeExp <40)), expand = 0.05, size = 1.5, s_shape = 0.1) +
        geom_text_repel(aes(label = ifelse((gdpPercap > 4700 & lifeExp <55.9)|(gdpPercap > 2500 & lifeExp <40), as.character(country), '')),
                        box.padding   = 0.35, 
                        point.padding = 0.5,
                        segment.color = 'grey50',
                        direction = "x",
                        nudge_y = 2,
                        nudge_x = 2,
                        # xlim = c(11000, NA),
                        size = 3.6) +
        guides(col = F) +
        ggtitle("1952") +
        xlab("GDP per capita ($)") +
        ylab("Life Expectancy (years)") +
        theme(plot.title = element_text(size = 10),
              axis.title=element_text(size=10))

pic3 <- ggplot(data3, aes(y = lifeExp, x = gdpPercap)) +
        geom_point(aes(col = continent)) + 
        xlim(c(NA,27500)) +
        geom_smooth(method = "loess", span = 0.8) +
        scale_colour_brewer(palette="Set1") +
        # geom_encircle(data = subset(data2, (gdpPercap > 5000 & lifeExp <58)|(gdpPercap > 3000 & lifeExp <40)), expand = 0.05, size = 1.5, s_shape = 0.1) +
        geom_text_repel(aes(label = ifelse((gdpPercap > 9000 & lifeExp <65)|(gdpPercap > 5000 & lifeExp <55), as.character(country), '')),
                        box.padding   = 0.35, 
                        point.padding = 0.5,
                        segment.color = 'grey50',
                        direction = "x",
                        nudge_y = 2,
                        nudge_x = 2,
                        # xlim = c(11000, NA),
                        size = 3.6) +
        guides(col = F) +
        ggtitle("1972") +
        xlab("GDP per capita ($)") +
        ylab("Life Expectancy (years)") +
        theme(plot.title = element_text(size = 10),
              axis.title=element_text(size=10))

pic4 <- ggplot(data4, aes(y = lifeExp, x = gdpPercap)) +
        geom_point(aes(col = continent)) + 
        # xlim(c(NA,15000)) +
        geom_smooth(method = "loess", span = 0.8) +
        scale_colour_brewer(palette="Set1") +
        # geom_encircle(data = subset(data2, (gdpPercap > 5000 & lifeExp <58)|(gdpPercap > 3000 & lifeExp <40)), expand = 0.05, size = 1.5, s_shape = 0.1) +
        geom_text_repel(aes(label = ifelse((gdpPercap > 12000 & lifeExp <70)|(gdpPercap > 0 & lifeExp <35), as.character(country), '')),
                        box.padding   = 0.35, 
                        point.padding = 0.5,
                        segment.color = 'grey50',
                        direction = "x",
                        nudge_y = 2,
                        nudge_x = 2,
                        # xlim = c(11000, NA),
                        size = 3.6) +
        guides(col = F) +
        ggtitle("1992") +
        xlab("GDP per capita ($)") +
        ylab("Life Expectancy (years)") +
        theme(plot.title = element_text(size = 10),
              axis.title=element_text(size=10))


title1 <- textGrob("Countries with abnormal GDPPC/LE relationship", gp=gpar(fontsize = 15, font = 7))

common.legend <- get_legend(pic1 + theme(legend.position="bottom"))
        
grid.arrange(pic2, pic3, pic4, pic1 + guides(col = F), ncol = 2, nrow = 2, top = title1, bottom = common.legend)

