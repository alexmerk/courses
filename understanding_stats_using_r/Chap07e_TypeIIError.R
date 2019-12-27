# TYPE II ERROR program - Chapter 7

# Set nullMean to the desired mean in the null hypothesis
# Set popMean to the desired true population mean
# Set popVar to the desired population variance
# Set sampleSize to the desired sample size
# Set alpha to the desired confidence level
# Set tails to represent the direction of the test
# Set numReplications to the desired number of replications

  nullMean <- 0
  popMean <- 0
  popVar <- 1
  sampleSize <- 5
  alpha <- .05
  tails <- 1             # 0=one-tailed less than null, 1=one-tailed greater than null
  numReplications <- 100

chap07 <- function() {
		
	pValue <- function(nullMean,popVar,sampleMean,sampleSize,tails) {
		if (tails==0) {
			pVal <- pnorm(sampleMean,nullMean,sqrt(popVar)/sqrt(sampleSize))
			}
		if (tails==1) {
			pVal <- 1-pnorm(sampleMean,nullMean,sqrt(popVar)/sqrt(sampleSize))
			}
		pVal
		}
	
	
	numRejected <- 0
	for (j in 1:numReplications)
	{if (pValue(nullMean,popVar,mean(rnorm(sampleSize,popMean,popVar)),sampleSize,tails)<alpha) {numRejected <- numRejected + 1}
		                                 }
	estPower <- numRejected/numReplications
	estPAcc <- (numReplications-numRejected)/numReplications
	if (tails==0) {invisible(critVal <- (qnorm(alpha,nullMean,popVar))*sqrt(popVar/sampleSize)+nullMean)
		}
	if (tails==1) {
		invisible(critVal <- (qnorm(1-alpha,nullMean,popVar))*sqrt(popVar/sampleSize)+nullMean)
	 	}
	truePower <- pValue(popMean,popVar,critVal,sampleSize,tails)
	truePAcc <- 1-truePower
	
	dimVector1 <- list("",c("Null Diff.","Pop Diff.","Pop Variance","Sample Size","Alpha")) 
	dimVector2 <- list("",c("Retain Null % ","Power Estimate ","True Null %","True Power"))
	outVector1 <- cbind(nullMean,popMean,popVar,sampleSize,alpha)
	outVector2 <- cbind(format(round(cbind(estPAcc,estPower,truePAcc,truePower),digits=3),nsmall=3))
	outMatrix1 <- matrix(outVector1,1,5,dimnames=dimVector1)
	outMatrix2 <- matrix(outVector2,1,4,dimnames=dimVector2)

      cat("\n","Null Mean =",nullMean,"Pop. Mean =",popMean,"Pop. Variance =",popVar,"\n")
      cat("\n","Sample Size =",sampleSize,"Alpha =",alpha,"N Replications =",numReplications)
      cat("\n","Hypothesis Direction =",tails,"(0 = one-tailed < Null, 1 = one-tailed > Null")

      cat("\n\n")

	cat("\n",paste("Table 1. Means, Variance, Sample Size, and Alpha",sep=""),"\n")
	print(outMatrix1,abbreviate.dimnames=F,min.colwidth=15,page.width=85,prefix.width=0,quote=F)
	cat("\n",paste("Table 2. Estimated Null Mean Diff. % and Power with True Null % and Power",sep=""),"\n")
	print(outMatrix2,abbreviate.dimnames=F,min.colwidth=15,page.width=85,prefix.width=0,quote=F)
	}
	
chap07 ()