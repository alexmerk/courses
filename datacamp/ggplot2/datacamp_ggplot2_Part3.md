Data Visualization with ggplot2 (Part 3)
================
2019-01-30

1 Statistical Plots
-------------------

``` r
# Create movies_small
set.seed(123)
movies_small <- movies[sample(nrow(movies), 1000), ]
movies_small$rating <- factor(round(movies_small$rating))

# Explore movies_small with str()
str(movies_small)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    1000 obs. of  24 variables:
    ##  $ title      : chr  "Fair and Worm-er" "Shelf Life" "House: After Five Years of Living" "Three Long Years" ...
    ##  $ year       : int  1946 2000 1955 2003 1963 1992 1999 1972 1994 1985 ...
    ##  $ length     : int  7 4 11 76 103 107 87 84 127 94 ...
    ##  $ budget     : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ rating     : Factor w/ 10 levels "1","2","3","4",..: 7 7 6 8 8 5 4 8 5 5 ...
    ##  $ votes      : int  16 11 15 11 103 28 105 9 37 28 ...
    ##  $ r1         : num  0 0 14.5 4.5 4.5 4.5 14.5 0 4.5 4.5 ...
    ##  $ r2         : num  0 0 0 0 4.5 0 4.5 0 4.5 0 ...
    ##  $ r3         : num  0 0 4.5 4.5 0 4.5 4.5 0 14.5 4.5 ...
    ##  $ r4         : num  0 0 4.5 0 4.5 4.5 4.5 0 4.5 14.5 ...
    ##  $ r5         : num  4.5 4.5 0 0 4.5 0 4.5 14.5 24.5 4.5 ...
    ##  $ r6         : num  4.5 24.5 34.5 4.5 4.5 0 14.5 0 4.5 14.5 ...
    ##  $ r7         : num  64.5 4.5 24.5 0 14.5 4.5 14.5 14.5 14.5 14.5 ...
    ##  $ r8         : num  14.5 24.5 4.5 4.5 14.5 24.5 14.5 24.5 14.5 14.5 ...
    ##  $ r9         : num  0 0 0 14.5 14.5 24.5 14.5 14.5 4.5 4.5 ...
    ##  $ r10        : num  14.5 24.5 14.5 44.5 44.5 24.5 14.5 44.5 4.5 24.5 ...
    ##  $ mpaa       : chr  "" "" "" "" ...
    ##  $ Action     : int  0 0 0 0 0 0 0 0 0 0 ...
    ##  $ Animation  : int  1 0 0 0 0 0 0 0 0 0 ...
    ##  $ Comedy     : int  1 0 0 1 0 1 1 1 0 0 ...
    ##  $ Drama      : int  0 0 0 0 1 0 0 0 1 1 ...
    ##  $ Documentary: int  0 0 1 0 0 0 0 0 0 0 ...
    ##  $ Romance    : int  0 0 0 0 0 0 1 0 0 0 ...
    ##  $ Short      : int  1 1 1 0 0 0 0 0 0 0 ...

``` r
# Build a scatter plot with mean and 95% CI
ggplot(movies_small, aes(x = rating, y = votes)) +
  geom_point() +
  stat_summary(fun.data = "mean_cl_normal",
               geom = "crossbar",
               width = 0.2,
               col = "red") +
  scale_y_log10()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-1.png)

``` r
# Reproduce the plot
ggplot(diamonds, aes(x = carat, y = price, col = color)) +
  geom_point(alpha=0.5, size=0.5, shape=16) +
  scale_x_log10(expression(log[10](Carat)), limits = c(0.1,10)) +
  scale_y_log10(expression(log[10](Price)), limits = c(100, 100000)) +
  scale_color_brewer(palette = "YlOrRd") +
  coord_equal() +
  theme_classic()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-2.png)

``` r
# Add smooth layer and facet the plot
ggplot(diamonds, aes(x = carat, y = price, col = color)) +
  stat_smooth(method="lm") +
  scale_x_log10(expression(log[10](Carat)), limits = c(0.1,10)) +
  scale_y_log10(expression(log[10](Price)), limits = c(100,100000)) +
  scale_color_brewer(palette = "YlOrRd") +
  coord_equal() +
  theme_classic()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-3.png)

``` r
# movies_small is available

# Add a boxplot geom
d <- ggplot(movies_small, aes(x = rating, y = votes)) +
  geom_point() +
  geom_boxplot() +
  stat_summary(fun.data = "mean_cl_normal",
               geom = "crossbar",
               width = 0.2,
               col = "red")

# Untransformed plot
d
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-4.png)

``` r
# Transform the scale
d + scale_y_log10()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-5.png)

``` r
# Transform the coordinates
#d + coord_trans(y= "log10")

# Plot object p
p <- ggplot(diamonds, aes(x = carat, y = price))

# Use cut_interval
p + geom_boxplot(aes(group = cut_interval(carat, n=10)))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-6.png)

``` r
# Use cut_number
p + geom_boxplot(aes(group = cut_number(carat, n=10)))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-7.png)

``` r
# Use cut_width
p + geom_boxplot(aes(group = cut_width(carat, width=0.25)))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-8.png)

``` r
#test_data is available

# Calculating density: d
d <- density(test_data$norm)

# Use which.max() to calculate mode
mode <- d$x[which.max(d$y)]

# Finish the ggplot call
ggplot(test_data, aes(x = norm)) +
  geom_rug() +
  geom_density() +
  geom_vline(xintercept = mode, col = "red")
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-9.png)

``` r
# test_data is available

# Arguments you'll need later on
fun_args <- list(mean = mean(test_data$norm), sd = sd(test_data$norm))

# Finish the ggplot
ggplot(test_data, aes(x = norm)) +
geom_histogram(aes(y=..density..)) +
geom_density(col="red") +
stat_function(fun=dnorm, args=fun_args, col="blue")
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-10.png)

``` r
# small_data is available

# Get the bandwith
get_bw <- density(small_data$x)$bw

# Basic plotting object
p <- ggplot(small_data, aes(x = x)) +
  geom_rug() +
  coord_cartesian(ylim = c(0,0.5))

# Create three plots
p + geom_density()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-11.png)

``` r
p + geom_density(adjust=0.25)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-12.png)

``` r
p + geom_density(bw=0.25*get_bw)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-13.png)

``` r
# Create two plots
p + geom_density(kernel="r")
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-14.png)

``` r
p + geom_density(kernel="e")
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-15.png)

``` r
# Finish the plot
ggplot(diamonds, aes(x = cut, y = price, col=color)) +
geom_boxplot(varwidth=TRUE) +
facet_grid(.~color)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-16.png)

``` r
# Individual densities
ggplot(mammals[mammals$vore == "Insectivore", ], aes(x = sleep_total, fill = vore)) +
  geom_density(col = NA, alpha = 0.35) +
  scale_x_continuous(limits = c(0, 24)) +
  coord_cartesian(ylim = c(0, 0.3))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-17.png)

``` r
# With faceting
ggplot(mammals, aes(x = sleep_total, fill = vore)) +
  geom_density(col = NA, alpha = 0.35) +
  scale_x_continuous(limits = c(0, 24)) +
  coord_cartesian(ylim = c(0, 0.3)) +
  facet_wrap( ~ vore, nrow=2)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-18.png)

``` r
# Note that by default, the x ranges fill the scale
ggplot(mammals, aes(x = sleep_total, fill = vore)) +
  geom_density(col = NA, alpha = 0.35) +
  scale_x_continuous(limits = c(0, 24)) +
  coord_cartesian(ylim = c(0, 0.3))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-19.png)

``` r
# Trim each density plot individually
ggplot(mammals, aes(x = sleep_total, fill = vore)) +
  geom_density(col = NA, alpha = 0.35, trim = TRUE) +
  scale_x_continuous(limits=c(0,24)) +
  coord_cartesian(ylim = c(0, 0.3))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-20.png)

``` r
# Base layers
p <- ggplot(faithful, aes(x = waiting, y = eruptions)) +
  scale_y_continuous(limits = c(1, 5.5), expand = c(0, 0)) +
  scale_x_continuous(limits = c(40, 100), expand = c(0, 0)) +
  coord_fixed(60 / 4.5)

# 1 - Use geom_density_2d()
p + geom_density_2d()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-21.png)

``` r
# 2 - Use stat_density_2d() with arguments
p + stat_density_2d(aes(col = ..level..), h = c(5, 0.5))
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-22.png)

``` r
ggplot(faithful, aes(x = waiting, y = eruptions)) +
  scale_y_continuous(limits = c(1, 5.5), expand = c(0,0)) +
  scale_x_continuous(limits = c(40, 100), expand = c(0,0)) +
  coord_fixed(60/4.5) +
  stat_density_2d(geom = "tile", aes(fill = ..density..), h=c(5,.5), contour = FALSE) +
  scale_fill_viridis()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%201%20statplots-23.png)

2 Graphics of Large Data
------------------------

``` r
# pairs
pairs(iris[1:4])
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-1.png)

``` r
# chart.Correlation
library(PerformanceAnalytics)
chart.Correlation(iris[1:4])
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-2.png)

``` r
# ggpairs
library(GGally)
mtcars_fact <- mtcars
mtcars_fact$cyl <- as.factor(mtcars_fact$cyl)
ggpairs(mtcars_fact[1:3])
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-3.png)

``` r
africa_sample <- africa[6220:6269,]
africa_sample$ID <- rownames(africa_sample)

library(tidyr)
africa_sample_tidy <- gather(africa_sample, key, value, -ID)
head(africa_sample_tidy)
```

    ##     ID  key value
    ## 1 6220 Sand    46
    ## 2 6221 Sand    35
    ## 3 6222 Sand    80
    ## 4 6223 Sand    77
    ## 5 6224 Sand    65
    ## 6 6225 Sand    83

``` r
# Gather africa_sample

africa_sample_tidy <- gather(africa_sample, key, value, -ID)
head(africa_sample_tidy)
```

    ##     ID  key value
    ## 1 6220 Sand    46
    ## 2 6221 Sand    35
    ## 3 6222 Sand    80
    ## 4 6223 Sand    77
    ## 5 6224 Sand    65
    ## 6 6225 Sand    83

``` r
# Finish the ggplot command
ggplot(africa_sample_tidy, aes(x = factor(ID), y = value, fill = key)) +
  geom_col() +
  coord_flip()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-4.png)

``` r
# Load ggtern
library(ggtern)
```

    ## --
    ## Remember to cite, run citation(package = 'ggtern') for further info.
    ## --

    ## 
    ## Attaching package: 'ggtern'

    ## The following objects are masked from 'package:ggplot2':
    ## 
    ##     %+%, aes, annotate, calc_element, ggplot, ggplot_build,
    ##     ggplot_gtable, ggplotGrob, ggsave, layer_data, theme,
    ##     theme_bw, theme_classic, theme_dark, theme_gray, theme_light,
    ##     theme_linedraw, theme_minimal, theme_void

``` r
# Build ternary plot
ggtern(africa, aes(x = Sand, y = Silt, z = Clay)) +
  geom_point(shape=16, alpha=0.2)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-5.png)

``` r
# Plot 1
ggtern(africa, aes(x = Sand, y = Silt, z = Clay)) +
  geom_density_tern()
```

    ## Warning: Removed 420 rows containing non-finite values (StatDensityTern).

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-6.png)

``` r
# Plot 2
ggtern(africa, aes(x = Sand, y = Silt, z = Clay)) +
  stat_density_tern(geom = "polygon", aes(fill = ..level.., alpha = ..level..)) +
  guides(fill = FALSE)
```

    ## Warning: Removed 420 rows containing non-finite values (StatDensityTern).

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-7.png)

``` r
# Load geomnet & examine structure of madmen
library(geomnet)
str(madmen)
```

    ## List of 2
    ##  $ edges   :'data.frame':    39 obs. of  2 variables:
    ##   ..$ Name1: Factor w/ 9 levels "Betty Draper",..: 1 1 2 2 2 2 2 2 2 2 ...
    ##   ..$ Name2: Factor w/ 39 levels "Abe Drexler",..: 15 31 2 4 5 6 8 9 11 21 ...
    ##  $ vertices:'data.frame':    45 obs. of  2 variables:
    ##   ..$ label : Factor w/ 45 levels "Abe Drexler",..: 5 9 16 23 26 32 33 38 39 17 ...
    ##   ..$ Gender: Factor w/ 2 levels "female","male": 1 2 2 1 2 1 2 2 2 2 ...

``` r
# Merge edges and vertices
mmnet <- merge(madmen$edges, madmen$vertices,
               by.x = "Name1", by.y = "label",
               all = TRUE)

# Examine structure of mmnet
str(mmnet)
```

    ## 'data.frame':    75 obs. of  3 variables:
    ##  $ Name1 : Factor w/ 45 levels "Betty Draper",..: 1 1 2 2 2 2 2 2 2 2 ...
    ##  $ Name2 : Factor w/ 39 levels "Abe Drexler",..: 15 31 2 4 5 6 8 9 11 21 ...
    ##  $ Gender: Factor w/ 2 levels "female","male": 1 1 2 2 2 2 2 2 2 2 ...

``` r
# Finish the ggplot command
ggplot(data = mmnet, aes(from_id = Name1, to_id = Name2)) +
  geom_net(aes(col=Gender), size=6, linewidth=1, labelon=TRUE, fontsize=3, labelcolour="black")
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-8.png)

``` r
# geomnet is pre-loaded and mmnet is defined
head(mmnet)
```

    ##          Name1            Name2 Gender
    ## 1 Betty Draper    Henry Francis female
    ## 2 Betty Draper       Random guy female
    ## 3   Don Draper          Allison   male
    ## 4   Don Draper Bethany Van Nuys   male
    ## 5   Don Draper     Betty Draper   male
    ## 6   Don Draper   Bobbie Barrett   male

``` r
# Node colors
pink_and_blue <- c(female = "#FF69B4", male = "#0099ff")

# Tweak the network plot
ggplot(data = mmnet, aes(from_id = Name1, to_id = Name2)) +
  geom_net(aes(col = Gender),
           size = 6,
           linewidth = 1,
           labelon = TRUE,
           fontsize = 3,
           labelcolour = "black",
           # Make the graph directed
           directed=TRUE) +
  # Add manual color scale         
  scale_color_manual(values=pink_and_blue) +
  # Set x-axis limits
  xlim(-0.05, 1.05) +
  # Set void theme
  theme_void()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-9.png)

``` r
#load trees data set
data(trees)

# Create linear model: res
res <- lm(Volume ~ Girth, data = trees)

# Plot res
plot(res)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-10.png)![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-11.png)![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-12.png)![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-13.png)

``` r
# Import ggfortify and use autoplot()
library(ggfortify)
autoplot(res, ncol=2)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-14.png)

``` r
library(vars)
```

    ## Loading required package: MASS

    ## 
    ## Attaching package: 'MASS'

    ## The following object is masked _by_ '.GlobalEnv':
    ## 
    ##     mammals

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     select

    ## Loading required package: strucchange

    ## Loading required package: sandwich

    ## Loading required package: urca

    ## Loading required package: lmtest

``` r
data(Canada)

# Inspect structure of Canada
str(Canada)
```

    ##  Time-Series [1:84, 1:4] from 1980 to 2001: 930 930 930 931 933 ...
    ##  - attr(*, "dimnames")=List of 2
    ##   ..$ : NULL
    ##   ..$ : chr [1:4] "e" "prod" "rw" "U"

``` r
# Call plot() on Canada
plot(Canada)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-15.png)

``` r
# Call autoplot() on Canada
autoplot(Canada)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-16.png)

``` r
data(eurodist)

# ggfortify and eurodist are available
# Autoplot + ggplot2 tweaking
autoplot(eurodist) + 
  coord_fixed()
```

    ## Scale for 'y' is already present. Adding another scale for 'y', which
    ## will replace the existing scale.

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-17.png)

``` r
# Autoplot of MDS
autoplot(cmdscale(eurodist, eig = TRUE), 
         label = TRUE, 
         label.size = 3, 
         size = 0)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-18.png)

``` r
# Perform clustering
iris_k <- kmeans(iris[-5], 3)

# Autoplot: color according to cluster
autoplot(iris_k, data = iris, frame = TRUE)
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-19.png)

``` r
# Autoplot: above, plus shape according to species
autoplot(iris_k, data = iris, frame = TRUE, shape='Species')
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%202%20specdata1-20.png)

3 Maps maps maps
----------------

``` r
# maps, ggplot2, and ggmap are pre-loaded
# Use map_data() to create usa and inspect
usa <- map_data("usa")
str(usa)
```

    ## 'data.frame':    7243 obs. of  6 variables:
    ##  $ long     : num  -101 -101 -101 -101 -101 ...
    ##  $ lat      : num  29.7 29.7 29.7 29.6 29.6 ...
    ##  $ group    : num  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ order    : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ region   : chr  "main" "main" "main" "main" ...
    ##  $ subregion: chr  NA NA NA NA ...

``` r
# Build the map
ggplot(usa, aes(x = long, y = lat, group = group)) +
  geom_polygon() +
  coord_map() +
  theme_nothing()
```

    ## Warning: `panel.margin` is deprecated. Please use `panel.spacing` property
    ## instead

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%203%20maps-1.png)

``` r
# usa, cities, and all required packages are available

# Finish plot 1
ggplot(usa, aes(x = long, y = lat, group = group)) +
  geom_polygon() +
  geom_point(data = cities, aes(group = State, size = Pop_est),
             col = "red", shape = 16, alpha = 0.6) +
  coord_map() +
  theme_map()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%203%20maps-2.png)

``` r
# Arrange cities
cities_arr <- arrange(cities, Pop_est)

# Copy-paste plot 1 and adapt
ggplot(usa, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill="grey90") +
  geom_point(data = cities_arr, aes(group = State, col = Pop_est),
             size=2, shape = 16, alpha = 0.6) +
  coord_map() +
  theme_map() +
  scale_color_viridis()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%203%20maps-3.png)

``` r
library(usmap)
data(statepop)

state <- map_data("state")
statepop <- statepop %>% select ("region"=full, "Pop_est"=pop_2015 )

statepop$region <- tolower(statepop$region)

# Map of states
ggplot(state, aes(x = long, y = lat, fill = region, group = group)) +
  geom_polygon(col = "white") +
  coord_map() +
  theme_nothing()
```

    ## Warning: `panel.margin` is deprecated. Please use `panel.spacing` property
    ## instead

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%203%20maps-4.png)

``` r
# Merge state and pop: state2
state2 <- merge(state, statepop)

# Map of states with populations
ggplot(state2, aes(x = long, y = lat, fill = Pop_est, group = group)) +
  geom_polygon(col = "white") +
  coord_map() +
  theme_map()
```

![](datacamp_ggplot2_Part3_files/figure-markdown_github/Part%203%20maps-5.png)

``` r
# All required packages are available
# Import shape information: germany
#germany <- readOGR(dsn = "shapes", layer = "DEU_adm1")

# fortify germany: bundes
#bundes <- fortify(germany)

# Plot map of germany
#ggplot(bundes, aes(x = long, y = lat, group = group)) +
#    geom_polygon(fill="blue", col="white") +
#    coord_map() +
#    theme_nothing()
```
