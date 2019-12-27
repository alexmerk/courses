# CONDITIONAL Program - Chapter 2
# Change numBatteries and numBad
# Change SampleSize to the desired number of replications

chap02 <- function() {
	numBatteries <- 6
	numBad <- 2
	SampleSize <- 1000
	
	numGood <- numBatteries - numBad
	pGG <- round((numGood/numBatteries)*((numGood-1)/(numBatteries-1)),digits=3)
	pBB <- round((numBad/numBatteries)*((numBad-1)/(numBatteries-1)),digits=3)
	pGB <- round((numGood/numBatteries)*((numBad)/(numBatteries-1)),digits=3)
	pBG <- round((numBad/numBatteries)*((numGood)/(numBatteries-1)),digits=3)
	
	allBatteries <- c(rep(0,numGood),rep(1,numBad))
	FirstBattery <- NULL
	SecondBattery <- NULL
	for (i in 1:SampleSize) {
		thisSample <- sample(allBatteries,2,replace=F)
		FirstBattery <- c(FirstBattery,thisSample[1])
		SecondBattery <- c(SecondBattery,thisSample[2])
		eventList <- FirstBattery + SecondBattery*2
	}
	eventTable <- round(table(factor(eventList,levels=0:3))/SampleSize,digits=3)
	
	eventVector <- c("","","Second","Battery","","","Bad","Good","First","Bad",eventTable[4],eventTable[2],"Battery","Good",eventTable[3],eventTable[1])
	numBadVector <- c("No. Bad  ",0:2,"Rel Freq  ",eventTable[1],eventTable[2]+eventTable[3],eventTable[4],"Probability",pGG,pBG+pGB,pBB)
	
	cat("\n\n")
	print(matrix(eventVector,4,4,byrow=T,dimnames=list(rep("",4),rep("",4))),quote=F)
	cat("\n\n")
	print(matrix(numBadVector,4,3,dimname=list(rep("",4),rep("",3))),prefix.width=0,quote=F)
	}
	
chap02()