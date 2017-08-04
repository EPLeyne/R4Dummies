x <- c(0.458, 1.6653, 0.83112)
percent <- round(x*100, digits=1) #This creates the percentage and rounds it to the 1st decimal place
result <- paste(percent, "%", sep="")
print(result)