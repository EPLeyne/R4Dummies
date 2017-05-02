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
