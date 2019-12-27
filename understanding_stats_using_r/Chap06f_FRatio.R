# F ratio program - Chapter 6
#
# sampSize1 is the size of the first sample
# variance1 is the variance of the first sample
# sampSize2 is the size of the second sample
# variance2 is the variance of the second sample
# alpha is the desired alpha level

chap06 <- function() {
	sampSize1 <- 20
	variance1 <- 10
	sampSize2 <- 20
	variance2 <- 10
	alpha <- .01
	
	Fratio <- variance1/variance2
	FratioStr <- paste(variance1,"/",variance2," = ",round(Fratio,digits=2),sep="")
	Fcrit <- qf(1-alpha,sampSize1-1,sampSize2-1)
	decision <- "accept"
	if (Fratio>Fcrit) {decision <- "reject"}

      rnames <-c("")
      cnames <-c("F ratio","Tabled F","Decision")

	outputMatrix <- matrix(c(FratioStr,round(Fcrit,digits=2),decision),1,3,dimnames=list(rnames,cnames))
	
     cat("\n","Sample 1: Size =",sampSize1,"Variance =",variance1,"\n","Sample 2: Size =",sampSize2,"Variance =",variance2,"\n","alpha =",alpha,"\n\n")
	print(outputMatrix,quote=F)
	}

chap06()

