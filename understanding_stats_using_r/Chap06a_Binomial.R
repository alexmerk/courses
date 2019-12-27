# BINOMIAL program - Chapter 6

# numTrials can be adjusted for different numbers of respondents per replication (5 works best)
# numReplications can be changed to increase precision
# Probability can be changed to desired population proportion

chap06 <- function() {
	numTrials <- 5
	numReplications <- 500
	Probability <- .50
	
	experimentSample <- rbinom(numReplications,numTrials,Probability)
	sampleTable <- table(factor(experimentSample,levels=0:numTrials))/numReplications
	
	eventProbs <- NULL
	expSuccess <- 0
	expVariance <- 0
	for (i in 0:numTrials) {
		eventProbs <- c(eventProbs,choose(numTrials,i)*(Probability^i)*(1-Probability)^(numTrials-i))
		expSuccess <- expSuccess + eventProbs[i+1]*i
		expVariance <- expVariance + i^2*eventProbs[i+1]
	}
	expVariance <- expVariance-expSuccess^2
	outputMatrix <- matrix(c(sampleTable,eventProbs,sampleTable-eventProbs),numTrials+1,3)
	dimnames(outputMatrix) <- list(paste("Successes =",0:numTrials),c(" Rel. Freq."," Probability"," Error"))
	
	outLine1 <- c("\n\nMean number of successes =",round(mean(experimentSample),digits=3),"\nMean expected number of successes =",round(expSuccess,digits=3),"\n")
	outLine2 <- c("\nSample variance =",round(var(experimentSample),digits=3),"\nExpected variance =",round(expVariance,digits=3),"\n\n")
	options(length=10000)
	cat("\n\n")
      cat("\n","Number of Trials =",numTrials,"\n","Number of Replications =",numReplications,"\n","Probability =",Probability,"\n")
	cat(outLine1,outLine2,"\n")
	print(format(round(outputMatrix,digits=3),nsmall=3),quote=F)
	}	
	
chap06()