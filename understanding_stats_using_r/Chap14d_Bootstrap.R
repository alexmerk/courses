# Bootstrap program - Chapter 14

# Set sampleSize to the desired sample size
# Set numBootstraps to the number of bootstraps samples to take
# Set sizeBootstraps to the size for each bootstrap sample

library(bootstrap)
sampleSize <- 100
numBootstraps <- 500

chap14 <- function() {

data <- rnorm(sampleSize,50,10)
perc95 <- function(data) {quantile(data,.95)}
results <- bootstrap(data,numBootstraps,mean,func=perc95)

obsmn <- mean(results$jack.boot.val)
bootmn <- mean(results$thetastar)
bias <- obsmn - bootmn
se <- results$jack.boot.se
ci95 <- c((bootmn - se),(bootmn + se))

cat("\n","Sample Size =",sampleSize,"\n","N Bootstraps =",numBootstraps,"\n")
cat("\n","Observed Mean = ",obsmn,"\n","Bootstrap Mean =",bootmn,"\n")
cat("\n","Bias =",bias,"\n","SE =",se,"\n")
cat("\n","95% CI = Bootstrap Mean +/- 1.96SE")
cat("\n","95% CI =","(",ci95,")")
cat("\n")
}
chap14()



