# ZDIFF-IND - Chapter 9

# Set zCrit to the critical z value associated with the alpha level chosen
# Set size1 to first sample size and size2 to second sample size
# Set num1 to number of positive cases in first sample and num2 for second sample

chap09 <- function() {

zCrit <- 1.96  # 90%=1.645, 95%=1.96, & 99%=2.576 confidence intervals (two-tailed)
size1 <- 20000
size2 <- 1000
num1 <- 5000
num2 <- 150

P1 <- (num1/size1)
P2 <- (num2/size2)
N <- size1+size2
p <- (num1+num2)/N
q <- 1-p
s <- round(sqrt(p*q/N),4)
Z <- round((P1-P2)/s,4)
C1 <- round(abs(P1-P2)-zCrit*s,4)
C2 <- round(abs(P1-P2)+zCrit*s,4)

cat("\n","Sample1 = ",size1,"Sample2 =",size2)
cat("\n","N1 = ",num1,"      N2 =",num2,"\n")
cat("\n","Z critical =",zCrit,"\n")

cat("\n","Difference in proportions =",(P1-P2))
cat("\n","Standard Error of Diff =",s,"\n")
cat("\n","z Statistic =",Z)
cat("\n","Confidence Intervals =","(",C1,",",C2,")","\n")
 }

chap09 ()
