# MEAN-MEDIAN program - Chapter 5
chap05 <-function (){

# Change InitialData vector values for other number sets
InitialData <- c(2,4,5,9,15,19)
Imn <- mean(InitialData)
Imd <- median(InitialData)
cat("\n","Initial Data Set","\n",InitialData,"\n","Mean = ",Imn,"Median =",Imd,"\n")
cat("\n")

# Select value to add to Initial Data set values
addvalue <- 10
# Select value to multiple to Initial Data set values
multvalue <- 5
# Select value to replace largest value in Initial Data
replace <- 1

AddData <- round(InitialData + addvalue,digits=2)
cat("Added",addvalue,"to the Initial data")
cat("\n","Added Value Data","\n","Mean = ",mean(AddData),"Median =",median(AddData),"\n")
cat("\n")

MultData <- round(InitialData * multvalue,digits=2)
cat("Multiplied",multvalue,"to the Initial data")
cat("\n","Multiplied Value Data","\n","Mean = ",mean(MultData),"Median =",median(MultData),"\n")
cat("\n")

ReplaceData <- round(c(InitialData[1],InitialData[2],InitialData[3],InitialData[4],InitialData[5],replace),digits=2)
cat("Replaced Largest Value",InitialData[6],"in the Initial data with",replace)
cat("\n","Replaced Value Data","\n","Mean = ",mean(ReplaceData),"Median =",median(ReplaceData),"\n")
}
chap05()
