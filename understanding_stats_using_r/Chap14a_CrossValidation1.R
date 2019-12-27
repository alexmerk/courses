# CROSSVALIDATION1 - Chapter 14

# Set bTrue to the true population slope
# Set aTrue to the true population intercept 
# Set sampleSize for the desired number of sample points
# Set numReplications for the number of replications

chap14 <- function() {
	bTrue <- .25
	aTrue <- 3
	sampleSize <- 1000
	numReplications <- 5
	
	X <- runif(sampleSize,1,10)
	Y <- aTrue + bTrue*X + rnorm(length(X),0,1)
	sampleReg <- lsfit(X,Y)
	samplefit <- ls.print(sampleReg,print.it=F)
	sampleR2 <- samplefit$summary[2]
	aSample <- round(sampleReg$coef[1],digits=3)
      bSample <- round(sampleReg$coef[2],digits=3)
	outputVector <- NULL

	for (i in 1:numReplications) {
		halfSize <- ceiling(sampleSize/2)
		halfPoints <- sample(1:sampleSize,size=halfSize)
		halfSampleXs <- X[halfPoints]
		halfSampleYs <- Y[halfPoints]
		halfSampleReg <- lsfit(halfSampleXs,halfSampleYs)
		halfSampleSummary <- ls.print(halfSampleReg,print.it=F)
		halfSampleR2 <- halfSampleSummary$summary[2]
		bHalfSample <- halfSampleReg$coef[2]
		aHalfSample <- halfSampleReg$coef[1]
		
		leftSampleXs <- X[-halfPoints]
		leftSampleYs <- Y[-halfPoints]
		predYs <- leftSampleXs*bHalfSample + aHalfSample
		sumSquaredErrors <- sum((predYs-mean(leftSampleYs))^2)
		totalSumSquares <- sum((leftSampleYs-mean(leftSampleYs))^2)
		validationR2 <- round(sumSquaredErrors/totalSumSquares,digits=3)
		outputVector <- c(outputVector,round(bHalfSample,digits=3),halfSampleR2,validationR2)
		}
	outputMatrix <- matrix(outputVector,numReplications,3,byrow=T)
	dimnames(outputMatrix) <- list(paste("Replication ",1:numReplications),c("Reg Weight","R-Squared","R-Squared"))
      cat("\n")
    
     cat("\n","Population","\n")
     cat("\n","Regression equation: Y = ",aTrue," + ",bTrue)
     cat("\n","Sample Size =",sampleSize)
     cat("\n","N Replications =",numReplications)
     cat("\n")	
     cat("\n", "Full Sample","\n")
     cat("\n","Regression equation: Y = ",aSample," + ",bSample)
     cat("\n","R-Squared =",sampleR2,"\n\n")

     cat("\n","              Sample A","  Sample A"," Sample B","\n")
     print(outputMatrix,min.colwidth=18,page.width=80,quote=F)
	}

chap14()	