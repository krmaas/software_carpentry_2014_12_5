a <- 4
b <- 1.2
sigSq <- 0.4
x <- runif(40)
ynorm <- a+b*x+rnorm(40,sd=sqrt(0.4))
plot(x,ynorm)
abline(a=a, b=b, col="blue", lwd=2)
dev.print(pdf,"toy.line.pdf")
