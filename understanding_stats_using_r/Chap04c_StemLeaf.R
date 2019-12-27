# Stem and Leaf Program - Chapter 4

chap04 <- function() {

Grades1 <- c(0,15,23,27,30,31,35,37,41,44,45,47,50,55,58,59,61,61,64,64,66,68,69,70,71,71,72,72,73,74,74,85,85,85,87,88,88,88,88,90,91,92,92,92,94,94,96,98,99,100)
Grades2 <- c(30,31,36,38,42,44,45,47,50,53,53,54,56,58,58,59,61,62,63,64,65,66,67,69,70,71,72,74,75,76,77,77,80,80,83,83,85,87,88,89,91,92,93,94,95,97,97,99,100,100)

cat("\n")
cat("\n")
cat("First Data Set","\n")
cat("\n")
md1 <-median(Grades1)
print(Grades1)
cat("\n")
cat("Median =",md1) 
cat("\n\n")

Sample1 <- Grades1
LeafSpread <- 2
cat("11 Groups - First Data Set","\n")
stem(Sample1,scale=LeafSpread)
cat("\n\n")
#
Sample2 <- Grades1
LeafSpread <- 1
cat("6 Groups - First Data Set","\n")
stem(Sample2, scale=LeafSpread)
cat("\n\n")
#
cat("\n")
cat("Second Data Set","\n")
cat("\n")
md2 <-median(Grades2)
print(Grades2)
cat("\n")
cat("Median =",md2) 
cat("\n\n")
#
Sample3 <- Grades2
LeafSpread <- 2
cat("15 Groups - Second Data Set","\n")
stem(Sample3,scale=LeafSpread)
cat("\n\n")
#
Sample4 <- Grades2
LeafSpread <- 1
cat("8 Groups - Second Data Set","\n")
stem(Sample4,scale=LeafSpread)
cat("\n\n")
}
chap04()
