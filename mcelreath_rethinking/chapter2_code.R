# Chapter 2


# define grid with npoints
npoints <-30
p_grid <- seq(from=0, to=1, length.out=npoints)
# define flat prior
prior <- rep(0.5, npoints)
# compute likelihood at each value in grid (3 cases)
lh1 <- dbinom(3, size=3, prob=p_grid)
lh2 <- dbinom(3, size=4, prob=p_grid)
lh3 <- dbinom(5, size=7, prob=p_grid)
# compute product of lh and prior
unstd.post1 <- lh1*prior
unstd.post2 <- lh2*prior
unstd.post3 <- lh3*prior
# standardize the posterior, so it sums to 1
p1 <- unstd.post1/sum(unstd.post1)
p2 <- unstd.post2/sum(unstd.post2)
p3 <- unstd.post3/sum(unstd.post3)
# plotting posteriors
dev.new()
par(mar=c(2,2,2,2))
par(mfrow=c(3,1))
plot(p_grid, p1, type="b",
     xlab="probabilty of water", ylab="posterior probability")
plot(p_grid, p2, type="b",
     xlab="probabilty of water", ylab="posterior probability")
plot(p_grid, p3, type="b",
     xlab="probabilty of water", ylab="posterior probability")
 

### Exercise 2M.2
# Recalculating prior grid such that:
npoints = 40
p_grid <- seq(from=0, to=1, length.out=npoints)
prior <- ifelse(p_grid<0.5, 0, 1)
# Repeating the steps above for plotting
# compute likelihood at each value in grid (3 cases)
lh1 <- dbinom(3, size=3, prob=p_grid)
lh2 <- dbinom(3, size=4, prob=p_grid)
lh3 <- dbinom(5, size=7, prob=p_grid)
# compute product of lh and prior
unstd.post1 <- lh1*prior
unstd.post2 <- lh2*prior
unstd.post3 <- lh3*prior
# standardize the posterior, so it sums to 1
p1 <- unstd.post1/sum(unstd.post1)
p2 <- unstd.post2/sum(unstd.post2)
p3 <- unstd.post3/sum(unstd.post3)
# plotting
dev.new()
par(mar=c(2,2,2,2))
par(mfrow=c(3,1))
plot(p_grid, p1, type="b",
     xlab="probabilty of water", ylab="posterior probability")
plot(p_grid, p2, type="b",
     xlab="probabilty of water", ylab="posterior probability")
plot(p_grid, p3, type="b",
     xlab="probabilty of water", ylab="posterior probability")
 dev.off()
