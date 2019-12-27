# FREQUENCY program - Chapter 4 
# Change values in Class array to desired frequencies (length does not matter)

chap04 <- function() {
	Class <- c(50,45,40,35,30,25,20,15,10,5)
	RelFreq <- Class/sum(Class) 
	CumRelFreq <- cumsum(Class)/sum(Class)
	
	if (round(max(RelFreq)+.1,digits=1) < 1) {PlotHeight <- round(max(RelFreq)+.1,digits=1)}
		else {PlotHeight <- 1}
	par(mfrow=c(2,1))
      barplot(RelFreq,xlab="Class",ylab="Relative Frequency",main="Relative Frequency Histogram",ylim=c(0,PlotHeight),density=-1,space=0,names=paste("",1:length(Class)))
	plot(CumRelFreq,xlab="Class",ylab="Cumulative Relative Frequency",main="Cumulative Relative Frequency Ogive")
	
	TableData <- matrix(0,length(Class),3,dimnames=list(paste("Class",1:length(Class)),c("  Freq.","  Relative Freq.","  Cum Rel Freq.")))
	
	for (i in 1:length(Class)) {
			TableData[i,] <- c(Class[i],round(RelFreq[i],digits=3),round(CumRelFreq[i],digits=3))
	}
	options(length=10000)
	cat("\n\n")	
	TableData
	}

chap04()