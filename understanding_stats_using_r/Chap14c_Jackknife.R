# JACKKNIFE program - Chapter 14

# Input data values 
# Access library bootstrap that contains jackknife function

library(bootstrap)
chap14 <- function() {
	
      data <- c(10,20,30,40,50,60,70,80,90,100)
	sampleMean <- round(mean(data),digits=2)
	sampleStdDev <- round(sqrt(var(data)),digits=2)
	subsampleSize <- length(data)-1
	output <- NULL
	for (i in 1:length(data)) {
		subsample <- data[-i]
		subsampleMean <- round(mean(subsample),digits=2)
		subsampleValues <- paste(subsample,collapse=",")
		subsampleOmit <- data[i]
		output <- c(output,subsampleSize,subsampleMean,subsampleValues,subsampleOmit)
            }
	out <- matrix(output,length(data),4,byrow=T)
	dimnames(out) <- list(rep("",length(data)),c("Sample Size","Jackknife Mean","Values Used","Value Omitted"))
	
      results <- jackknife(data,mean)
     
      cat("\n","Data Values =",data,"\n")
      cat("\n","Original mean=",sampleMean,"  Original standard deviation=",sampleStdDev,"\n")
	print(out,abbreviate.dimnames=F,prefix.width=0,min.colwidth=15,quote=F)
	}

chap14()

