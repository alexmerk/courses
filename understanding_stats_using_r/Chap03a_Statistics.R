# STATISTICS program - Chapter 3 
# Change SampleSizes to the desired sample sizes

chap03 <- function() {
	SampleSizes <- c(10,100,500,1000,1500)
	NumSamples <- length(SampleSizes)
	
	PopProp <- runif(1,0,1)
	i <- 0
	TrialData <- matrix(0,NumSamples,5,dimnames=list(paste("Sample ",1:NumSamples),
		c("  Size","  No. in Favor","  Sample Prop.","  True Prop.","  Est. Error")))
	
	for (SampleSize in SampleSizes) {
		SampleData <- sample(0:1,prob=c((1-PopProp),PopProp),size=SampleSize,replace=T)
		SampleProp <- sum(SampleData)/SampleSize
	TrialData[i+1,] <- c(SampleSize,sum(SampleData),round(SampleProp,digits=3), round(PopProp,digits=3),round(PopProp-SampleProp,digits=3))
		i <- i + 1
	}
	options(length=10000)
	cat("\n\n")
	TrialData
	}

chap03()