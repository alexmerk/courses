# F Curve program - Chapter 6 

# df1 is the numerator degrees of freedom
# df2 is the denominator degrees of freedom
# numReplications is the number of replications to simulate

df1 <- 2
df2 <- 9
numReplications <- 100
 
Fvalues <- rf(numReplications,df1,df2)

hist(Fvalues,nclass=10,main=(paste("F Curve with df1 =",df1,"and df2 =",df2)),xlab = "F Values",ylab="Frequency",col=0)

