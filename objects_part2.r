set.seed(1)
(x <- round(rnorm(8), 2))
names(x) <- letters[1:8]
str(x)
names(x)
x[4]
x[x<0]
which(x<0)

(y <- 1:3)
(z <- 3:7)

y+z

x
#recycling happens, could be useful i.e. pull out every other line
x[c(TRUE,FALSE)]
x["b"]
