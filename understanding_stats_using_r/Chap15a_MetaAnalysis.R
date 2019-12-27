# Meta-Analysis Chapter 15

chap15 <- function() {

# Fisher = log(pvals)
# Gordon = -2*log(pvals)
options(scripen=9999)   # stops scientific notation

# Input the p-values for each study

pvals = c(.05,.01,.04)
n = length(pvals)      
chisqval = -2*sum(log(pvals))

totalP = round((1-pchisq(chisqval,2*n))*10000/10000,digits=5)
total = 1:n

out = matrix(c(total,pvals,round(log(pvals),digits=3),round(-2*log(pvals),digits=3)),n,4)
dimnames(out) = list(rep("",n),c("Study","p"," Fisher ln(p)", " Gordon et al"))

cat("\n","Fisher ln(p) versus Gordon et. al Chi-square","\n")
cat("\n") 
print(out)
cat("\n","Chi-square = ",round(chisqval,digits=3),"df = ",2*n,"p = ",totalP,"\n")

}
chap15()
