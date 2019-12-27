# PRACTICAL program - Chapter 15

# Set sampleSize to desired sample size for both samples
# Set meanOne to the mean of the first population 
# Set stdDevOne as the standard deviation in population one
# Set meanTwo to the mean of the second population
# Set stdDevTwo as the standard deviation in population two

chap15 <- function() {
	sampleSize <- 30
	meanOne <- 50
	stdDevOne <- 10
	meanTwo <- 50
	stdDevTwo <- 10
	
	sampleOne <- rnorm(sampleSize,meanOne,stdDevOne)
	sampleTwo <- rnorm(sampleSize,meanTwo,stdDevTwo)
	
	tResults <- t.test(sampleOne,sampleTwo,alternative="two.sided",var.equal=T,paired=F,conf.level=.95)
	tVal <- tResults$statistic
	df <- tResults$parameter
      
	dEffect <- 2*tVal/sqrt(df)
	rEffect <- sqrt((tVal^2)/(tVal+df))
	
	outputText <- c("Two sample independent t-test",paste("Sample size=",sampleSize))
	outputText <- c(outputText,paste("Sample One Mean =",round(mean(sampleOne),digits=2)))
	outputText <- c(outputText,paste("Sample One SD =",round(sqrt(var(sampleOne)),digits=2)))
	outputText <- c(outputText,paste("Sample Two Mean =",round(mean(sampleTwo),digits=2)))
	outputText <- c(outputText,paste("Sample Two SD =",round(sqrt(var(sampleTwo)),digits=2)))
	outputText <- c(outputText,paste("t-test =",round(tVal,digits=2)))
	outputText <- c(outputText,paste("df =",round(df,digits=3)))
	outputText <- c(outputText,paste("p-value =",round(tResults$p.value,digits=3)))
	outputText <- c(outputText,paste("95% Confidence Interval =",round(tResults$conf.int[1],digits=3),"to",round(tResults$conf.int[2],digits=3)))
	outputText <- c(outputText,paste("r Effect =",round(rEffect,digits=3)))
	outputText <- c(outputText,paste("d Effect =",round(dEffect,digits=3)))
	
	outputMatrix <- matrix(outputText,6,2,byrow=T)
      dimnames(outputMatrix) = list(c("","","","","",""),c("",""))
	cat("\n\nIndependent t-test Results\n")
	print(outputMatrix,min.colwidth=40,quote=F)
	}			
	
chap15()