# SAMPLE program - Chapter 5
# Change SampleSizes vector for different sample sizes

chap05 <- function() {
	SampleSizes <- c(10,50,100,200,500,1000)
	outputMatrix <- matrix(0,length(SampleSizes),4,dimnames=list(rep("",length(SampleSizes)), c("N","Range","Standard Dev.","Range/SD")))
	outputMatrix[,1] <- SampleSizes
	for (i in 1:length(SampleSizes)) {
		dataVector <- as.integer(runif(SampleSizes[i],1,1000))
		outputMatrix[i,2] <- max(dataVector)-min(dataVector)
		outputMatrix[i,3] <- round(sqrt(var(dataVector)),digits=2)
		outputMatrix[i,4] <- round(outputMatrix[i,2]/outputMatrix[i,3],digits=2)
		}  
	options(length=10000)
	cat("\n\n")
	outputMatrix
	}
	
chap05()
