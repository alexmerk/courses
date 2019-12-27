# TCHEBYCHEFF program - Chapter 5

chap05 <- function() {

# Change Kvals vector for different K values
# Change SampleSize for different sample sizes
# Change distType to either "Uniform", "Normal", "Exponential", or "Bimodal"

Kvals = c(1.5,2.0,2.5,3.0)
SampleSize = 50
distType = "Uniform"

outputMatrix = matrix(0,length(Kvals),3,dimnames=list(paste("K =",format(Kvals,digits=2)),c("Interval","% Obs in Interval","Cheby. Lower Bound")))

if (distType == "Uniform")      {invisible(mySample <- runif(SampleSize,1,10))}
if (distType == "Normal")       {invisible(mySample <- rnorm(SampleSize,0,1))}
if (distType == "Exponential")  {invisible(mySample <- rexp(SampleSize,1))}
if (distType == "Bimodal") {invisible(mySample <- c(rnorm(as.integer(SampleSize/2),.5,.5),rnorm(SampleSize-as.integer(SampleSize/2),1.5,.5)))}
               
sampleStdDev = sqrt(var(mySample))
sampleMean = mean(mySample) 

for(i in 1:length(Kvals)) {
        outputMatrix[i,1] = paste(format(round(sampleMean-Kvals[i]*sampleStdDev,digits=2),digits=2),"to",format(round(sampleMean+Kvals[i]*sampleStdDev,digits=2),digits=2))
       outputMatrix[i,2] <- round((sum(abs(mySample-sampleMean)<=Kvals[i]*sampleStdDev)/length(mySample))*100,digits=0)
        outputMatrix[i,3] = round((1-(1/Kvals[i])^2)*100,digits=0)
}

result = data.frame(c(1.5,2.0,2.5,3.0),outputMatrix)
names(result) = c("K  ",  " Interval","  % Obs", "  Tcheby")

cat("\n")
cat("\n")
cat("PROGRAM OUTPUT","\n")
cat("\n")
cat("\n\n",distType,"  ","N =",SampleSize,"  Sample Mean",round(sampleMean,digits=2),"  Sample Std Dev",round(sampleStdDev,digits=2),"\n\n")

print(result, row.names=FALSE)

}
chap05()

