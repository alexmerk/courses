# Combination and Permutation program - Chapter 2 
# Change numPeople to the group sizes desired
# Change replicationSize to increase or decrease estimating ability

chap02 <- function() {
	numPeople <- c(5,10,20,50)
	replicationSize <- 250
	
	repeatVector <- rep(0,length(numPeople))
	for (i in 1:length(numPeople)) {
		for (j in 1:replicationSize) {
			SampleBDays <- sample(1:365,size=numPeople[i],replace=T)
			if (max(table(SampleBDays)) > 1) {
				repeatVector[i] <- repeatVector[i] + 1
			}
		}
	}
	freqVector <- repeatVector/replicationSize
	probVector <- NULL
	for (sampleSize in numPeople) {
		probVector <- c(probVector,1-prod((366-(1:sampleSize))/365))
	}
	labelList <- list(paste("N=",numPeople),c("Rel. Freq.","Common Birthday","Error"))
	outMatrix <- matrix(c(freqVector,probVector,freqVector-probVector),length(numPeople),3,dimnames=labelList)
	cat("\n\n")	
	print(format(round(outMatrix,digits=3),nsmall=3),abbreviate.dimnames=F,min.colwidth=15,page.width=80,quote=F)
	}
	
chap02()