# RANDOM program - Chapter 3
# Change SampleSize to the desired sample size (multiple of 5, i.e., 5 * 12 = 60)

chap03 <- function() {
	SampleSize <- 60
	
	SampleData <- sample(0:9,SampleSize,replace=T)
	RFOdd <- round(sum(SampleData%%2)/SampleSize,digits=2)
	RFEven <- round((SampleSize-sum(SampleData%%2))/SampleSize,digits=2)
	RFNumbers <- round(table(factor(SampleData,levels=0:9))/SampleSize,digits=2)
	GroupedData <- matrix(SampleData,SampleSize/5,5)
	
	GroupedVector <- NULL
	eventVector <- NULL
	for (i in 1:dim(GroupedData)[1]) {
	tempGroup <- paste(GroupedData[i,1],GroupedData[i,2],GroupedData[i,3],GroupedData[i,4], GroupedData[i,5],sep="")
		groupTable <- table(factor(table(factor(GroupedData[i,],levels=0:9)),levels=0:5))
		if (groupTable[6]>0) {eventVector <- cbind(eventVector,6)}
		if (groupTable[5]>0) {eventVector <- cbind(eventVector,5)}
		if (groupTable[4]>0) {
			if (groupTable[3]>0) {eventVector <- cbind(eventVector,4)}
			else {eventVector <- cbind(eventVector,2)}
			}
		else
			{
			if (groupTable[3]==2) {eventVector <- cbind(eventVector,3)}
			if (groupTable[3]==1) {eventVector <- cbind(eventVector,1)}
			if (groupTable[3]==0) {eventVector <- cbind(eventVector,0)}
			}
		GroupedVector <- c(GroupedVector,tempGroup)
		}
	eventRFs <- round(table(factor(eventVector,levels=0:6))/length(eventVector),digits=4)
	NumberMatrix <- matrix(c(RFOdd,RFEven,RFNumbers,rep(.50,2),rep(.10,10)),12,2)
	dimnames(NumberMatrix) <- list(c("Odd","Even",0:9),c("Relative Frequency","Probability"))
	DupMatrix <- matrix(c(eventRFs,.3024,.5040,.0720,.1080,.0090,.0045,.0001),7,2)
	dimnames(DupMatrix) <- list(c("No duplicates","One pair","One triple","Two pairs","Pair & triple","Four alike","All alike"),c("Relative Frequency","Probability"))
	
	cat("\n\n","Number groups:\n",GroupedVector,"\n\n",fill=80)
	print(format(NumberMatrix,nsmall=2),abbreviate.dimnames=F,min.colwidth=20,quote=F)
	cat("\n\n")
	print(format(DupMatrix,nsmall=4),abbreviate.dimnames=F,min.colwidth=20,quote=F)
	}

chap03()