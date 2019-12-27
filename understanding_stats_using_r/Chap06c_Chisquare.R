# CHISQUARE program - Chapter 6

# Change popMean to the desired population mean
# Change popStdDev to the desired population standard deviation
# Change sampleSize to any number between 1 and 30
# Change replicationSize to the desired number of replications used 

chap06 <- function() {
	popMean <- 10
	popStdDev <- 4
	sampleSize <- 30
	replicationSize <- 250
	
	
	cData <- NULL
	for (i in 1:replicationSize) {
		sampleData <- rnorm(sampleSize,popMean,popStdDev)
		cData <- cbind(cData,(sum((sampleData-mean(sampleData))^2)/(popStdDev^2)))
	}
	
	normSeq <- seq(0,20,1)
	dataRange <- round(max(cData)-min(cData),digits=1)
	intervalSeq <- paste("(",format(normSeq[1:(length(normSeq)-1)],nsmall=1),",",format(normSeq[2:length(normSeq)],nsmall=1),")",sep="")
	cVector <- table(cut(cData,normSeq),exclude=NA)/replicationSize
	outputMatrix <- matrix(cbind(intervalSeq,format(cVector,nsmall=3)),length(normSeq)-1,2)
	dimnames(outputMatrix) <- list(rep("",length(normSeq)-1),c("Interval   ","Rel Freq"))
	highGroup <- 1
	for (i in 1:length(cVector)) {
		if (cVector[i] > cVector[highGroup]) {
			invisible(highGroup <- i)
		}
	}
	Mode <- highGroup
	barplot(cVector,xlab="Number of Groups",ylab="Frequency",ylim=c(0, .20),col="white",main="Histogram of Chi-square Values",names=as.character(1:length(cVector)))
	plot(cVector,type="l")	
options(length=10000)
	cat("\n\n")
	cat("\n","Pop. Mean =",popMean,"\n","Pop. SD =",popStdDev,"\n","Sample Size =",sampleSize,"\n","N Replications =",replicationSize,"\n")
      cat("\n")
      print(outputMatrix,quote=F)
	cat("\n\nModal Group =",Mode,"  \tRange of chi-square values =",dataRange)
      cat("\n")


	}


chap06()