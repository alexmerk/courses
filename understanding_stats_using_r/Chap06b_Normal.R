# NORMAL program - Chapter 6

# Change NumPoints to desired number of sample points
# IntervalMin and IntervalMax values set to yield +/- 3 
# Density Height set to .3989 to graph standard normal curve

chap06 <- function() {
	NumPoints <- 1000
	IntervalMin <- -3
	IntervalMax <- 3
	
	IntervalWidth <- IntervalMax - IntervalMin
	DensityHeight <- .3989
	xPoints <- runif(NumPoints,IntervalMin,IntervalMax)
	yPoints <- runif(NumPoints,0,DensityHeight)
	invisible(withinRange <- (sum(yPoints <= (1/sqrt(2*pi))*exp(-.5*xPoints^2))*DensityHeight*IntervalWidth)/NumPoints)
	MinProb <- 1-(exp(-((83*abs(IntervalMin)+351)*abs(IntervalMin)+562)*abs(IntervalMin)/(703+165*abs(IntervalMin))))/2
	MaxProb <- 1-(exp(-((83*abs(IntervalMax)+351)*abs(IntervalMax)+562)*abs(IntervalMax)/(703+165*abs(IntervalMax))))/2
	if (IntervalMin<0 && IntervalMax>=0) {
			trueProb <- MaxProb-(1-MinProb)
		}
	if (IntervalMin>=0 && IntervalMax>=0) {
			trueProb <- MaxProb-MinProb
		}
	if (IntervalMin<0 && IntervalMax<0) {
			trueProb <- MinProb-MaxProb
		}
	if (withinRange > 1) {withinRange <- 1}
	error <- withinRange-trueProb
	outputVector <- c(paste(IntervalMin,"< Z <",IntervalMax,sep=""),round(withinRange,digits=3),round(trueProb,digits=3),round(error,digits=3))
	outputLabels <- list("",c("Interval  ","Sample P ","True P  ","Error"))
	outputMatrix <- matrix(outputVector,1,4,dimnames=outputLabels)
	cat("\n\n")
      cat("\n","Sample size =",NumPoints,"Interval width =",IntervalWidth,"\n")
	cat("\n")
      print(outputMatrix,quote=F)
	}

chap06()