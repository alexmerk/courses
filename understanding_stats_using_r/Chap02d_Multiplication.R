# MULTIPLICATION program - Chapter 2
# Change SampleSizes to the desired sample sizes

chap02 <- function() {
	SampleSizes <- c(100,500,1000)
	
	outputMatrix <- NULL
	for (SampleSize in SampleSizes) {
		Die1 <- sample(1:6,size=SampleSize,replace=T)
		Die2 <- sample(1:6,size=SampleSize,replace=T)
		Rf1 <- sum(Die1%%2)/SampleSize
		Rf2 <- sum(Die2%%2)/SampleSize
		RfBoth <- sum((Die1%%2+Die2%%2)%/%2)/SampleSize
		outputMatrix <- rbind(outputMatrix,c(Rf1,Rf2,RfBoth,Rf1*Rf2,RfBoth-Rf1*Rf2))
	}

	dimnames(outputMatrix) <- list(paste("N=",SampleSizes),c("1st Odd","2nd Odd","Both Odd","F1*F2","Error"))
	cat("\n\n")
	print(round(outputMatrix,digits=3),abbreviate.dimnames=F,prefix.width=9,min.colwidth=12,page.width=80,quote=FALSE)
	}

chap02()
