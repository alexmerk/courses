# JOINT program - Chapter 2
# Change pH to the desired probability of tossing a head
# Change numCoins to the desired number of coins (Shouldn't exceed probability for 5 coins)
# Change N to the desired sample size

chap02 <- function() {
	pH <- .5
	numCoins <- 2
	N <- 100
	
	allTosses <- sample(0:1,prob=c((1-pH),pH),size=N*numCoins,replace=T)
	groupedTosses <- matrix(allTosses,N,numCoins,byrow=T)
	countedTosses <- rep(0,N)
	for (i in 1:N) {
		countedTosses[i] <- sum(groupedTosses[i,])
	}
	eventLabels <- rep(c(""),2^numCoins)
	eventProbs <- rep(1,2^numCoins)
	numHeads <- rep(0,2^numCoins)
	for (i in 0:(2^numCoins-1)) {
			tempVal <- i
			for (j in (numCoins-1):0) {
				if (tempVal >= 2^j) {
					tempVal <- tempVal - 2^j
					eventLabels[i+1] <- paste("H",eventLabels[i+1],sep="")
					eventProbs[i+1] <- eventProbs[i+1]*pH
					numHeads[i+1] <- numHeads[i+1] + 1
				}
				else
				{
					eventLabels[i+1] <- paste("T",eventLabels[i+1],sep="")
					eventProbs[i+1] <- eventProbs[i+1]*(1-pH)
				}
			}
	}
	numEvents <- table(factor(numHeads,levels=0:numCoins))
	probHeads <- rep(0,numCoins+1)
	for (i in 0:numCoins) {
		probHeads[i+1] <- numEvents[i+1]*pH^i*(1-pH)^(numCoins-i)
	}
	categorizedTosses <- rep(0,N)
	for (i in 1:N) {
		for (j in 1:numCoins) {
			if (groupedTosses[i,j] == 1) {
				categorizedTosses[i] <- categorizedTosses[i] + 2^(j-1)
			}
		}
	}
	freqNumHeads <- matrix(c(table(factor(countedTosses,levels=0:numCoins))/N,probHeads),numCoins+1,2,dimnames=list(paste(0:numCoins,"Heads"),c("Sample %","Population %")))
	freqEvents <- matrix(c(table(factor(categorizedTosses,levels=0:(2^numCoins-1)))/N,eventProbs),length(eventLabels),2,dimnames=list(eventLabels,c("Sample %","Population %")))
	
	cat("\n\n")
	print(freqNumHeads)
	cat("\n")
	print(freqEvents)
	}
	
chap02()
