
library(gtools)

n <- 8

mat <- permutations(n, n, c(1:n))

check_queen <- function(list) {
        
        k <- length(list)
        
        for (i in 1:k) {
                for (j in 1:k) {
                        
                        if (i != j) {
                                if (abs(i-j)==abs(list[i]-list[j])) {
                                        return(FALSE)
                                }
                        }
                        
                }
                
                
        }
        return(TRUE)
}

a <- 0
b <- 0

for (i in 1:nrow(mat)) {
        
        if(check_queen(mat[i,]) == TRUE) {
                a <- a + 1
                # print(mat[i,])
        } else {
                b <- b + 1
        }
}

print(a)
print(b)

