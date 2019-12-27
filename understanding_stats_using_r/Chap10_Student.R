# STUDENT program - Chapter 10

# Set sampleSize to desired sample size(s)
# Set meanOne to be the population mean, first sample mean, or pre mean, depending on test
# Set stdDevOne to correspond to meanOne
# Set meanTwo to be the sample mean, second sample mean, or post mean, depending on test
# Set stdDevTwo to correspond to meanTwo
# Set testType for any of (1) one sample t-test, (2) two sample independent t-test, (3) dependent t-test 

   sampleSize <- 20
   meanOne <- 50
   stdDevOne <- 10
   meanTwo <- 50
   stdDevTwo <- 10

# Set testType for any of (1) one sample t-test, (2) two sample independent t-test, (3) dependent t-test 

   testType <- 1

chap10 <- function() {
	
	sampleOne <- rnorm(sampleSize,meanOne,stdDevOne)
	sampleTwo <- rnorm(sampleSize,meanTwo,stdDevTwo)
	if (testType==1) {
		tResults <- t.test(sampleTwo,alternative="two.sided",mu=meanOne)
		outputText <- c("One sample t-test",paste("Sample size=",sampleSize))
		outputText <- c(outputText,paste("Sample Mean=",round(mean(sampleTwo),digits=2)))
		outputText <- c(outputText,paste("Sample Std Dev=",round(sqrt(var(sampleTwo)),digits=2)))
		outputText <- c(outputText,paste("Population Mean=",meanOne),paste("Population Std Dev=",stdDevOne))
		}
	if (testType==2) {
		tResults <- t.test(sampleOne,sampleTwo,alternative="two.sided",paired=F)
		outputText <- c("Two sample independent t-test",paste("Sample size=",sampleSize))
		outputText <- c(outputText,paste("Sample One Mean=",round(mean(sampleOne),digits=2)))
		outputText <- c(outputText,paste("Sample One Std Dev=",round(sqrt(var(sampleOne)),digits=2)))
		outputText <- c(outputText,paste("Sample Two Mean=",round(mean(sampleTwo),digits=2)))
		outputText <- c(outputText,paste("Sample Two Std Dev=",round(sqrt(var(sampleTwo)),digits=2)))
		}
	if (testType==3) {
		tResults <- t.test(sampleTwo,sampleOne,alternative="two.sided",paired=T)
		outputText <- c("Dependent t-test",paste("Number of paired scores=",sampleSize))
		outputText <- c(outputText,paste("Pre Mean=",round(mean(sampleOne),digits=2)))
		outputText <- c(outputText,paste("Post Mean=",round(mean(sampleTwo),digits=2)))
		outputText <- c(outputText,paste("Sum of Differences=",round(sum(sampleTwo-sampleOne),digits=2)))
		outputText <- c(outputText,paste("Sum Squared Diff=",round(sum((sampleTwo-sampleOne)^2),digits=2)))
		}
	outputText <- c(outputText,paste("t-test=",round(tResults$statistic,digits=2)))
	outputText <- c(outputText,paste("p-value=",format(round(tResults$p.value,digits=3),nsmall=3)))
	out <- matrix(outputText,4,2,byrow=T)
	dimnames(out) <- list(c("","","",""),c("",""))
      cat("\n")
	print(out,quote=F)
	}	

chap10()