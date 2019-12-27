# t-DISTRIBUTION program - Chapter 6

# Change popMean to the desired population mean
# Change popStdDev to the desired population standard deviation
# Change sampleSize to any number between 1 and 500
# Change replicationSize to the desired number of replications used 

chap06 <- function() {
	popMean <- 50
	popStdDev <- 15
	sampleSize <- 30
	replicationSize <- 250
	par(mfrow=c(2,1))

	zData <- NULL
	tData <- NULL
	for (i in 1:replicationSize) {
		sampleData <- rnorm(sampleSize,popMean,popStdDev)
		zData <- cbind(zData,(mean(sampleData)- popMean)/(popStdDev/sqrt(sampleSize)))
		tData <- cbind(tData,t.test(sampleData,mu=popMean)$statistic)
	}
	
	normSeq <- seq(-4,4,.5)
	intervalSeq <- paste("(",format(normSeq[1:(length(normSeq)-1)],nsmall=1),",",      
		format(normSeq[2:length(normSeq)],nsmall=1),")",sep="")
	tVector <- format(round(table(cut(tData,normSeq),exclude=NA)/replicationSize,digits=3),nsmall=3)
	zVector <- format(round(table(cut(zData,normSeq),exclude=NA)/replicationSize,digits=3),nsmall=3)
	outputMatrix <- matrix(cbind(intervalSeq,tVector,zVector),length(normSeq)-1,3)
	dimnames(outputMatrix) <- list(rep("",length(normSeq)-1),c("Interval ","Freq t ","Freq z"))
	maxOutlier <- ceiling(max(abs(tData)))
	hist(zData,breaks=seq(-maxOutlier,+maxOutlier,0.5),main="z Distribution",xlab="z values",probability=T,ylim=c(0,.6),density=-1)
	hist(tData,breaks=seq(-maxOutlier,+maxOutlier,0.5),main="t Distribution",xlab="t values",probability=T,ylim=c(0,.6),density=-1)
	options(length=10000)
	cat("\n\n")
      cat("\n","Pop. Mean =",popMean,"Pop. SD =",popStdDev,"\n","Sample Size =",sampleSize,"\n","N Replications =",replicationSize,"\n\n")
	print(outputMatrix,quote=F)
	}

chap06 ()