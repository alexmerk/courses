Data Visualization with ggplot2 (Part 2)
================
2018-01-18

1 Statistics
------------

``` r
# ggplot2 is already loaded

# Explore the mtcars data frame with str()
str(mtcars)
```

    ## 'data.frame':    32 obs. of  11 variables:
    ##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
    ##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
    ##  $ disp: num  160 160 108 258 360 ...
    ##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
    ##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
    ##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
    ##  $ qsec: num  16.5 17 18.6 19.4 17 ...
    ##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
    ##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
    ##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
    ##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

``` r
# A scatter plot with LOESS smooth
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-1.png)

``` r
# A scatter plot with an ordinary Least Squares linear model
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth(method="lm")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-2.png)

``` r
# The previous plot, without CI ribbon
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth(method="lm", se=FALSE)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-3.png)

``` r
# The previous plot, without points
ggplot(mtcars, aes(x = wt, y = mpg)) +
geom_smooth(method="lm", se=FALSE)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-4.png)

``` r
# 1 - Define cyl as a factor variable
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-5.png)

``` r
# 2 - Plot 1, plus another stat_smooth() containing a nested aes()
 ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  stat_smooth(method="lm", se=FALSE, aes(group=1))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-6.png)

``` r
# Plot 1: change the LOESS span
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add span below
  geom_smooth(se = FALSE, span=0.7)
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-7.png)

``` r
# Plot 2: Set the second stat_smooth() to use LOESS with a span of 0.7
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  # Change method and add span below
  stat_smooth(method = "loess", aes(group = 1),
              se = FALSE, col = "black", span=0.7)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-8.png)

``` r
# Plot 3: Set col to "All", inside the aes layer of stat_smooth()
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  stat_smooth(method = "loess",
              # Add col inside aes()
              aes(group = 1, col="All"),
              # Remove the col argument below
              se = FALSE, span = 0.7)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-9.png)

``` r
# Plot 4: Add scale_color_manual to change the colors
myColors <- c(brewer.pal(3, "Dark2"), "black")
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE, span = 0.7) +
  stat_smooth(method = "loess", 
              aes(group = 1, col="All"), 
              se = FALSE, span = 0.7) +
  # Add correct arguments to scale_color_manual
  scale_color_manual("Cylinders", values=myColors)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-10.png)

``` r
# Plot 1: Jittered scatter plot, add a linear model (lm) smooth
ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.2) +
  stat_smooth(method = "lm", se = FALSE) # smooth
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-11.png)

``` r
# Plot 2: points, colored by year
ggplot(Vocab, aes(x = education, y = vocabulary, col = year)) +
  geom_jitter(alpha = 0.2)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-12.png)

``` r
# Plot 3: lm, colored by year
ggplot(Vocab, aes(x = education, y = vocabulary, col = factor(year))) +
  stat_smooth(method = "lm", se = FALSE) # smooth
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-13.png)

``` r
# Plot 4: Set a color brewer palette
ggplot(Vocab, aes(x = education, y = vocabulary, col = factor(year))) +
  stat_smooth(method = "lm", se = FALSE) +  # smooth
  scale_color_brewer()  # colors
```

    ## Warning in RColorBrewer::brewer.pal(n, pal): n too large, allowed maximum for palette Blues is 9
    ## Returning the palette you asked for with that many colors

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-14.png)

``` r
# Plot 5: Add the group aes, specify alpha and size
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_smooth(method = "lm", se = FALSE, alpha = 0.6, size = 2) +
  scale_color_gradientn(colors = brewer.pal(9, "YlOrRd"))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-15.png)

``` r
# Use stat_quantile instead of stat_smooth
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(alpha = 0.6, size = 2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))
```

    ## Loading required package: SparseM

    ## 
    ## Attaching package: 'SparseM'

    ## The following object is masked from 'package:base':
    ## 
    ##     backsolve

    ## 
    ## Attaching package: 'quantreg'

    ## The following object is masked from 'package:Hmisc':
    ## 
    ##     latex

    ## The following object is masked from 'package:survival':
    ## 
    ##     untangle.specials

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-16.png)

``` r
# Set quantile to 0.5
ggplot(Vocab, aes(x = education, y = vocabulary, col = year, group = factor(year))) +
  stat_quantile(quantiles=0.5, alpha = 0.6, size = 2) +
  scale_color_gradientn(colors = brewer.pal(9,"YlOrRd"))
```

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

    ## Warning in rq.fit.br(wx, wy, tau = tau, ...): Solution may be nonunique

    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x
    ## Smoothing formula not specified. Using: y ~ x

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-17.png)

``` r
# Plot 1: Jittering only
p <- ggplot(Vocab, aes(x = education, y = vocabulary)) +
  geom_jitter(alpha = 0.2)

# Plot 2: Add stat_sum
p +
  stat_sum() # sum statistic
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-18.png)

``` r
# Plot 3: Set size range
p +
  stat_sum() + # sum statistic
  scale_size(range = c(1, 10)) # set size scale
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-19.png)

``` r
# Display structure of mtcars
str(mtcars)
```

    ## 'data.frame':    32 obs. of  11 variables:
    ##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
    ##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
    ##  $ disp: num  160 160 108 258 360 ...
    ##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
    ##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
    ##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
    ##  $ qsec: num  16.5 17 18.6 19.4 17 ...
    ##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
    ##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
    ##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
    ##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...

``` r
# Convert cyl and am to factors
mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am)

# Define positions
posn.d <- position_dodge(width=0.1)
posn.jd <- position_jitterdodge(jitter.width=0.1, dodge.width=0.2)
posn.j <- position_jitter(width=0.2)


# Play vector xx is available
xx <- seq(1, 100, 1)

# Function to save range for use in ggplot
gg_range <- function(x) {
  # Change x below to return the instructed values
  data.frame(ymin = min(x), # Min
             ymax = max(x)) # Max
}

gg_range(xx)
```

    ##   ymin ymax
    ## 1    1  100

``` r
# Required output
#   ymin ymax
# 1    1  100

# Function to Custom function
med_IQR <- function(x) {
  # Change x below to return the instructed values
  data.frame(y = median(x), # Median
             ymin = quantile(x)[2], # 1st quartile
             ymax = quantile(x)[4])  # 3rd quartile
}

med_IQR(xx)
```

    ##        y  ymin  ymax
    ## 25% 50.5 25.75 75.25

``` r
# Required output
#        y  ymin  ymax
# 25% 50.5 25.75 75.25


# The base ggplot command; you don't have to change this
wt.cyl.am <- ggplot(mtcars, aes(x = cyl,y = wt, col = am, fill = am, group = am))

# Add three stat_summary calls to wt.cyl.am
wt.cyl.am +
  stat_summary(geom = "linerange", fun.data = med_IQR,
               position = posn.d, size = 3) +
  stat_summary(geom = "linerange", fun.data =gg_range,
               position = posn.d, size = 3,
               alpha = 0.4) +
  stat_summary(geom = "point", fun.y = median,
               position = posn.d, size = 3,
               col = "black", shape = "X")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%201%20stat-20.png)

2 Coordinates Layer
-------------------

``` r
# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()

# Add coord_cartesian(): the proper way to zoom in
p + coord_cartesian(xlim=c(3,6))
```

    ## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-1.png)

``` r
# Complete basic scatter plot function
base.plot <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, col = Species)) +
               geom_jitter() +
               geom_smooth(method = "lm", se = FALSE)

# Plot base.plot: default aspect ratio
base.plot
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-2.png)

``` r
# Fix aspect ratio (1:1) of base.plot
base.plot + coord_equal()
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-3.png)

``` r
# Create a stacked bar plot: wide.bar
wide.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) +
              geom_bar()

# Convert wide.bar to pie chart
wide.bar +
  coord_polar(theta = "y")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-4.png)

``` r
# Create stacked bar plot: thin.bar
thin.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) +
              geom_bar(width = 0.1) +
              scale_x_continuous(limits=c(0.5,1.5))

# Convert thin.bar to "ring" type pie chart
thin.bar + 
  coord_polar(theta = "y")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-5.png)

``` r
# Code to create the cyl_am col and myCol vector
mtcars$cyl_am <- paste(mtcars$cyl, mtcars$am, sep = "_")
myCol <- rbind(brewer.pal(9, "Blues")[c(3,6,8)],
               brewer.pal(9, "Reds")[c(3,6,8)])

# Map cyl_am onto col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  # Add a manual colour scale
  scale_color_manual(values = myCol)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-6.png)

``` r
# Grid facet on gear vs. vs
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am)) +
  geom_point() +
  scale_color_manual(values = myCol) +
  facet_grid(gear ~ vs)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-7.png)

``` r
# Also map disp to size
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl_am, size=disp)) +
  geom_point() +
  scale_color_manual(values = myCol) +
  facet_grid(gear ~ vs)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%202%20coord-8.png)

2 Themes
--------

``` r
# Starting point
myBlues <- c("#9ECAE1", "#4292C6", "#08519C")
myPink <- "#FEE0D2"
myRed <- "#99000D"

z <- ggplot (mtcars, aes(x=wt, y=mpg, color=factor(cyl))) +
geom_point(size=3) +
geom_smooth(method="lm", se=FALSE) +
facet_wrap(. ~ factor(cyl), scales="free_y") +
scale_y_continuous(limits=c(10,35)) +
scale_x_continuous(limits=c(1,6)) +
scale_color_manual("Cylinders", values=myBlues)


# Plot 1: Change the plot background fill to myPink
z +
  theme(plot.background = element_rect(fill = myPink))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-1.png)

``` r
# Plot 2: Adjust the border to be a black line of size 3
z +
   # expanded from plot 1
theme(plot.background = element_rect(fill = myPink, color="black", size=3))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-2.png)

``` r
# Theme to remove all rectangles
no_panels <- theme(rect = element_blank())

# Plot 3: Combine custom themes
z +
  no_panels +
  theme(plot.background = element_rect(fill = myPink, color="black", size=3)) # from plot 2
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-3.png)

``` r
# Extend z using theme() function and 3 args
z + 
theme(panel.grid=element_blank(),
axis.line=element_line(color="red"),
axis.ticks=element_line(color="red")
)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-4.png)

``` r
# Original plot, color provided
z
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-5.png)

``` r
myRed
```

    ## [1] "#99000D"

``` r
# Extend z with theme() function and 3 args
z +
  theme(strip.text = element_text(size = 16, color = myRed),
        axis.title = element_text(color = myRed, hjust = 0, face = "italic"),
        axis.text = element_text(color = "black"))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-6.png)

``` r
# Move legend by position
z +
  theme( legend.position = c(0.85, 0.85))
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-7.png)

``` r
# Change direction
z +
  theme(legend.direction= "horizontal")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-8.png)

``` r
# Change location by name
z +
  theme(legend.position = "bottom")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-9.png)

``` r
# Remove legend entirely
z +
  theme(legend.position = "none")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-10.png)

``` r
##############
### THEMES ###
##############
z2 <- z

theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "red"),
                    axis.ticks = element_line(color = "red"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")

# Original plot
z2
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-11.png)

``` r
# Theme layer saved as an object, theme_pink
theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "red"),
                    axis.ticks = element_line(color = "red"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")
  
# 1 - Apply theme_pink to z2
z2 + theme_pink
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-12.png)

``` r
# 2 - Update the default theme, and at the same time
# assign the old theme to the object old.
old <- theme_update(panel.background = element_blank(),
             legend.key = element_blank(),
             legend.background = element_blank(),
             strip.background = element_blank(),
             plot.background = element_rect(fill = myPink, color = "black", size = 3),
             panel.grid = element_blank(),
             axis.line = element_line(color = "red"),
             axis.ticks = element_line(color = "red"),
             strip.text = element_text(size = 16, color = myRed),
             axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.text = element_text(color = "black"),
             legend.position = "none")

# 3 - Display the plot z2 - new default theme used
z2
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-13.png)

``` r
# 4 - Restore the old default theme
theme_set(old)

# Original plot
z2
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-14.png)

``` r
# Load ggthemes
library(ggthemes)

# Apply theme_tufte(), plot additional modifications
custom_theme <- theme_tufte() +
  theme(legend.position = c(0.9, 0.9),
        legend.title = element_text(
        face="italic", size = 12),
        axis.title=element_text(
        face="bold", size = 14))

# Draw the customized plot
z2 + custom_theme
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-15.png)

``` r
# Use theme set to set custom theme as default
theme_set(custom_theme)

# Plot z2 again
z2
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%203%20themes-16.png)

``` r
# Base layers
m <- ggplot(mtcars, aes(x = cyl, y = wt))

# Draw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar", fill = "skyblue") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-1.png)

``` r
# Base layers
m <- ggplot(mtcars, aes(x = cyl,y = wt, col = am, fill = am))

# Plot 1: Draw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-2.png)

``` r
# Plot 2: Set position dodge in each stat function
m +
  stat_summary(fun.y = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), 
               geom = "errorbar", width = 0.1, position = "dodge")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-3.png)

``` r
# Set your dodge posn manually
posn.d <- position_dodge(0.9)

# Plot 3: Redraw dynamite plot
m +
  stat_summary(fun.y = mean, geom = "bar", position = posn.d) +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "errorbar", width = 0.1, position = posn.d)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-4.png)

``` r
# Input mtcars.cyl
mtcars.cyl <- data.frame(cbind(c(4,6,8), c(2.289, 3.117, 4), c(0.57, 0.356, 0.76),  c(11,7,14), c(0.344, 0.219, 0.438)))
colnames(mtcars.cyl) <- c("cyl", "wt.avg", "sd", "n", "prop")

# Base layers
m <- ggplot(mtcars.cyl, aes(x = cyl, y = wt.avg))

# Plot 1: Draw bar plot with geom_bar
m + geom_bar(stat = "identity", fill = "skyblue")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-5.png)

``` r
# Plot 2: Draw bar plot with geom_col
m + geom_col(fill = "skyblue")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-6.png)

``` r
# Plot 3: geom_col with variable widths.
m + geom_col(fill = "skyblue", width = mtcars.cyl$prop)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-7.png)

``` r
# Plot 4: Add error bars
m + geom_col(fill = "skyblue", width = mtcars.cyl$prop) +
  geom_errorbar(aes(ymin = wt.avg-sd, ymax = wt.avg+sd), width=0.1)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-8.png)

``` r
# Bar chart
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "fill")
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-9.png)

``` r
# Convert bar chart to pie chart
ggplot(mtcars, aes(x = factor(1), fill = am)) +
  geom_bar(position = "fill", width=1) +
  facet_grid(. ~ cyl) + # Facets
  coord_polar(theta = "y") + # Coordinates
  theme_void() # theme
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-10.png)

``` r
# Parallel coordinates plot using GGally
library(GGally)
theme_set(theme_grey())

# All columns except am
group_by_am <- 9
my_names_am <- (1:11)[-group_by_am]

# Basic parallel plot - each variable plotted as a z-score transformation
ggparcoord(mtcars, my_names_am, groupColumn = group_by_am, alpha = 0.8)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-11.png)

``` r
# The heat map we want to replace
# Don't remove, it's here to help you!
myColors <- brewer.pal(9, "Reds")
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  facet_wrap( ~ site, ncol = 1) +
  scale_fill_gradientn(colors = myColors)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-12.png)

``` r
# Line plot; set the aes, geom and facet
ggplot(barley, aes (x=year, y=yield, col=variety, group=variety)) + 
geom_line() +
facet_wrap(~site, nrow=1) +
scale_fill_gradientn(colors = myColors)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-13.png)

``` r
# Create overlapping ribbon plot from scratch
ggplot(barley, aes(x = year, y = yield, col = site, group = site, fill = site)) +
  stat_summary(fun.y = mean, geom = "line") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1), geom = "ribbon", alpha = 0.1, col = NA)
```

![](datacamp_ggplot2_Part2_files/figure-markdown_github/Part%204%20bestprac-14.png)
