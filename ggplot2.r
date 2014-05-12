library(ggplot2)
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

p <- ggplot(gDat, aes(x=gdpPercap, y=lifeExp))
p+geom_point()+scale_x_log10()
#p <- ggplot(gDat, aes(x=log10(gdpPercap), y=lifeExp)) #gives scale in log10
p <- p+scale_x_log10()
p+geom_point(aes(color=continent))

p+geom_point(alpha=1/10,size=5, aes(color=continent))#1/3 means 3 points stacked equals black
p+geom_point(alpha=1/10,size=5)+geom_smooth()
p+geom_point(alpha=1/10,size=5)+geom_smooth(lwd=1.5, se=FALSE)

ggplot(subset(gDat, country=="Zimbabwe"), aes(x=year, y=lifeExp))+geom_line()+geom_point()
ggplot(gDat, aes(x=continent, y=lifeExp))+geom_point()
ggplot(gDat, aes(x=continent, y=lifeExp))+geom_jitter(position=position_jitter(width=0.1))
ggplot(gDat, aes(x=continent, y=lifeExp))+geom_boxplot()+geom_jitter(position=position_jitter(width=0.1), alpha=1/4)

ggplot(gDat, aes(x=lifeExp))+geom_histogram()
ggplot(gDat, aes(x=lifeExp))+geom_density()

table(gDat$continent)
ggplot(gDat, aes(x=continent))+geom_bar()
ggplot(gDat, aes(x=continent))+geom_bar()+coord_flip()
ggplot(gDat, aes(x=continent))+geom_bar(width=0.05)+coord_flip()

p +geom_point()
p +geom_point()+facet_wrap(~continent)

p +geom_point()+facet_wrap(~continent)+geom_smooth(lwd=2, se=FALSE)
ggplot(gDat, aes(x=lifeExp))+geom_histogram()+facet_wrap(~continent)

ggplot(subset(gDat, subset=year==2007),aes(x=continent, y=lifeExp))+geom_jitter(position=position_jitter(width=0.2))

