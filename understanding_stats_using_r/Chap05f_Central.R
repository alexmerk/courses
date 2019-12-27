# CENTRAL program - Chapter 5

# Change SampleSize to desired sample size
# Change NumReplications to desired number of replications
# Change distType for distribution to Uniform, Normal, Exponential, Bimodal

chap05 <- function () {

par(mfrow=c(2,1))
SampleSize = 50
NumReplications = 250
distType = "Uniform" 

MeanDist = NULL
AllSamples = NULL
for (i in 1:NumReplications) {
        if (distType == "Uniform") {PopVar = 1/3; invisible(mySample <- runif(SampleSize,0,2));distLabel = "Uniform"}
        if (distType == "Normal") {PopVar = 1/9; invisible(mySample <- rnorm(SampleSize,1,sqrt(PopVar)));distLabel = "Normal"}
        if (distType == "Exponential") {PopVar = 1; invisible(mySample <- rexp(SampleSize,1));distLabel = "Exponential"}
        if (distType == "Bimodal") {PopVar = .5; invisible(mySample <- c(rnorm(as.integer(SampleSize/2),0,.75),rnorm(SampleSize-as.integer(SampleSize/2),2,.75)));distLabel = "Bimodal"}

        sampleMean = mean(mySample)
        MeanDist = c(MeanDist,sampleMean)
        AllSamples = c(AllSamples,mySample)
        }

cat("\n")
cat("\n")
cat("PROGRAM OUTPUT","\n")
cat("\n")

Inputvalues = c(SampleSize,NumReplications,distType)
names(Inputvalues)= c("Sample Size","Number Replications","Distribution Type")
Input = data.frame(Inputvalues)
print(Input)
cat("\n")
cat("\n")

cat("Sampling Distribution Mean =",mean(MeanDist)," Variance =",var(MeanDist),"\n")
cat(distType,"Distribution Mean =",mean(mySample)," Variance",var(mySample),"\n")


hist(MeanDist,breaks=(seq(floor(min(MeanDist)*10)/10,ceiling(max(MeanDist)*10)/10,.05)),main=paste("Sampling Distribution of the Means (",distLabel,")",sep=""),ylab="Frequency of means",xlab="Means")
hist(AllSamples,breaks=(seq(floor(min(AllSamples)*10)/10,ceiling(max(AllSamples)*10)/10,.1)),main=paste("Population Distribution (",distLabel," Distribution)",sep=""),ylab="Frequency",xlab="Means")
}
chap05()

