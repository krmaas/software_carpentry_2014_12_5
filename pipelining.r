tinyDat <- subset(gDat, 
                  country %in% c("Cambodia", "Rwanda", "Poland")&
                    year>1995)
tinyDat  ### this still has all countries as the factor potential
tinyDat <- droplevels(tinyDat)


library(ggplot2)
ggplot(tinyDat,
       aes(x = year, y = lifeExp, group = country))+
  geom_line(aes(color = country))

tinyDat$country <- with(tinyDat, reorder(country, lifeExp))
write.table(tinyDat, "tinyDat.tsv", quote=FALSE, row.names=FALSE, sep='\t')
rm(tinyDat)
tinyDat <- read.delim("tinyDat.tsv")
str(tinyDat)

## save R objects/functions/etc
saveRDS(tinyDat, "tinyDat.rds")
