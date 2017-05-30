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

baskets.team <- rbind(baskets.of.Granny, baskets.of.Geraldine)

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



##Chapter 6 Dates in R

## Create a date using the As.Date command, using the default YYYY-MM-DD
xd <- as.Date ("1974-09-12")
## To find out what day of the week it is...
weekdays(xd)
## To find out the date 7 days later...
xd+7
## To create a vector of that date plus the next 6 days...
xd + 0:6
## A more flexible way to create a vecotr of dates is the seq command.
## in the seq command you must specify at least 3 of the 'from', 'by', 'to' and 'length.out' arguments. 'by' is very flexible and can be followed by days, weeks, months.
seq(xd, by="2 months", length.out = 6)
## In the above example 'xd' is a date and is the 'from' argument, and it returns a vector of the dates every 2 months from that date 6 times.
## You can also get R to report on the months ad quarters...
months (xd)
quarters (xd)


## In the case of Dates that are not in the default format we can tell R the format it is in and it will change it for us...
as.Date("27 July 2012", format="%d %B %Y")
## Each different element requires a different code depending on the format it is in (eg. month in full word or abbreviation, YY or YYYY, etc.)
## The helpfile for that is ?strptime
?strptime
as.Date("27/7/12", format="%d/%m/%y")

## Time, there are two ways to insert time into R, POSIXct records it as the number of seconds since 01/01/1970. 
## POSIXlt stores the date as a numer of vectors for the year, month, day, hours minutes.
## You can also present time and dates as you want to see them. eg..
apollo <- "July 20, 1969, 20:17:39"  #The exact time (UTC) Apollo 11 landed on the moon
apollo.fmt <- "%B %d, %Y, %H:%M:%S" # Telling R the format of the date
xtc <- as.POSIXct(apollo, format=apollo.fmt, tz="UTC")  #New vector that gives the date as R understands
format(xtc, "%d/%m/%y")    #Returns the date of the moon landing in the DD/MM/YY format
format (xtc, "%S minutes past %I %p, on %d %B %Y")
## Using the date and time we can add and subtract from the time.
## As the system uses seconds since 1970 it is useful to know that there are 86400 seconds in a day.
24*60*60
## So to see the time 1 weeks after the moon landing...
xtc + 7*86400
## or 7 days after...
xtc - 7*86400
## or you can do the full sum.
xtc + 7*24*60*60
xtc + 3*60*60      #Three hours later

## You can also compare dates using the less than or greater than signs,
## Sys.time() returns the current time
Sys.time()
Sys.time() < xtc   #answers if the current time is less than (ie. before) the moon landing (FALSE)
dec.start <- as.POSIXct("1950-01-01")
dec <- seq(dec.start, by="10 years",length.out = 4)
dec    #Returns 4 dates at the start of each decade from 1950
dec > xtc
## To extract elements within a date the date should first be in th POSIXlt format
xlc <- as.POSIXlt(xtc)
xlc
#Then..
xlc$year
xlc$mon


## Chapter 7 - More dimensions

## Use matrix() to create a matrix with the arguments being the values and the number of columns to create.
firstmatrix <- matrix(1:12, ncol=4)
# You can also specify the number of row using nrow=, you don't have to do both nrow and ncol, just 1 will do.
# The matrix created will fill by column unless speciifed in the argument
firstmatrix <- matrix(1:12, ncol=4, byrow=TRUE)
# You can look at the properties of the matrix in the usual fashion...
str(firstmatrix)
dim(firstmatrix)
length(firstmatrix)

## You can use cbind to combine data together to create matrices...
cbind(1:3, 4:6, matrix(7:12, ncol=2))
## In this example you are combining 2 vectors (1:3 and 4:6) with a 2x3 matrix with the values 7:12

## Extracting data from a matrix
## To extract from a certain row and column use the []
firstmatrix [1:2, 2:3]
# Note that while we are taking rows 1 and 2 and column 2 and 3, the indicies of the new matrix do not match the indices of the old matrix.
## To get whole rows or columns from a matrix you simply don't specify the other dimension...
firstmatrix [2:3,]
## To drop a complete row and/or column use the -ve...
firstmatrix [-2,-3]
# However this can only be used to drop whole rows and columns
