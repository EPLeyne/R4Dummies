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
## To drop a single entry is a little more complicated and you need to treat it like a vector....
# Create an object returning the numer of rows
nr <- nrow(firstmatrix)
# Then create a variable to identify the element we want to remove (in this case the second element of the third column)
id <- nr*2+2   #ie. (3+3) (number of rows) + 2 (the second element), the 8th element in the vector
# Then return the vector with that element removed
firstmatrix[-id]
# This can all be acheieved in one line...
firstmatrix[-(2 * nrow(firstmatrix) + 2)]
## To drop multiple columns or rows is the same as dropping individual rows or columns but using the concanate function....
firstmatrix[-c(1,3), ,drop=FALSE]
# Without the 'drop=FALSE' command R will return the simplest result (ie. a vector). The 'drop=FALSE' command instructs R to not drop the matrix.
# If the expected result is more than 1 row or column then the 'drop=FALSE' command is unnessesary as R will keep the matrix structure.

## Replacing values in a matrix.
# To replace a single value, simply select the object you want to change and what you will change it with.
firstmatrix [3,2] <- 4  #This replaces the object R3C2 with a 4
firstmatrix [2, ] <- c(1,3) #Replaces the objects in R2 with 1,3,1,3 (remembering thet R will continue to fill with the objects given until finished)
# You can even replace a subset of values with another matrix or vector...
firstmatrix[1:2, 3:4] <- c(8,4,2,1)  #This creates a subset of R1-R2 _AND_ C3-C4 (ie 1,3, 2,3, 1,4, 2,4) and replaces it with a vector of 8,4,2,1
# R reads the vector column-wise by default, so in this example the new vector will be added to the matrix by column. To enter it by row you first have to reconstruct the matrix with the argument byrows=TRUE, then add the new vector.

## Naming the Rows and Columns of a Matrix.
# The rbind() function creates the row or column names from the two vectors. In an existing matrix you can use rownames() and colnames()
rownames(baskets.team) <- c('Granny', "Geraldine")
colnames(baskets.team) <- c('1st','2nd','3rd','4th','5th','6th')
# To make a change to a specific name....
colnames(baskets.team)[3] <- 'Third'
# To remove column or row names set them to NULL
colnames(baskets.team) <- NULL
# To see the names of the Rows and Columns of a matrix use dimnames()
dimnnames(baskets.team)
# Like before you can extract rows or columns, but you can use the names of the rows and columns to do it.
baskets.team [ , c("2nd","5th")]
baskets.team ["Granny", ]
# In this case you will notice that the Row name is gone as it is now a vector named "Granny"

## Calculating with Matrices
