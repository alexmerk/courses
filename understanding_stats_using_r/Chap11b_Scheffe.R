# Scheffe Post Hoc - Chapter 11

chap11 <- function() {

# Enter MS error and degrees of freedom from ANOVA table
# Enter sales data, group vectors, j = 3 groups and save as data frame

mserror <- 22.22 
dfnum <- 2
dferror <- 9

sales <- c(30,30,40,40,25,20,25,30,15,20,25,20)
store <- c(1,1,1,1,2,2,2,2,3,3,3,3)
j <- 3
data <- data.frame(sales,store)

# Group Summary Statistics 

store <- factor(store)
grpmean <- tapply(sales,store,mean)
grpsd <- round(tapply(sales,store,sd),digits=2)
N <- tapply(sales,store,length)

# One Way Analysis of Variance

out <-summary(aov(sales~store))

# Tabled F for Scheffe F comparison
 
tableF <- round(qf(.05,dfnum,dferror,lower.tail=F),digits=2) 

# Contrast Store 1 vs. Store 2

contrast1 <- (grpmean[1]-grpmean[2])
contrast1 <- contrast1 * contrast1
gpn <- 1/N[1] + 1/N[2]
scheffe1 <- contrast1 / mserror*gpn*(j-1)
scheffe1 <- round(scheffe1,digits=2)

# Contrast Store 1 vs. Store 3

contrast2 <- (grpmean[1]-grpmean[3])
contrast2 <- contrast2 * contrast2
gpn <- 1/N[1] + 1/N[3]
scheffe2 <- contrast2 / mserror*gpn*(j-1)
scheffe2 <- round(scheffe2,digits=2)

# Contrast Store 2 vs. Store 3

contrast3 <- (grpmean[2]-grpmean[3])
contrast3 <- contrast3 * contrast3
gpn <- 1/N[2] + 1/N[3]
scheffe3 <- contrast3 / mserror*gpn*(j-1)
scheffe3 <- round(scheffe3,digits=2)


print(data)
cat("\n","Group Means =",grpmean,"\n","Group SD =",grpsd,"\n","Sample Size =",N,"\n")
cat("\n","One-way Analysis of Variance Summary Table","\n")
cat("\n")
print(out)
cat("\n","Critical F for Scheffe Comparision =",tableF,"\n")
cat("\n","Scheffe Post Hoc Comparisons","\n")
cat("\n","Store 1 vs. Store 2 =",scheffe1)
cat("\n","Store 1 vs. Store 3 =",scheffe2)
cat("\n","Store 2 vs. Store 3 =",scheffe3,"\n")

}

chap11 ()


