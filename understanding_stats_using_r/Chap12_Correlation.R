# CORRELATION program - Chapter 12

# Set rho to the population correlation
# Set sampleSize for the desired number of sample points

chap12 <- function() {
	rho <- .60
	sampleSize <- 20
	
	X <- round(rnorm(sampleSize,10,3),digits=2)
	Y <- round(rnorm(length(X),0,1)*sqrt(1-rho*rho)+(5+rho*(X-10)/3),digits=2)
	
      pearson <- round(cor(X,Y),digits=2)
	rhoLabel <- paste("Population rho =",rho)
      pearsonLabel <- paste("Pearson =",pearson)

	yBounds <- c(0,ceiling(max(Y)+2))
	xBounds <- c(1,ceiling(max(X)+1))
	
      plot(X,Y,main=paste(rhoLabel,"  ",pearsonLabel),xlim=xBounds,ylim=yBounds)
	
	cat("\n","Population rho =",rho)
      cat("\n","Sample Size =",sampleSize)
      cat("\n","Pearson r =",pearson)
      cat("\n")

     }
chap12()

