# ADDITION program - Chapter 2
# Change SampleSizes to desired sample sizes

chap02 <- function() {
	SampleSizes <- c(100,500,1000,5000)
	
	Probs <- c(.0278,.0556,.0833,.1111,.1389,.1667,.1389,.1111,.0833,.0556,.0278)
	DiceFreq <- NULL
	for (SampleSize in SampleSizes) {
		Die1 <- sample(1:6,size=SampleSize,replace=T)
		Die2 <- sample(1:6,size=SampleSize,replace=T)
		DiceSum <- Die1 + Die2
		DiceFreq <- cbind(DiceFreq,round(table(factor(DiceSum,levels=2:12))/SampleSize,digits=4))
	}
	
	outputMatrix <- matrix(cbind(DiceFreq,Probs),11,length(SampleSizes)+1,dimnames=list(2:12,c(paste("N=",SampleSizes),"Prob.")))
	cat("\n\n")
	print(outputMatrix,abbreviate.dimnames=F,prefix.width=5,min.colwidth=9,page.width=80,quote=FALSE)
	}

chap02()
