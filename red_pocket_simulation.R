

iteration <- 10000
total <- 1000
person <- 10

mat <- matrix(ncol = person, nrow = iteration)

for (i in 1:iteration) {

    a <- sample.int(total * 100 - 1, person - 1, replace = FALSE)
    a <- sort(a)        
    a <- append(0, a)
    a <- append(a, total * 100)
    a <- a / 100
    
    b <- c()
    
    for (j in 1: person) {
        
        mat[i, j] <- a[j+1] - a[j]
        
    }
    
}

