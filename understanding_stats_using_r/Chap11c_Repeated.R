# REPEATED Program - Chapter 11

chap11 <- function() {
	Ind1 <- c(8,9,10,12)
	Ind2 <- c(7,6,14,18)
	Ind3 <- c(9,6,15,22)
	Ind4 <- c(6,10,16,18)
	rawData <- matrix(c(Ind1,Ind2,Ind3,Ind4),4,4,byrow=T)

	matrixData <- c(length(rawData[,1]),sum(rawData[,1]),mean(rawData[,1]),
					length(rawData[,2]),sum(rawData[,2]),mean(rawData[,2]),
					length(rawData[,3]),sum(rawData[,3]),mean(rawData[,3]),
					length(rawData[,4]),sum(rawData[,4]),mean(rawData[,4]))
	descMatrix <- matrix(matrixData,3,4)
	dimnames(descMatrix) <- list(c("Samp Size","Samp Sum","Samp Mean"),c("Year 1","Year 2","Year 3","Year 4"))
	N <- length(rawData)
	TotSum <- sum(rawData)

	SST <- sum(rawData^2)-(TotSum^2)/N
	dfT <- length(rawData)-1

	IndSqrDev <- 0
	for (i in 1:length(rawData[,1])) {
		IndSqrDev <- IndSqrDev + (sum(rawData[i,])^2)/length(rawData[1,])
		}
	SSI <- IndSqrDev - (TotSum^2)/N
	dfI <- length(rawData[,1])-1
	MSI <- SSI/dfI

	YearSqrDev <- 0
	for (i in 1:length(rawData[1,])) {
		YearSqrDev <- YearSqrDev + (sum(rawData[,i])^2)/length(rawData[,1])
		}
	SSY <- YearSqrDev - (TotSum^2)/N
	dfY <- length(rawData[1,])-1
	MSY <- SSY/dfY

	SSE <- SST - SSI - SSY
	dfE <- dfT - dfI - dfY
	MSE <- SSE/dfE

	Fvalue <- MSY/MSE
	pVal <- round(1-pf(Fvalue,dfY,dfE),digits=3)
	colLabels <- c("Source","SS","df","MS","F","p")
	row1 <- c("Individual",round(c(SSI,dfI,MSI),digits=2),"","")
	row2 <- c("Year",round(c(SSY,dfY,MSY,Fvalue),digits=2),pVal)
	row3 <- c("Error",round(c(SSE,dfE,MSE),digits=2),"","")
	row4 <- c("Total",round(c(SST,dfT),digits=2),"","","")
	outputMatrix <- matrix(c(colLabels,row1,row2,row3,row4),5,6,byrow=T)
	dimnames(outputMatrix)<-list(c("","","","",""),c("","","","","",""))
	cat("\n\n")
	print(round(descMatrix,digits=2))
	cat("\nN =",N,", T =",TotSum,"\n\nRepeated Measures Analysis of Variance Table\n")
	print(outputMatrix,quote=F)
	}

chap11()