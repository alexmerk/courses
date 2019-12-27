# TYPE I ERROR program - Chapter 7

# Set SampleSize to the desired sample size
# Set PopMean to the desired population mean
# Set PopStdDev to the desired population standard deviation
# Set Zvalues to correspond to desired confidence interval percents

  SampleSize <- 10
  PopMean <- 50
  PopStdDev <- 10
  Zvalues <- c(1.645, 1.96, 2.576)  # 90%, 95%, & 99% confidence intervals
  numReplications <- 100

chap07 <- function() {
	
	SampleData <- rnorm(SampleSize,PopMean,PopStdDev)
	SampleMean <- mean(SampleData)
	x <-1
	y <-1
	plot(x,y,type="b",xlim=c(0,80),main=paste("Sample Size =",SampleSize),sub=paste("Sample Mean =",round(SampleMean,digits=2)))
	   lines(c(SampleMean,SampleMean),c(0,2),type="l")
	   mtext("Confidence Intervals (90%, 95%, 99%)",side=3,line=3)
         	
	replicationData <- NULL
	for (i in 1:numReplications) {
		replicationData <- c(replicationData,mean(rnorm(SampleSize,PopMean,PopStdDev)))
		}
	LowerInt <- NULL
	UpperInt <- NULL
	IntWidth <- NULL
	OutsideRange <- rep(0,3)
	for (i in 1:3) {
		LowerInt <- cbind(LowerInt,round(SampleMean-Zvalues[i]*PopStdDev/sqrt(SampleSize),digits=1))
		UpperInt <- cbind(UpperInt,round(SampleMean+Zvalues[i]*PopStdDev/sqrt(SampleSize),digits=1))
		IntWidth <- cbind(IntWidth,format(UpperInt[i]-LowerInt[i],nsmall=1))
		for (j in 1:numReplications) {
			if (PopMean<(replicationData[j]-Zvalues[i]*PopStdDev/sqrt(SampleSize))||PopMean>(replicationData[j]+Zvalues[i]*PopStdDev/sqrt(SampleSize))) {
					OutsideRange[i] <- OutsideRange[i] + 1
				}
			}
		lines(c(LowerInt[i],LowerInt[i]),c(0,2),type="c")
		lines(c(UpperInt[i],UpperInt[i]),c(0,2),type="c")
		}
		
	IntLabel <- paste(format(UpperInt,nsmall=1),"-",format(LowerInt,nsmall=1))
	OutputMatrix <- matrix(nrow=3,ncol=4,c("90%","95%","99%",paste(OutsideRange,"%",sep=""),IntLabel,IntWidth))
	dimnames(OutputMatrix) <- list(rep("",3),c("Confidence Level","Percent Error","Confidence Interval","Interval Width"))
	
      cat("\n","Pop. Mean =",PopMean,"Pop. SD =",PopStdDev,"\n")
      cat("\n","Sample Size =",SampleSize,"N Replications =",numReplications,"\n")
      cat("\n\n")
      
	print(OutputMatrix,abbreviate.dimnames=F,min.colwidth=20,prefix.width=0,page.width=100,quote=F)
	}

chap07()			