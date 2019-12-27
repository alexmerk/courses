# DEVIATION program - Chapter 7

# Change SampleSize to desired sample size
# Change NumReplications to desired number of replications

SampleSize <- 5
NumReplications <- 250

StdDevDist <- NULL
for (i in 1:NumReplications) {
	mySample <- runif(SampleSize,0,100)
	sampleStdDev <- sqrt(var(mySample))
	StdDevDist <- c(StdDevDist,sampleStdDev)
	}
meanStdDev <- format(round(mean(StdDevDist),digits=2),nsmall=2)
HistTitle <- paste("Sampling Mean = ",meanStdDev,"  Population Standard Deviation = 28.58",sep="","\n","Sample Size =",SampleSize)
hist(StdDevDist,breaks=seq(0,100,5),main=HistTitle,xlab="Standard Deviations",ylab="Frequency",density=-1)