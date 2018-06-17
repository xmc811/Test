

n <- 100000

lim1 <- c(0.5, 0.5, 0.6, 0.6, 0.85, 0.5)
lim2 <- c(0.8, 0.8, 0.85, 0.85, 0.95, 0.8)

result <- matrix(rep(0, 4 * n), nrow = 4, ncol = n)

for (i in 1:n) {
        
        team <- rep(0,4)
        
        m <- runif(6, min = 0, max = 1)
        
        if (m[1] < lim1[1]) {
               team[1] <- team[1] + 3
        } else if (m[1] > lim2[1]) {
                team[2] <- team[2] + 3
        } else {
                team[1] <- team[1] + 1
                team[2] <- team[2] + 1
        }
        
        if (m[2] < lim1[2]) {
                team[3] <- team[3] + 3
        } else if (m[2] > lim2[2]) {
                team[4] <- team[4] + 3
        } else {
                team[3] <- team[3] + 1
                team[4] <- team[4] + 1
        }
        
        if (m[3] < lim1[3]) {
                team[1] <- team[1] + 3
        } else if (m[3] > lim2[3]) {
                team[3] <- team[3] + 3
        } else {
                team[1] <- team[1] + 1
                team[3] <- team[3] + 1
        }
        
        if (m[4] < lim1[4]) {
                team[2] <- team[2] + 3
        } else if (m[4] > lim2[4]) {
                team[4] <- team[4] + 3
        } else {
                team[2] <- team[2] + 1
                team[4] <- team[4] + 1
        }
        
        if (m[5] < lim1[5]) {
                team[1] <- team[1] + 3
        } else if (m[5] > lim2[5]) {
                team[4] <- team[4] + 3
        } else {
                team[1] <- team[1] + 1
                team[4] <- team[4] + 1
        }
        
        if (m[6] < lim1[6]) {
                team[2] <- team[2] + 3
        } else if (m[6] > lim2[6]) {
                team[3] <- team[3] + 3
        } else {
                team[2] <- team[2] + 1
                team[3] <- team[3] + 1
        }
        
        list <- sort(team, decreasing = TRUE)
        for (k in 1:4) {
                result[k, i] <- list[k]
        }
        
}



