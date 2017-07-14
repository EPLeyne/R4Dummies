## Chapter 4 (?)
# Creating a vector
baskets.of.Granny <- c(12,4,5,6,9,3)
baskets.of.Geraldine <- c(5,4,2,4,12,9)
# New vector of those values that Granny is better than Geraldine (TRUE/FALSE result)
the.best <- baskets.of.Granny > baskets.of.Geraldine
# which() lists which entries are TRUE
which(the.best)
# Use [] to extract specific entries from the vectors 
baskets.of.Granny[the.best]
# Using the '==' to create vectors 'equal to'
# max() returns the highest value from a vector, min() returns the minimum (TRUE/FALSE)
min.baskets <- baskets.of.Granny==min(baskets.of.Granny)
max.baskets <- baskets.of.Granny==max(baskets.of.Granny)

min.baskets | max.baskets
# sum() of a TRUE/FALSE vector returns how many times the result is TRUE
sum(the.best)
# any() of a TRUE/FALSE vector returns if there are any TRUE results
any(the.best)
# all() of a TRUE/FALSE vector returns if all the results are TRUE
all(the.best)
# cumsum() returns the cumulative sum of a vector
cumsum(baskets.of.Granny)

diff(baskets.of.Granny)
# sum() returns the total sum of a vector
sum(baskets.of.Granny)
baskets.team <- rbind(baskets.of.Granny, baskets.of.Geraldine)

## Character vectors
x <- "Hello world!"
# To check it is a character vector and the number of characters
is.character(x)
nchar(x)
# Another way to enter this is belw, but this changes the nchar() result
x<-c("Hello","world!")
# islands is an internal data set in R to practice
# To look at the structure of a dataset use str()
str(islands)
# Use [] to extract data from the vectors
islands[c("Asia", "Africa", "Antarctica")]
# names() returns the names only and can be used in conjunction with []
names(islands)[1:9]
# Use sort() to sort by a numeric vector
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
# You can do simple calculations using the +,-,* and / symbols.
firstmatrix + 4
# Adding different values to different columns means you need to create a matrix of the values you want to add..
secondmatrix <- matrix(1:3, nrow=3, ncol=4)
firstmatrix + secondmatrix
# This creates the matrix to add 1 to the first row, 2 to the second row and so on. You have to make the matricies you are adding together to match...
firstmatrix + secondmatrix[ ,1:3]   # This will return an error as you are trying to add matricies that don't fit one another
# When adding a vector to a matrix you won't get that error as R will simply recycle that vector through the matrix.
firstmatrix + 1:3
# By default R fills by column, so firstmatrix + 1:3 returns the same as firstmatrix + secondmatrix.

# To calculate the sums and means of rows and columns use...
rowSums(baskets.team)
rowMeans(baskets.team)
colSums(baskets.team)
colMeans(baskets.team)

# To transpose a matrix...
t(firstmatrix)
# This can be done to a vector too, turning it into am matrix...
t(1:10)
# While this may seem trivial, if you are transposing a row from a matrix it will return a row in a matrix instead of a column
t(firstmatrix[2,])

## ARRAYS
# Vectors and matricies are types of a type of object called arrays. Arrays can be thought of as types of vectors with extra dimensions attribute.
# Arrays wih more than 2 dimensions are rare but are useful when representing a time series in 2 dimensions or using multi-way tables.
# Create matricies or arrays using the matrix() or array() functions, and use dim() to change the dimensions.
my.array <- array (1:24, dim=c(3,4,2))
# This creates an array of the numbers 1 to 24 with 3 rows, 4 columns and 2 tables (the three dimensions)
# Notice that the dim() function enters the number of rows first but the data is filled by column first.
# Another (easier) way of doing this is to change the dimensions of an existing vector. This is especially useful if you are working with an existing vector and want to create an array.
my.vector <- 1:24
dim(my.vector) <- c(3,4,2)
# This is identical to my.array, which can be checked...
identical (my.array,my.vector)
# To extract data from an array is the same as from a matrix but with the need to add in the dimension factor.
# For a particular data point..
my.array [2,3,1]
# For a column...
my.array [ ,3,2, drop=FALSE]
# If you don't include the drop=FALSE R will return the easiest result (a vector). By including the drop=FALSE we are telling R to not drop the structure we want.
# The same applies if you are returning 2 rows, without the drop=FALSE R will return a matrix and the rows will be in columns.
# ie. compare..
my.array [2,,] # returns the second rows of the 2 tables as 2 columns in the same matrix
# with..
my.array [2,,,drop=FALSE] # also returns the second rows of the 2 tables, but maintains the structure.

## Combining different types of values in a Data Frame
# Vectors, Matricies and Arrays all have the same type of data, which is rare.
# The data structure that combines different types of data are called 'DATA FRAMES'
## Creating Data Frames from matricies
# Use the as.data.frame function
baskets.df <- as.data.frame(t(baskets.team))  # We are treating Grannys and Geraldine's baskets as separate variables, hence the transpose. See note below.
# In data frames each variable is in a column, so in this example we need to transpose the data. If the matrix already has the variables in columns then there is no need to transpose.
# This method of creating a data frames does not allow data frames with different types of values. If you combine numeric and character data then all vaules will be converted into character.
# Check the structure
str(baskets.df)  # Shows that there are 6 observations of 2 variables ('Granny,'Geraldine')
str(baskets.team)  # The original matrix showed there were 12 observations in a 6:2 matrix.
# As data frames are in the structure of variables in columns, we can use nrow() to get the number of observations.
nrow(baskets.df)
# And the number of variables can be ncol() or length()
length(baskets.df)
## Creating data frames from scratch
# Unlike the first method, this method allows different types of values to be in a data frame.
# Create data frames from vectors.
employee <- c('John Doe', 'Peter Gynn','Jolie Hope')  #Character vector
salary <- c(21000,23400,26800) # Numeric vector
startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14')) # Date vector
# Use data.frame function to create a data frame from those three vectors
employ.data <- data.frame(employee, salary, startdate)
# R will create the data frame with the variables (and column names) with the names of the vectors.
# Check the structure
str(employ.data)
# When you look at the structure you will notice that the employee vector has been changed from Character to Factor. This is the default and can be avoided like so.....
employ.data <- data.frame(employee, salary, startdate, stringsAsFactors = FALSE)   #Now the employee data is kept as character
# In data frames the variables always need a name. You can access the names using colnames() or names()...
names(employ.data)
# To change a varible name...
names(employ.data) [3] <- 'firstday'

## Extracting data from a Data Frame
# You can extract data from a data frame by treating it like a matrix....
baskets.df['3rd', 'Geraldine']
baskets.df[ ,1]
# Or to return a single variable's results then you can use the '$' command. With multiple variables you still need to use the [] command.
baskets.df$Granny
# These return vectors. To return a data frame then you need the drop=FALSE argument
str(baskets.df[ ,1,drop=FALSE])

## Adding data to a Data Frame
# Single Observation using rbind
result <- rbind(baskets.df, c(7,4)) #The multiple arguments added is fine so loing as they ar compatable with the data frame
# To give the new row a name....
baskets.df <- rbind(baskets.df, '7th' = c(7,4))
# Adding a series of new obersvations using rbind()
# To add multiple new observations to a data frame then you need to know the exact names of the variables, including the case.
# First create a new data frame that you will add to the existing one...
new.baskets <- data.frame(Granny=c(3,8),Geraldine=c(9,4))
# Then add the row names (optional, but kind of nessesary if you are adding it to existing data frames.)
rownames(new.baskets) <- c('8th','9th')
# You can also add or change the column names the same way using colnames(), but as the column names must match exactly the existing data frame, this is a much better way to do it....
colnames(new.baskets) <- names(baskets.df)
# Finally, to add the new data frame to the existing data frame...
baskets.df <- rbind(baskets.df, new.baskets)

## Adding variables to a data frame
# To add a single variable...
baskets.of.Gabrielle <- c(11,5,6,7,3,12,4,5,9)
baskets.df$Gabrielle <- baskets.of.Gabrielle
# Addidng multiple variables using cbind()
# Create a new data frame with the new variables
new.df <- data.frame(Gertrude = c(3,5,2,1,NA,3,1,1,4),Guinevere = c(6,9,7,3,3,6,2,10,6))
# Although the row names are different in the new data frame, R will ignore this and use the row names from the first data frame entered in the cbind() argument\
baskets.df <- (cbind(baskets.df, new.df))

## Creating different objects in a list
# Lists are general and flexible types of objects in R. They can be useful to group different types of objects or to carry out operations on a complete set of different objects.
# To create a list of unnamed objects use the list() function
baskets.list <- list(baskets.team, "2016-2017") #This creates a list two elements, the matrix of results and the season.
# The numbers between the [[]] of the results indicates the number of that object in the list.
# To make it a named list instead you indicate the names in the list() function.
baskets.nlist <- list (scores = baskets.team, season = '2016-2017')
## Data frames are just fancy lists, so all the instructions that can be used on lists can laso be used on data frames.
# Accessing elements in a list.
# Use [[]] to access an element...
baskets.list [[1]]
baskets.nlist [['scores']]
# You cannot use logical vectors of negative numbers (to exclude elements) when using [[]]
# Using [] to extract objects form a list is more flexible and can use logical vectors or negative numbers.
baskets.list [-1]
baskets.nlist[names(baskets.nlist)=='season']$season
baskets.nlist['season']
## Changing elements in a list
# Changing the value of an element is fairly easy using [[]], just select the data you want to change and what you want to replace it with.. The folowing scripts will all change the same things....
baskets.nlist[[1]] <- baskets.df
baskets.nlist[['scores']] <- baskets.df
baskets.nlist$scores <- baskets.df
# Using [] is a bit different but you have to assign a list to replace the existing object in the list. To do the same as above you would need to do.....
baskets.nlist [1] <- list(baskets.df)
# Using [] is a bit of an extra step but it is amore flexible as it allows you to change more than one objects at once...
baskets.list[1:2] <- list(baskets.df, '2012-2013')
# Removing elements is just as easy as adding, just assign the objects as NULL
baskets.nlist[[1]] <- NULL
baskets.nlist[['scores']] <- NULL
baskets.nlist$scores <- NULL
# Adding extra elements using indices similar to data frames, All these will do the same thing....
baskets.nlist$players <- c('Granny','Geraldine')
baskets.nlist[['players']] <- c('Granny','Geraldine')
baskets.nlist['players'] <- list(c('Granny','Geraldine'))
# Or to the unnamed list..
baskets.list[[3]] <- c('Granny','Geraldine')
baskets.list[3] <- list(c('Granny','Geraldine')) #This requires you to know exactly the number of elements in a list. If the list already had 3 elements whis command would overwrite it.


## Chapter 8 - Putting the Fun in Functions
# Creating and using functions
# Create a function by sticking scripts together... eg. below expressing decimal numbers as percentages
####### Do the following in a new script file #####
x <- c(0.458, 1.6653, 0.83112)
percent <- round(x*100, digits=1) #This creates the percentage and rounds it to the 1st decimal place
result <- paste(percent, "%", sep="")
print(result)
# Save the script with a new file name (eg. 'pastePercent.R')
# Then you can recall this script in the command console of a different script file....
source('pastePercent.R')
# This script is fine if you just want those 3 numbers all the time, but to make it a function where we can plug in different data then we need to make it a funtion...
####### Do the following in a new script file #####
addPercent <- function(x){    #the function() tells R that what follows is a function. What is in the parenthesis the arguement list of the function, in this case only 1 argument (x)
  percent <- round(x*100, digits=1)  # The {} contains the body of the function, what we want to do to the argument list 
  result <- paste(percent, "%", sep="")
  return(result)  # 
}
# Run this script and then add new numbers to run
source('addPercent.R')
new.numbers <- c(0.8223, 0.02487, 1.62, 0.4)
addPercent(new.numbers)
