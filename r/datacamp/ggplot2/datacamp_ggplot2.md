Data Visualization with ggplot2 (Part 1)
================
2018-01-15

    ## Loading required package: carData

1 Introduction
--------------

``` r
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
# Execute the following command
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-1.png)

``` r
# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-2.png)

``` r
## Adding layers
ggplot(mtcars, aes(x = factor(cyl), y = mpg, color=disp)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-3.png)

``` r
ggplot(mtcars, aes(x = factor(cyl), y = mpg, size=disp)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-4.png)

``` r
# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()
```

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-5.png)

``` r
# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-6.png)

``` r
# Add the same geom layer, but with aes() inside
dia_plot + geom_point(aes(color = clarity))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-7.png)

``` r
# 1 - The dia_plot object has been created for you
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# 2 - Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot <- dia_plot + geom_point(alpha=0.2)

# 3 - Plot dia_plot with additional geom_smooth() with se set to FALSE
dia_plot + geom_smooth(se = FALSE)
```

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-8.png)

``` r
# 4 - Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot + geom_smooth(aes(color = clarity), se = FALSE)
```

    ## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'

![](datacamp_ggplot2_files/figure-markdown_github/Part%201%20Intro-9.png)

2 Data
------

``` r
# In this exercise you'll recreate the base package plot in ggplot2.

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 1
  geom_smooth(method=lm, se=FALSE) 
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-1.png)

``` r
# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-2.png)

``` r
# Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 1
  geom_smooth(method=lm, se=FALSE)   # Fill in using instructions Plot 2
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-3.png)

``` r
# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 2
  geom_smooth(method=lm, se=FALSE) + # Copy from Plot 2
  geom_smooth(method=lm, se=FALSE, linetype=2, aes(group=1))   
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-4.png)

``` r
# Consider the structure of iris, iris.wide and iris.tidy (in that order)
str(iris)
```

    ## 'data.frame':    150 obs. of  6 variables:
    ##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
    ##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
    ##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
    ##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
    ##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Flower      : int  1 2 3 4 5 6 7 8 9 10 ...

``` r
str(iris.wide)
```

    ## 'data.frame':    300 obs. of  5 variables:
    ##  $ Species: Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Flower : int  1 1 2 2 3 3 4 4 5 5 ...
    ##  $ Part   : chr  "Petal" "Sepal" "Petal" "Sepal" ...
    ##  $ Length : num  1.4 5.1 1.4 4.9 1.3 4.7 1.5 4.6 1.4 5 ...
    ##  $ Width  : num  0.2 3.5 0.2 3 0.2 3.2 0.2 3.1 0.2 3.6 ...

``` r
str(iris.tidy)
```

    ## 'data.frame':    600 obs. of  4 variables:
    ##  $ Species: Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Part   : chr  "Sepal" "Sepal" "Sepal" "Sepal" ...
    ##  $ Measure: chr  "Length" "Length" "Length" "Length" ...
    ##  $ Value  : num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...

``` r
# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-5.png)

``` r
# Fill in the ___ to produce the plot given to the right
ggplot(iris.wide, aes(x = Length, y = Width, color = Part)) +
  geom_jitter() +
  facet_grid(. ~ Species)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%202%20Data-6.png)

3 Aesthetics
------------

### 3.1 All about aesthetics

``` r
# 1 - Map mpg to x and cyl to y
ggplot(mtcars, aes(x=mpg, y=cyl)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-1.png)

``` r
# 2 - Reverse: Map cyl to x and mpg to y
ggplot(mtcars, aes(x=cyl, y=mpg)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-2.png)

``` r
# 3 - Map wt to x, mpg to y and cyl to col
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-3.png)

``` r
# 4 - Change shape and size of the points in the above plot
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) +
  geom_point(shape=1, size=4)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-4.png)

``` r
# am and cyl are factors, wt is numeric
class(mtcars$am)
```

    ## [1] "numeric"

``` r
class(mtcars$cyl)
```

    ## [1] "factor"

``` r
class(mtcars$wt)
```

    ## [1] "numeric"

``` r
# From the previous exercise
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-5.png)

``` r
# 1 - Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-6.png)

``` r
# 2 - Change shape and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha=0.6)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-7.png)

``` r
# 3 - Map am to col in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = am, fill=cyl)) +
  geom_point(shape = 21, size = 4, alpha=0.6)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.1%20aes-8.png)

### 3.2 All about attributes

``` r
# Define a hexadecimal color
my_color <- "#4ABEFF"

# Draw a scatter plot with color *aesthetic*
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-1.png)

``` r
# Same, but set color *attribute* in geom layer 
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(color=my_color)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-2.png)

``` r
# Set the fill aesthetic; color, size and shape attributes
ggplot(mtcars, aes(x=wt, y=mpg, fill=cyl)) + geom_point(size=10, shape=23, color=my_color)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-3.png)

``` r
# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(alpha=0.5)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-4.png)

``` r
# Expand to draw points with shape 24 and color yellow
#[This is so bad to read...]
ggplot(mtcars, aes(x = wt, y = mpg, fill=cyl)) + geom_point(shape=24, color="yellow")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-5.png)

``` r
# Expand to draw text with label rownames(mtcars) and color red
#[This one too...]
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + 
geom_text(label=rownames(mtcars), color='red')
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-6.png)

``` r
# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x=mpg, y=qsec, color=factor(cyl))) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-7.png)

``` r
# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x=mpg, y=qsec, color=factor(cyl), shape=factor(am))) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-8.png)

``` r
# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x=mpg, y=qsec, color=factor(cyl), shape=factor(am), size=(hp/wt) )) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.2%20aes-9.png)

### 3.3 Tweaking scales

``` r
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))

cyl.am + 
  geom_bar(position="stack")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-1.png)

``` r
# Fill - show proportion
cyl.am + 
  geom_bar(position = "fill")  
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-2.png)

``` r
# The base layer, cyl.am, is available for you
# Add geom (position = "stack" by default)
cyl.am + 
  geom_bar()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-3.png)

``` r
# Fill - show proportion
cyl.am + 
  geom_bar(position = "fill")  
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-4.png)

``` r
# Dodging - principles of similarity and proximity
cyl.am +
  geom_bar(position = "dodge") 
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-5.png)

``` r
# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab) 
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-6.png)

``` r
### UNIVARIATE PLOTS 
# 1 - Create jittered plot of mtcars, mpg onto x, 0 onto y
ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_jitter()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-7.png)

``` r
# 2 - Add function to change y axis limits
ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_jitter() + scale_y_continuous(limits=c(-2,2))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-8.png)

``` r
### Dealing with overplotting
# Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-9.png)

``` r
# Hollow circles - an improvement
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4, shape=1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-10.png)

``` r
# Add transparency - very nice
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point(size=4, shape=1, alpha=0.6)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-11.png)

``` r
# Scatter plot: carat (x), price (y), clarity (color)
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-12.png)

``` r
# Adjust for overplotting
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point(alpha=0.5)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-13.png)

``` r
# Scatter plot: clarity (x), carat (y), price (color)
ggplot(diamonds, aes(x=clarity, y=carat, color=price)) + geom_point(alpha=0.5)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-14.png)

``` r
# Dot plot with jittering
ggplot(diamonds, aes(x=clarity, y=carat, color=price)) + geom_point(alpha=0.5, position="jitter")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%203.3%20aes-15.png)

Part 4 Geometries

### 4.1 Scatter plots

``` r
# Shown in the viewer:
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-1.png)

``` r
# Solutions:
# 1 - With geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-2.png)

``` r
# 2 - Set width in geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter(width=0.1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-3.png)

``` r
# 3 - Set position = position_jitter() in geom_point() ()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter(position=position_jitter(0.1))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-4.png)

``` r
# Examine the structure of Vocab
str(Vocab)
```

    ## 'data.frame':    30351 obs. of  4 variables:
    ##  $ year      : num  1974 1974 1974 1974 1974 ...
    ##  $ sex       : Factor w/ 2 levels "Female","Male": 2 2 1 1 1 2 2 2 1 1 ...
    ##  $ education : num  14 16 10 10 12 16 17 10 12 11 ...
    ##  $ vocabulary: num  9 9 9 5 8 8 9 5 3 5 ...
    ##  - attr(*, "na.action")= 'omit' Named int  1 2 3 4 5 6 7 8 9 10 ...
    ##   ..- attr(*, "names")= chr  "19720001" "19720002" "19720003" "19720004" ...

``` r
# Basic scatter plot of vocabulary (y) against education (x). Use geom_point()
ggplot(Vocab, aes(x=education, y=vocabulary)) + geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-5.png)

``` r
# Use geom_jitter() instead of geom_point()
ggplot(Vocab, aes(x=education, y=vocabulary)) + geom_jitter()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-6.png)

``` r
# Using the above plotting command, set alpha to a very low 0.2
ggplot(Vocab, aes(x=education, y=vocabulary)) + geom_jitter(alpha=0.2)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-7.png)

``` r
# Using the above plotting command, set the shape to 1
ggplot(Vocab, aes(x=education, y=vocabulary)) + geom_jitter(alpha=0.2, shape=1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.1%20scatter-8.png)

### 4.2 Bar plots and histograms

``` r
# 1 - Make a univariate histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-1.png)

``` r
# 2 - Plot 1, plus set binwidth to 1 in the geom layer
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-2.png)

``` r
# 3 - Plot 2, plus MAP ..density.. to the y aesthetic (i.e. in a second aes() function)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1, aes(y=..density..))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-3.png)

``` r
# 4 - plot 3, plus SET the fill attribute to "#377EB8"
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1, fill="#377EB8", aes(y=..density..))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-4.png)

``` r
# Converting cyl and am into factors
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)

# Draw a bar plot of cyl, filled according to am
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-5.png)

``` r
# Change the position argument to stack
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="stack")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-6.png)

``` r
# Change the position argument to fill
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="fill")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-7.png)

``` r
# Change the position argument to dodge
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="dodge")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-8.png)

``` r
# 1 - The last plot form the previous exercise
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "dodge")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-9.png)

``` r
# 2 - Define posn_d with position_dodge()
posn_d <- position_dodge(width=0.2)

# 3 - Change the position argument to posn_d
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = posn_d)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-10.png)

``` r
# 4 - Use posn_d as position and adjust alpha to 0.6
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = posn_d, alpha =0.6)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-11.png)

``` r
# A basic histogram, add coloring defined by cyl
ggplot(mtcars, aes(mpg, fill=cyl)) +
  geom_histogram(binwidth = 1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-12.png)

``` r
# Change position to identity
ggplot(mtcars, aes(mpg, fill=cyl)) +
  geom_histogram(binwidth = 1, position="identity")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-13.png)

``` r
# Change geom to freqpoly (position is identity by default)
ggplot(mtcars, aes(mpg, color=cyl)) +
  geom_freqpoly(binwidth = 1)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-14.png)

``` r
# Use str() on Vocab to check out the structure
Vocab$education <- as.factor(Vocab$education)
Vocab$vocabulary <- as.factor(Vocab$vocabulary)
str(Vocab)
```

    ## 'data.frame':    30351 obs. of  4 variables:
    ##  $ year      : num  1974 1974 1974 1974 1974 ...
    ##  $ sex       : Factor w/ 2 levels "Female","Male": 2 2 1 1 1 2 2 2 1 1 ...
    ##  $ education : Factor w/ 21 levels "0","1","2","3",..: 15 17 11 11 13 17 18 11 13 12 ...
    ##  $ vocabulary: Factor w/ 11 levels "0","1","2","3",..: 10 10 10 6 9 9 10 6 4 6 ...
    ##  - attr(*, "na.action")= 'omit' Named int  1 2 3 4 5 6 7 8 9 10 ...
    ##   ..- attr(*, "names")= chr  "19720001" "19720002" "19720003" "19720004" ...

``` r
# Example of how to use a brewed color palette
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-15.png)

``` r
# Plot education on x and vocabulary on fill
# Use the default brewed color palette
ggplot(Vocab, aes(x = education, fill = vocabulary)) + geom_bar(position="fill") +
scale_fill_brewer(palette = "Set1")
```

    ## Warning in RColorBrewer::brewer.pal(n, pal): n too large, allowed maximum for palette Set1 is 9
    ## Returning the palette you asked for with that many colors

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-16.png)

``` r
blues <- brewer.pal(9, "Blues") # from the RColorBrewer package

# 1 - Make a color range using colorRampPalette() and the set of blues
blue_range <- colorRampPalette(blues)

# 2 - Use blue_range to adjust the color of the bars, use scale_fill_manual()
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values=blue_range(11))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%204.2%20barhist-17.png)

### Part 5 qplot(), wrapping uo

``` r
# The old way (shown)
plot(mpg ~ wt, data = mtcars) # formula notation
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-1.png)

``` r
with(mtcars, plot(wt, mpg)) # x, y notation
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-2.png)

``` r
# Using ggplot:
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point()
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-3.png)

``` r
# Using qplot:
qplot(wt, mpg, data = mtcars)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-4.png)

``` r
# basic qplot scatter plot:
qplot(wt, mpg, data = mtcars)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-5.png)

``` r
# Categorical variable mapped onto size:
# cyl
qplot(wt, mpg, data = mtcars, size = factor(cyl))
```

    ## Warning: Using size for a discrete variable is not advised.

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-6.png)

``` r
# gear
qplot(wt, mpg, data = mtcars, size = factor(gear))
```

    ## Warning: Using size for a discrete variable is not advised.

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-7.png)

``` r
# Continuous variable mapped onto col:
# hp
qplot(wt, mpg, data = mtcars, col = hp)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-8.png)

``` r
# qsec
qplot(wt, mpg, data = mtcars, col = qsec)
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-9.png)

``` r
# qplot() with x only
qplot(data=mtcars, x=factor(cyl))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-10.png)

``` r
# qplot() with x and y
qplot(data=mtcars, x=factor(cyl), y=factor(vs))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-11.png)

``` r
# qplot() with geom set to jitter manually
qplot(data=mtcars, x=factor(cyl), y=factor(vs), geom="jitter")
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-12.png)

``` r
# cyl and am are factors, wt is numeric
class(mtcars$cyl)
```

    ## [1] "factor"

``` r
class(mtcars$am)
```

    ## [1] "factor"

``` r
class(mtcars$wt)
```

    ## [1] "numeric"

``` r
# "Basic" dot plot, with geom_point():
ggplot(mtcars, aes(cyl, wt, col = am)) +
  geom_point(position = position_jitter(0.2, 0))
```

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-13.png)

``` r
# 1 - "True" dot plot, with geom_dotplot():
ggplot(mtcars, aes(cyl, wt, fill = am)) +
  geom_dotplot(binaxis = "y", stackdir = "center")
```

    ## `stat_bindot()` using `bins = 30`. Pick better value with `binwidth`.

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-14.png)

``` r
# 2 - qplot with geom "dotplot", binaxis = "y" and stackdir = "center"
qplot(
  cyl, wt,
  data = mtcars,
  fill = am,
  geom = "dotplot",
  binaxis = "y",
  stackdir = "center"
)
```

    ## `stat_bindot()` using `bins = 30`. Pick better value with `binwidth`.

![](datacamp_ggplot2_files/figure-markdown_github/Part%205%20qplot-15.png)
