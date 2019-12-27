# COMBINATION program - Chapter 4
# Change CenterTwo to any number between 4 and 12
# Change SampleSize vector to the size for each subpopulation

chap04 <- function() {
	CenterTwo <- 9
	SampleSize <- c(250,250)
	
	Population1 <- rnorm(SampleSize[1],4,1)
	invisible(round(Population1,digits=2))
	Population2 <- rnorm(SampleSize[2],CenterTwo,1)
	invisible(round(Population2,digits=2))
	CombinedPopulation <- c(Population1,Population2)
	
	FreqPop <- table(cut(CombinedPopulation,breaks=seq(0,ceiling(max(CombinedPopulation)),.5)))
	BinStartSeq <- format(seq(0,ceiling(max(CombinedPopulation))-.5,.5),nsmall=1)
	BinEndSeq <- format(seq(.5,ceiling(max(CombinedPopulation)),.5),nsmall=1)
	
	hist(CombinedPopulation,main="Histogram of Two Combined Populations",density=-1)
	
	FreqPopTable <- matrix(FreqPop,length(FreqPop),1,dimnames=list(paste(BinStartSeq,"-",BinEndSeq),"  Rel Freq"))
	options(length=10000)
	cat("\n\n")
	print(FreqPopTable)
	}

chap04()