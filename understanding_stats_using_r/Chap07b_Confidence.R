# CONFIDENCE program - Chapter 7

# Set SampleSize to the desired sample size
# Set PopMean to the desired population mean
# Set PopStdDev to the desired population standard deviation
# Set NumReplications to the desired number of replications
# Set Zvalue to correspond to desired confidence interval percent

chap07 <- function() {
	SampleSize <- 100
	PopMean <- 50
	PopStdDev <-10
	NumReplications <- 20
	Zvalue <- 1.96    # Zvalue = 1.65 (90%), Zvalue= 1.96 (95%), or Zvalue=2.58 (99%)   
	
	NumWithinRange <- 0
	OutputVector <- NULL
	for (i in 1:NumReplications) {
			SampleData <- rnorm(SampleSize,PopMean,PopStdDev)
			SampleMean <- mean(SampleData)
			LowerInt <- SampleMean-Zvalue*PopStdDev/sqrt(SampleSize)
			UpperInt <- SampleMean+Zvalue*PopStdDev/sqrt(SampleSize)
			OutputRow <- c(round(SampleMean,digits=2),paste(round(UpperInt,digits=2),"-",round(LowerInt,digits=2)))
			OutputRow <- c(OutputRow,PopMean)
			if (PopMean>=LowerInt && PopMean<=UpperInt) {
				OutputRow <- c(OutputRow,"Yes")
				NumWithinRange <- NumWithinRange + 1
				}
			else
				{
				OutputRow <- c(OutputRow,"No")
				}
			OutputVector <- rbind(OutputVector,OutputRow)
			}
	
      cat("\n","Pop. Mean =",PopMean,"Pop. SD =",PopStdDev,"\n","Sample Size =",SampleSize,"N Replications =",NumReplications,"\n")
     
      cat("\n","Confidence Intervals for Z value = ",Zvalue)
      PercentInRange <- round(NumWithinRange/NumReplications*100)
      cat("\n","Confidence Intervals that Contain Population Mean = ",NumWithinRange,"/",NumReplications," = ",PercentInRange,"%")
     
      OutputMatrix <- matrix(OutputVector,NumReplications,4)
	dimnames(OutputMatrix) <- list(rep("",NumReplications),c("Sample Mean","CI (high - low)","Pop. Mean","Within CI"))
	cat("\n")
      cat("\n")
      print(OutputMatrix,min.colwidth=15,page.width=80,prefix.width=0,quote=F)
		
	}

chap07()		