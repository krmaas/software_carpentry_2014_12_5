library(plyr)
library(ggplot2)

gDat <- read.delim("gapminderDataFiveYear.txt")

d_ply(gDat, ~ country, function(z) {
  the_country <- z$country[1]
  the_continent <- z$continent[1]
  
  the_filename <- paste0(the_continent, "_", the_country, ".tsv")
  write.table(z, file = the_filename,
              quote = FALSE, sep = "\t", row.names = FALSE)
  
  the_filename <- paste0(the_continent, "_", the_country, ".png")
  ggplot(z, aes(x = year, y = lifeExp)) +
    geom_point() + geom_smooth(se = FALSE, method = "lm") +
    ggtitle(the_country)
  ggsave(the_filename)
})