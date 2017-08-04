addPercent <- function(x){    #the function() tells R that what follows is a function. What is in the parenthesis the arguement list of the function, in this case only 1 argument (x)
  percent <- round(x*100, digits=1)  # The {} contains the body of the function, what we want to do to the argument list 
  result <- paste(percent, "%", sep="")
  return(result)
 }