# REGRESSION program - Chapter 13

# Set bTrue to the true regression weight 
# Set aTrue to the true intercept 
# Set sampleSize for the desired number of sample points

chap13 <- function() {
	bTrue <- .25
	aTrue <- 3
	sampleSize <- 20
	
	X <- round(runif(sampleSize,1,10),digits=2)
	Y <- round(aTrue + bTrue*X + rnorm(length(X),0,1),digits=2)
	DataMatrix <- matrix(paste("(",X,",",Y,")",sep=""),ceiling(sampleSize/5),5)
      dimnames(DataMatrix) <- list(c("","","",""),c("","","","",""))

      cat("\n\n","Scatterplot Data Points","\n")
	print(DataMatrix,quote=F,min.colwidth=11,prefix.width=0)
	
	sampleReg <- lsfit(X,Y)
	bSample <- round(sampleReg$coef[2],digits=2)
	aSample <- round(sampleReg$coef[1],digits=2)
	regTitle <- paste("Least squares fit line is: y = ",aSample," + ",bSample,"x",sep="")
	trueEq <- paste("True regression line is: y = ",aTrue," + ",bTrue,"x",sep="")
	corrCoef <- paste("r = ",round(cor(X,Y),digits=2)," (slope using standard scores for X and Y)",sep="")
	
      yBounds <- c(floor(min(Y)-2*bSample),ceiling(max(Y)+2*aSample))
	plot(X,Y,main=regTitle,xlim=c(1,10),ylim=yBounds)
	lines(c(0,10),c(aSample+bSample*(-1),aSample+bSample*10),type="l")
	cat("\n\n",trueEq,"\n",regTitle,"\n",corrCoef,"\n")
	}

chap13()
