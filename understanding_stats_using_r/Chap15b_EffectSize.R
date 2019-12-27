# Effect Size Program Chapter 15

chap15 <- function() {
options(scripen = 999)  # stops scientific notation

N = c(42,27,100,22)
df = c(40,25,1,20)
pvals = c(.005,.025,.05,.01)
t = 2.70
F = 4.24
C = 3.84
r = .492
n = length(pvals)

values = c(t,F,C,r)
type = c("t","F","Chisq","r")

 test1 = function(t) { rValues = c(sqrt(t^2/(t^2+df[1]))) }
 test2 = function(F) { rValues = c(sqrt(F/(F+df[2])))     }
 test3 = function(C) { rValues = c(sqrt(C/N[3]))          }
 test4 = function(r) { rValues = c(r)                     }

a = test1(t); b = test2(F); c = test3(C); d = test4(r)

rValues = round(c(a,b,c,d),digits=3)
dValues = round((2*rValues)/sqrt(1-rValues^2),digits=3)
wValues = round((2*N)/(8+dValues^2),digits=3)
rEffect = round(sum(rValues)/n,digits=3)
dEffect = round(sum(dValues)/n,digits=3)
dUnbiased = round(sum(wValues*dValues)/sum(wValues),digits=3)
samplebias = round(dEffect - dUnbiased, digits=3)

out = matrix(c(type,values,N,df,pvals,rValues,dValues,wValues),nrow=4,ncol=8, dimnames = list(c("","","",""),c("Type","Statistic","N","df","p","r","d","w")))

cat("\n","Effect Size r and d","\n")
cat("\n")
print(out,quote=FALSE)
cat("\n")
cat("\n", "Effect size(r) = ",rEffect," Effect size(d) = ",dEffect,"\n")
cat("\n", "Unbiased effect size(d) = ",dUnbiased,"\n")
cat("\n", "Sample Size bias = ",samplebias,"\n")

}
chap15()
  
