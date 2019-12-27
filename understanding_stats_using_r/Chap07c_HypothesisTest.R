# HYPOTHESIS TEST program - Chapter 7

# Set popMean and popVar to the population mean and variance
# Set nullMean to the mean of the null hypothesis
# Set tails for the type of test being conducted
# Set sampleSize to the size that each sample should be
# Set alpha to the desired confidence level
# Set varUse to 0 for population variance and 1 for sample variance 
# Set numSamples to the number of samples to test 

popMean <- 10.5
popVar <- 2
nullMean <- 10
tails <- 1 # 0=one-tailed less than null, 1=one-tailed greater than null, 2=two-tailed
sampleSize <- 36
alpha <- .05
varUse <- 1  # 0=population standard deviation, 1=sample standard deviation
numSamples <- 10

options(width=90)
pValue <- function(nullMean,popVar,sampleMean,sampleSize,tails) {
	if (tails==0) {
		pVal <- pnorm(sampleMean,nullMean,sqrt(popVar)/sqrt(sampleSize))
		}
	if (tails==1) {
		pVal <- 1-pnorm(sampleMean,nullMean,sqrt(popVar)/sqrt(sampleSize))
		}
	if (tails==2) {
		pVal <- (.5-abs(.5-pnorm(sampleMean,nullMean,sqrt(popVar)/sqrt(sampleSize))))*2
		}
	pVal
	}

chap07 <- function() {
	outputMatrix1 <- NULL
	decision <- NULL
	for (i in 1:numSamples) {
		sampleData <- rnorm(sampleSize,popMean,sqrt(popVar))
		outputVector1 <- NULL
		if (varUse==0) {
			probability <- pValue(nullMean,popVar,mean(sampleData),sampleSize,tails)
			if (probability < alpha) {
				decision <- "REJECT NULL"
				}
			else
				{
				decision <- "RETAIN NULL"
				}
			zstat <- (mean(sampleData)-nullMean)/(sqrt(popVar)/sqrt(sampleSize))
	             outputVector1 <- cbind(outputVector1,round(mean(sampleData),digits=3),round(sqrt(popVar),digits=3),round(zstat,digits=3),decision,format(ceiling(probability*1000)/1000,nsmall=3))
	             }
	      else
			{
			probability <- pValue(nullMean,var(sampleData),mean(sampleData),sampleSize,tails)
	      		if (probability < alpha) {
				decision <- "REJECT NULL"
				}
			else
				{
				decision <- "RETAIN NULL"
				}
			tstat <- (mean(sampleData)-nullMean)/(sqrt(var(sampleData))/sqrt(sampleSize))
	            outputVector1 <- cbind(outputVector1,round(mean(sampleData),digits=3),round(sqrt(var(sampleData)),digits=3),round(tstat,digits=3),decision,format(ceiling(probability*1000)/1000,nsmall=3))
	             }
		outputMatrix1 <- rbind(outputMatrix1,outputVector1)
		}
	cat("\n\n")
      cat("Pop. Mean =",popMean,"Pop. Variance =",popVar,"Null Mean =",nullMean,"\n")
      cat("Sample Size =",sampleSize,"Alpha =",alpha,"Number of Samples",numSamples,"\n\n")
      cat("Variance type =",varUse,"(0 = population; 1 = sample)","\n")
      cat("Hypothesis direction =",tails,"(0 < Null, 1 > Null, 2 = two-tailed)")
      cat("\n\n")
      
	if (varUse==0) {
		dimnames(outputMatrix1) <- list(rep("",numSamples),c("Sample Mean","Pop. SD","z-statistic","Decision","p-value"))
		print(outputMatrix1,min.colwidth=14,prefix.width=0,quote=F)
		}
	else
		{
     		dimnames(outputMatrix1) <- list(rep("",numSamples),c("Sample Mean","Sample SD","t-statistic","Decision","p-value"))
		print(outputMatrix1,min.colwidth=14,prefix.width=0,quote=F)

	    }

	}
	
chap07 ()