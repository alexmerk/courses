# ZDIFF-DEP - Chapter 9

# Set zCrit to the critical z value associated with the alpha level chosen
# Set num11, num12, num21, num22 as they would correspond to a 2x2 table
# in which the top left and bottom right columns represent changed outcome

chap09 <- function() {
zCrit <- 1.96  # 90%=1.645, 95%=1.96, & 99%=2.576 confidence intervals (two-tailed)
num11 <- 10
num12 <- 20
num21 <- 50
num22 <- 20

N <- num11+num12+num21+num22
P11 <- num11/N
P22 <- num22/N
P1 <- (num11 + num12)/N
P2 <- (num12 + num22)/N 
s <- round(sqrt((P11+P22)/N),4)
z <- round((P1-P2)/s,4)
C1 <- round(abs(P1-P2)-zCrit*s,4)
C2 <- round(abs(P1-P2)+zCrit*s,4)

cat("\n","Z Critical value =",zCrit,"\n")
cat("\n","First % =",P1,"Second % =",P2)
cat("\n","Difference in proportions =",(P1-P2),"\n")

cat("\n","z Statistic =",z)
cat("\n","Standard Error of Diff =",s,"\n")

cat("\n","Confidence Interval =(",C1,",",C2,")","\n")

}
chap09()
