# BELL-SHAPED CURVE program - Chapter 5

chap05 <-function() {
# Change SampleSize for different sample sizes
# Change distType to "Uniform", "Normal", "Exponential", or "Bimodal"

Kvals <- c(68,95,99)
SampleSize <- 50
distType<-"Uniform"

outputMatrix <- matrix(0,length(Kvals),3,dimnames=list(paste("K =",format(1:length(Kvals),digits=2)),c("Interval","% Observed","% Predicted")))
if (distType == "Uniform") {invisible(mySample <- runif(SampleSize,1,10))}
if (distType == "Normal") {invisible(mySample <- rnorm(SampleSize,0,1))}
if (distType == "Exponential") {invisible(mySample <- rexp(SampleSize,1))}
if (distType == "Bimodal") {invisible(mySample <- c(rnorm(as.integer(SampleSize/2),.5,.5),rnorm(SampleSize-as.integer(SampleSize/2),1.5,.5)))}
              
sampleStdDev <- sqrt(var(mySample))
sampleMean <- mean(mySample)
for(i in 1:length(Kvals)) {
        outputMatrix[i,1] <- paste(format(round(sampleMean-i*sampleStdDev,digits=2),digits=2),"to",format(round(sampleMean+i*sampleStdDev,digits=2),digits=2))
        outputMatrix[i,2] <- round((sum(abs(mySample-sampleMean)<=i*sampleStdDev)/length(mySample))*100,digits=0)
        outputMatrix[i,2] <- round((table(cut(mySample,breaks=c(sampleMean-i*sampleStdDev,sampleMean+i*sampleStdDev)))/length(mySample))*100,digits=0)
        outputMatrix[i,3] <- round(Kvals[i],digits=1)
        }
cat("\n")
cat("\n")
cat("\n")
cat("BEGIN PROGRAM OUTPUT","\n")
cat("\n")
cat("\n\n",distType,"  ","N =",SampleSize,"  Sample Mean =",round(sampleMean,digits=2),"  Sample Std Dev =",round(sampleStdDev,digits=2),"\n\n")

print(outputMatrix,quote=F)
}
chap05 ()
  
