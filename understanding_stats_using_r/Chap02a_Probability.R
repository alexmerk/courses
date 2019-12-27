# PROBABILITY program - Chapter 2
# Change Probability value for different true probability
# Change seq for SampleSizes for different sample size sequence (default is 100 to 1000 by 100)

chap02 <- function() {
	Probability <- .50
	SampleSizes <- seq(100,1000,100)
	
	SampleFreqs <- NULL
	for (SampleSize in SampleSizes) {
	SampleFreqs <- c(SampleFreqs,sum(sample(0:1,prob=c((1-Probability),Probability),size=SampleSize, replace=T))/SampleSize)
	}
	
	plot(SampleSizes,SampleFreqs,type="l",ylim=c(Probability-.1,Probability+.1),xlab="Sample Size",ylab="Proportion", 
	main="Sample Proportion by Sample Size")
	
	SampleMatrix <- NULL
	for (SampleFreq in SampleFreqs) {
		SampleMatrix <- rbind(SampleMatrix,c(round(SampleFreq,digits=3),format(Probability,nsmall=3),
	round(SampleFreq-Probability,digits=3)))
	}
	dimnames(SampleMatrix) <- list(paste("sample size =",SampleSizes),c("Sample %","Population %","Error"))
	cat("\n\n")
	print(SampleMatrix,abbreviate.dimnames=F,prefix.width=20,min.colwidth=12,page.width=80,quote=FALSE)
	}
	
chap02()