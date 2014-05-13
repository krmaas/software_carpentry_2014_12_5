### apply, built in works with rows/columns of matrices and arrays
### aggregate, built in for groups by factors in single vector
### read 2011 wickham, jorunal of statistical software http://www.jstatsoft.org/v40/i01/paper
### plyr::ddply, groups by factor in data.frame
### plyr::l*ply
### dplyr optimized for large datasets


gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)


## take dataframe
## linear regression of lifeExp on year
## return intercept and slope

lm(lifeExp~year, gDat)
library(ggplot2)
ggplot(gDat, aes(x=year, y=lifeExp))+geom_point()+
  geom_smooth(method="lm")
fit <- lm(lifeExp~I(year - 1952), gDat)
str(fit)  ###scary
coef(fit)

## write function:
## input: a data.frame
## output: the intercept and slope

lm.intercept.slope  <- function(df) {
  fit <- lm(lifeExp~I(year-1952), df)
  return(coef(fit))
}
lm.intercept.slope(gDat)


#create a subset of gDat with one country
#store as object
#apply lm.intercept.slope to it

x <- subset(gDat, country=="Rwanda")
lm.intercept.slope(x)
ggplot(x, aes(x=year, y=lifeExp))+geom_point()+
  geom_smooth(method="lm")

### use ddply to run through all the countries
library(plyr)

country.lE.lm <- ddply(gDat, ~country, lm.intercept.slope)
country.lE.lm

