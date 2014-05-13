#calc difference between max and min, lifeExp, pop, gdpPercap

life.range <- (max(gDat$lifeExp)-min(gDat$lifeExp))
?range
x <- range(data=gDat, lifeExp)

with(gDat,diff(range(lifeExp)))

x <- gDat
y <- "lifeExp"
with(x, diff(range(y)))
gDat$country[which.min(gDat$lifeExp)]

#lets package that into a function

max.minus.min <- function(x)diff(range(x))
max.minus.min(gDat$lifeExp)
max.minus.min(gDat$gdpPercap)
max.minus.min(runif(1000))
max.minus.min(gDat$country)

# get to know the quantile()function
#use lifeExp as variable

?quantile
quantile(gDat$lifeExp, 0.25)
quantile(gDat$lifeExp, 0.75)
quantile(gDat$lifeExp, probs=c(0.05, .1))
quantile(gDat$lifeExp, probs=seq(0,1,0.1))


# use quantile to get 0.25 and 0.75 quantiles
# store as object
# take difference

min.l <- quantile(gDat$lifeExp, probs=0.25)
max.l <- quantile(gDat$lifeExp, probs=0.75)
max.l-min.l

#upgrade max.minus.min <- function(x){
# return(max(x)-min(x))
# }
#

min.q <- 0.25
max.q <- 0.75

diff.quantile <- function(x) quantile(x, probs=max.q)-
  quantile(x, probs=min.q)

diff.quantile(gDat$lifeExp)


diff.quantile <- function(x){
  diff(range(quantile(x, probs=b)))
}
b <- c(0.2, 0.75)
diff.quantile(gDat$lifeExp)

#jenny's solution

quantile_diff <- function(x, probs=c(0,1)) {  #probs= gives it defaults
  the_quantiles <- quantile(x, probs = probs)
  return(max(the_quantiles) - min(the_quantiles))
}

quantile_diff(gDat$lifeExp, probs = c(0.25, 0.75))
quantile_diff(gDat$lifeExp, probs = c(0.5, 0.7))

quantile_diff(gDat$lifeExp)


## could add last argument "..."  which allows your function to take any argument even if it's not defined in your function, it'll be passed to other functions within
