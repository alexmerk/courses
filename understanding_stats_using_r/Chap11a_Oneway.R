# ONEWAY program - Chapter 11

# GroupA is the set of scores for the first group
# GroupB is the set of scores for the second group
# GroupC is the set of scores for the third group

chap11 <- function() {
	GroupA <- c(10,12,20,16)
	GroupB <- c(16,9,7,14)
	GroupC <- c(18,14,12,26)

	matrixData <- c(length(GroupA),mean(GroupA),sqrt(var(GroupA)),
					length(GroupB),mean(GroupB),sqrt(var(GroupB)),
					length(GroupC),mean(GroupC),sqrt(var(GroupC)))
	descMatrix <- matrix(matrixData,3,3)
	dimnames(descMatrix) <- list(c("Sample Size","Sample Mean","Std Dev"),c("Group A","Group B","Group C"))

	grandMean <- mean(c(GroupA,GroupB,GroupC))
	groupMeans <- c(mean(GroupA),mean(GroupB),mean(GroupC))
	groupSampSizes <- c(length(GroupA),length(GroupB),length(GroupC))
	SSB <- sum(groupSampSizes*(groupMeans-grandMean)^2)
	dfB <- 2
	MSB <- SSB/dfB

	SSW <- sum((GroupA-mean(GroupA))^2)+sum((GroupB-mean(GroupB))^2)+sum((GroupC-mean(GroupC))^2)
	dfW <- length(GroupA)+length(GroupB)+length(GroupC)-3
	MSW <- SSW/dfW
	
	SST <- SSB+SSW
	dfT <- dfB+dfW
	
	Fvalue <- MSB/MSW
	pVal <- round(1-pf(Fvalue,dfB,dfW),digits=3)
	colLabels <- c("Source","SS","df","MS","F","p")
	row1 <- c("Between",round(c(SSB,dfB,MSB,Fvalue),digits=2),pVal)
	row2 <- c("Within",round(c(SSW,dfW,MSW),digits=2),"","")
	row3 <- c("Total",round(c(SST,dfT),digits=2),"","","")

	outputMatrix <- matrix(c(colLabels,row1,row2,row3),4,6,byrow=T)
      dimnames(outputMatrix)<- list(c("","","",""),c("","","","","",""))
	cat("\n\n")
	print(round(descMatrix,digits=2))
	cat("\nOneway Analysis of Variance Table\n")
	print(outputMatrix,quote=F)
	}
	
chap11()

