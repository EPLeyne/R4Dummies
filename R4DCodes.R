baskets.of.Granny <- c(12,4,5,6,9,3)

baskets.of.Geraldine <- c(5,4,2,4,12,9)

the.best <- baskets.of.Granny > baskets.of.Geraldine

which(the.best)

baskets.of.Granny[the.best]

min.baskets<-baskets.of.Granny==min(baskets.of.Granny)

max.baskets <- baskets.of.Granny==max(baskets.of.Granny)

min.baskets

max.baskets

min.baskets | max.baskets

sum(the.best)

any(the.best)

all(the.best)

cumsum(baskets.of.Granny)

diff(baskets.of.Granny)

sum(baskets.of.Granny)

x <- "Hello world!"
is.character(x)
nchar(x)

x<-c("Hello","world!")

str(islands)
islands[c("Asia", "Africa", "Antarctica")]
names(islands)[1:9]
names(sort(islands, decreasing=TRUE)[1:6])

month.days <- c(31,28,31,30,31,30,31,31,30,31,30,31)
names(month.days) <- month.name
month.days
names (month.days[month.days==31])

pangram <- "The quick brown fox jumps over the lazy dog"
strsplit (pangram, " ")
words <- (strsplit (pangram, " "))[[1]]
unique(tolower(words))
paste("The","quick","brown","fox")
paste (words, collapse=" ")
sort(letters, decreasing=TRUE)
sort(words)


head(state.names)
head (state.name)
head(substr(state.name, start=3, stop=6))
grep("New", state.name)
state.name[29]
state.name[grep("New",state.name)]

arrgh <- "A wolf in cheap clothing"
gsub("cheap", "sheep's", arrgh)
library(stringr)

directions <- c("North", "East", "South","South") 
factor(directions)
factor(directions, levels= c("North", "East", "South", "West"), labels=c("N", "E", "S","W"))
directions.factor <- factor(directions)
as.character(directions.factor)
as.numeric(directions.factor)

str(state.region)
levels(state.region)
levels(state.region) <- c("NE", "S", "NC", "W")
head(state.region)
