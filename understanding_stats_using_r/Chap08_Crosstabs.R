# CROSSTAB program - Chapter 8

# Set the cell probabilities in order as c(ROW1COL1,ROW1COL2,ROW2COL1,ROW2COL2)
# Set sampleSize to the desired sample size

chap08 <- function() {
	cellProbs <- c(.10,.15,.3,.45)  # cell percents should sum to 1.00
	sampleSize <- 100
	
	testVector <- sample(1:4,prob=cellProbs,size=sampleSize,replace=T)
	testMatrix <- matrix(table(factor(testVector,levels=1:4)),2,2,byrow=T,dimnames=list(c("A","B"),c("X","Y")))
	expVector <- c(sum(testMatrix[,1])/sampleSize*sum(testMatrix[1,]),sum(testMatrix[,1])/sampleSize*sum(testMatrix[2,]))
	expVector <- c(expVector,sum(testMatrix[,2])/sampleSize*sum(testMatrix[1,]),sum(testMatrix[,2])/sampleSize*sum(testMatrix[2,]))
	expMatrix <- round(matrix(expVector,2,2,dimnames=list(c("A","B"),c("X","Y")))/sampleSize,digits=3)
	
      cat("\n","Cell Probabilities =",cellProbs,"\n","Sample Size =",sampleSize,"\n")
	cat("\n\n",paste("Population Proportions"),"\n")
	print(format(matrix(cellProbs,2,2,byrow=T,dimnames=list(c("A","B"),c("X","Y"))),nsmall=2),right=T,quote=F)
	cat ("\n",paste("Observed Proportions"),"\n")
	print(testMatrix/sampleSize,right=T,quote=F)
	cat ("\n",paste("Expected Proportions"),"\n")
	print(format(expMatrix,nsmall=2),right=T,quote=F)
	
	chisqResults <- chisq.test(testMatrix)
	cat("\n","Pearson chi-square test with Yates' continuity correction","\n")
	cat("Chi-square = ",round(chisqResults$statistic,digits=4)," df = ",chisqResults$parameter," p-value = ",round(chisqResults$p.value,digits=5))
      cat("\n")
	}
	
chap08 ()