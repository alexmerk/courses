Data Manipulation using dplyr
================
alexmerk
December, 2018

### 1 Reading the data set as a tibble

``` r
# Load the dplyr package
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Load the hflights package
#install.packages("hflights")
library(hflights)

# Call both head() and summary() on hflights
#head(hflights)
#summary(hflights)

# Convert the hflights_df data.frame into a hflights tbl
hflights <- tbl_df(hflights)

# Display the hflights tbl
hflights
```

    ## # A tibble: 227,496 x 21
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##  * <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1          1         6    1400    1500 AA                  428
    ##  2  2011     1          2         7    1401    1501 AA                  428
    ##  3  2011     1          3         1    1352    1502 AA                  428
    ##  4  2011     1          4         2    1403    1513 AA                  428
    ##  5  2011     1          5         3    1405    1507 AA                  428
    ##  6  2011     1          6         4    1359    1503 AA                  428
    ##  7  2011     1          7         5    1359    1509 AA                  428
    ##  8  2011     1          8         6    1355    1454 AA                  428
    ##  9  2011     1          9         7    1443    1554 AA                  428
    ## 10  2011     1         10         1    1443    1553 AA                  428
    ## # ... with 227,486 more rows, and 13 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>

``` r
glimpse(hflights)
```

    ## Observations: 227,496
    ## Variables: 21
    ## $ Year              <int> 2011, 2011, 2011, 2011, 2011, 2011, 2011, 20...
    ## $ Month             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ DayofMonth        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1...
    ## $ DayOfWeek         <int> 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6,...
    ## $ DepTime           <int> 1400, 1401, 1352, 1403, 1405, 1359, 1359, 13...
    ## $ ArrTime           <int> 1500, 1501, 1502, 1513, 1507, 1503, 1509, 14...
    ## $ UniqueCarrier     <chr> "AA", "AA", "AA", "AA", "AA", "AA", "AA", "A...
    ## $ FlightNum         <int> 428, 428, 428, 428, 428, 428, 428, 428, 428,...
    ## $ TailNum           <chr> "N576AA", "N557AA", "N541AA", "N403AA", "N49...
    ## $ ActualElapsedTime <int> 60, 60, 70, 70, 62, 64, 70, 59, 71, 70, 70, ...
    ## $ AirTime           <int> 40, 45, 48, 39, 44, 45, 43, 40, 41, 45, 42, ...
    ## $ ArrDelay          <int> -10, -9, -8, 3, -3, -7, -1, -16, 44, 43, 29,...
    ## $ DepDelay          <int> 0, 1, -8, 3, 5, -1, -1, -5, 43, 43, 29, 19, ...
    ## $ Origin            <chr> "IAH", "IAH", "IAH", "IAH", "IAH", "IAH", "I...
    ## $ Dest              <chr> "DFW", "DFW", "DFW", "DFW", "DFW", "DFW", "D...
    ## $ Distance          <int> 224, 224, 224, 224, 224, 224, 224, 224, 224,...
    ## $ TaxiIn            <int> 7, 6, 5, 9, 9, 6, 12, 7, 8, 6, 8, 4, 6, 5, 6...
    ## $ TaxiOut           <int> 13, 9, 17, 22, 9, 13, 15, 12, 22, 19, 20, 11...
    ## $ Cancelled         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ CancellationCode  <chr> "", "", "", "", "", "", "", "", "", "", "", ...
    ## $ Diverted          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...

``` r
# Create the object carriers
carriers <- hflights$UniqueCarrier
```

### 2 Recoding data

``` r
# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
## lut is a vector with the coding scheme, also the "lookup table". The vector in brackets (UniqueCarrier) is the vector to be transformed.
hflights$Carrier <- lut[hflights$UniqueCarrier]

# Glimpse at hflights
glimpse(hflights)
```

    ## Observations: 227,496
    ## Variables: 22
    ## $ Year              <int> 2011, 2011, 2011, 2011, 2011, 2011, 2011, 20...
    ## $ Month             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ DayofMonth        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1...
    ## $ DayOfWeek         <int> 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6,...
    ## $ DepTime           <int> 1400, 1401, 1352, 1403, 1405, 1359, 1359, 13...
    ## $ ArrTime           <int> 1500, 1501, 1502, 1513, 1507, 1503, 1509, 14...
    ## $ UniqueCarrier     <chr> "AA", "AA", "AA", "AA", "AA", "AA", "AA", "A...
    ## $ FlightNum         <int> 428, 428, 428, 428, 428, 428, 428, 428, 428,...
    ## $ TailNum           <chr> "N576AA", "N557AA", "N541AA", "N403AA", "N49...
    ## $ ActualElapsedTime <int> 60, 60, 70, 70, 62, 64, 70, 59, 71, 70, 70, ...
    ## $ AirTime           <int> 40, 45, 48, 39, 44, 45, 43, 40, 41, 45, 42, ...
    ## $ ArrDelay          <int> -10, -9, -8, 3, -3, -7, -1, -16, 44, 43, 29,...
    ## $ DepDelay          <int> 0, 1, -8, 3, 5, -1, -1, -5, 43, 43, 29, 19, ...
    ## $ Origin            <chr> "IAH", "IAH", "IAH", "IAH", "IAH", "IAH", "I...
    ## $ Dest              <chr> "DFW", "DFW", "DFW", "DFW", "DFW", "DFW", "D...
    ## $ Distance          <int> 224, 224, 224, 224, 224, 224, 224, 224, 224,...
    ## $ TaxiIn            <int> 7, 6, 5, 9, 9, 6, 12, 7, 8, 6, 8, 4, 6, 5, 6...
    ## $ TaxiOut           <int> 13, 9, 17, 22, 9, 13, 15, 12, 22, 19, 20, 11...
    ## $ Cancelled         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ CancellationCode  <chr> "", "", "", "", "", "", "", "", "", "", "", ...
    ## $ Diverted          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ Carrier           <chr> "American", "American", "American", "America...

``` r
# The hflights tbl you built in the previous exercise is available in the workspace.

# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Add the Code column
hflights$Code <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)
```

    ## Observations: 227,496
    ## Variables: 23
    ## $ Year              <int> 2011, 2011, 2011, 2011, 2011, 2011, 2011, 20...
    ## $ Month             <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,...
    ## $ DayofMonth        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1...
    ## $ DayOfWeek         <int> 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6,...
    ## $ DepTime           <int> 1400, 1401, 1352, 1403, 1405, 1359, 1359, 13...
    ## $ ArrTime           <int> 1500, 1501, 1502, 1513, 1507, 1503, 1509, 14...
    ## $ UniqueCarrier     <chr> "AA", "AA", "AA", "AA", "AA", "AA", "AA", "A...
    ## $ FlightNum         <int> 428, 428, 428, 428, 428, 428, 428, 428, 428,...
    ## $ TailNum           <chr> "N576AA", "N557AA", "N541AA", "N403AA", "N49...
    ## $ ActualElapsedTime <int> 60, 60, 70, 70, 62, 64, 70, 59, 71, 70, 70, ...
    ## $ AirTime           <int> 40, 45, 48, 39, 44, 45, 43, 40, 41, 45, 42, ...
    ## $ ArrDelay          <int> -10, -9, -8, 3, -3, -7, -1, -16, 44, 43, 29,...
    ## $ DepDelay          <int> 0, 1, -8, 3, 5, -1, -1, -5, 43, 43, 29, 19, ...
    ## $ Origin            <chr> "IAH", "IAH", "IAH", "IAH", "IAH", "IAH", "I...
    ## $ Dest              <chr> "DFW", "DFW", "DFW", "DFW", "DFW", "DFW", "D...
    ## $ Distance          <int> 224, 224, 224, 224, 224, 224, 224, 224, 224,...
    ## $ TaxiIn            <int> 7, 6, 5, 9, 9, 6, 12, 7, 8, 6, 8, 4, 6, 5, 6...
    ## $ TaxiOut           <int> 13, 9, 17, 22, 9, 13, 15, 12, 22, 19, 20, 11...
    ## $ Cancelled         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ CancellationCode  <chr> "", "", "", "", "", "", "", "", "", "", "", ...
    ## $ Diverted          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    ## $ Carrier           <chr> "American", "American", "American", "America...
    ## $ Code              <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...

3 select()
----------

``` r
# hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl with the four columns of hflights related to delay
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)
```

    ## # A tibble: 227,496 x 4
    ##    ActualElapsedTime AirTime ArrDelay DepDelay
    ##  *             <int>   <int>    <int>    <int>
    ##  1                60      40      -10        0
    ##  2                60      45       -9        1
    ##  3                70      48       -8       -8
    ##  4                70      39        3        3
    ##  5                62      44       -3        5
    ##  6                64      45       -7       -1
    ##  7                70      43       -1       -1
    ##  8                59      40      -16       -5
    ##  9                71      41       44       43
    ## 10                70      45       43       43
    ## # ... with 227,486 more rows

``` r
# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)
```

    ## # A tibble: 227,496 x 6
    ##    Origin Dest  Distance TaxiIn TaxiOut Cancelled
    ##  * <chr>  <chr>    <int>  <int>   <int>     <int>
    ##  1 IAH    DFW        224      7      13         0
    ##  2 IAH    DFW        224      6       9         0
    ##  3 IAH    DFW        224      5      17         0
    ##  4 IAH    DFW        224      9      22         0
    ##  5 IAH    DFW        224      9       9         0
    ##  6 IAH    DFW        224      6      13         0
    ##  7 IAH    DFW        224     12      15         0
    ##  8 IAH    DFW        224      7      12         0
    ##  9 IAH    DFW        224      8      22         0
    ## 10 IAH    DFW        224      6      19         0
    ## # ... with 227,486 more rows

``` r
# Find the most concise way to select: columns Year up to and including DayOfWeek, 
# columns ArrDelay up to and including Diverted
select(hflights, Year:DayOfWeek, ArrDelay:Diverted)
```

    ## # A tibble: 227,496 x 14
    ##     Year Month DayofMonth DayOfWeek ArrDelay DepDelay Origin Dest  Distance
    ##  * <int> <int>      <int>     <int>    <int>    <int> <chr>  <chr>    <int>
    ##  1  2011     1          1         6      -10        0 IAH    DFW        224
    ##  2  2011     1          2         7       -9        1 IAH    DFW        224
    ##  3  2011     1          3         1       -8       -8 IAH    DFW        224
    ##  4  2011     1          4         2        3        3 IAH    DFW        224
    ##  5  2011     1          5         3       -3        5 IAH    DFW        224
    ##  6  2011     1          6         4       -7       -1 IAH    DFW        224
    ##  7  2011     1          7         5       -1       -1 IAH    DFW        224
    ##  8  2011     1          8         6      -16       -5 IAH    DFW        224
    ##  9  2011     1          9         7       44       43 IAH    DFW        224
    ## 10  2011     1         10         1       43       43 IAH    DFW        224
    ## # ... with 227,486 more rows, and 5 more variables: TaxiIn <int>,
    ## #   TaxiOut <int>, Cancelled <int>, CancellationCode <chr>, Diverted <int>

``` r
# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ArrDelay, DepDelay)
```

    ## # A tibble: 227,496 x 2
    ##    ArrDelay DepDelay
    ##  *    <int>    <int>
    ##  1      -10        0
    ##  2       -9        1
    ##  3       -8       -8
    ##  4        3        3
    ##  5       -3        5
    ##  6       -7       -1
    ##  7       -1       -1
    ##  8      -16       -5
    ##  9       44       43
    ## 10       43       43
    ## # ... with 227,486 more rows

``` r
# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, UniqueCarrier, ends_with("Num"), contains("Cancel"))
```

    ## # A tibble: 227,496 x 5
    ##    UniqueCarrier FlightNum TailNum Cancelled CancellationCode
    ##  * <chr>             <int> <chr>       <int> <chr>           
    ##  1 AA                  428 N576AA          0 ""              
    ##  2 AA                  428 N557AA          0 ""              
    ##  3 AA                  428 N541AA          0 ""              
    ##  4 AA                  428 N403AA          0 ""              
    ##  5 AA                  428 N492AA          0 ""              
    ##  6 AA                  428 N262AA          0 ""              
    ##  7 AA                  428 N493AA          0 ""              
    ##  8 AA                  428 N477AA          0 ""              
    ##  9 AA                  428 N476AA          0 ""              
    ## 10 AA                  428 N504AA          0 ""              
    ## # ... with 227,486 more rows

``` r
# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, contains("Time"), contains("Delay"))
```

    ## # A tibble: 227,496 x 6
    ##    DepTime ArrTime ActualElapsedTime AirTime ArrDelay DepDelay
    ##  *   <int>   <int>             <int>   <int>    <int>    <int>
    ##  1    1400    1500                60      40      -10        0
    ##  2    1401    1501                60      45       -9        1
    ##  3    1352    1502                70      48       -8       -8
    ##  4    1403    1513                70      39        3        3
    ##  5    1405    1507                62      44       -3        5
    ##  6    1359    1503                64      45       -7       -1
    ##  7    1359    1509                70      43       -1       -1
    ##  8    1355    1454                59      40      -16       -5
    ##  9    1443    1554                71      41       44       43
    ## 10    1443    1553                70      45       43       43
    ## # ... with 227,486 more rows

### 4 mutate()

``` r
 # hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = 60 * Distance/AirTime)

# Print out g3
g3
```

    ## # A tibble: 227,496 x 26
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1          1         6    1400    1500 AA                  428
    ##  2  2011     1          2         7    1401    1501 AA                  428
    ##  3  2011     1          3         1    1352    1502 AA                  428
    ##  4  2011     1          4         2    1403    1513 AA                  428
    ##  5  2011     1          5         3    1405    1507 AA                  428
    ##  6  2011     1          6         4    1359    1503 AA                  428
    ##  7  2011     1          7         5    1359    1509 AA                  428
    ##  8  2011     1          8         6    1355    1454 AA                  428
    ##  9  2011     1          9         7    1443    1554 AA                  428
    ## 10  2011     1         10         1    1443    1553 AA                  428
    ## # ... with 227,486 more rows, and 18 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>, ActualGroundTime <int>,
    ## #   GroundTime <int>, AverageSpeed <dbl>

``` r
# hflights and dplyr are ready, are you?

# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights,
  loss = ArrDelay - DepDelay,
  loss_ratio = loss/DepDelay)

# Add the three variables as described in the third instruction: m2
m2 <- mutate(hflights,
  TotalTaxi = TaxiIn + TaxiOut,
  ActualGroundTime = ActualElapsedTime - AirTime,
  Diff = TotalTaxi - ActualGroundTime)
```

### 5 filter()

``` r
# hflights is at your disposal as a tbl, with clean carrier names

# All flights that traveled 3000 miles or more
filter(hflights, Distance >= 3000)
```

    ## # A tibble: 527 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1         31         1     924    1413 CO                    1
    ##  2  2011     1         30         7     925    1410 CO                    1
    ##  3  2011     1         29         6    1045    1445 CO                    1
    ##  4  2011     1         28         5    1516    1916 CO                    1
    ##  5  2011     1         27         4     950    1344 CO                    1
    ##  6  2011     1         26         3     944    1350 CO                    1
    ##  7  2011     1         25         2     924    1337 CO                    1
    ##  8  2011     1         24         1    1144    1605 CO                    1
    ##  9  2011     1         23         7     926    1335 CO                    1
    ## 10  2011     1         22         6     942    1340 CO                    1
    ## # ... with 517 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier %in% c("JetBlue","Southwest","Delta"))
```

    ## # A tibble: 0 x 23
    ## # ... with 23 variables: Year <int>, Month <int>, DayofMonth <int>,
    ## #   DayOfWeek <int>, DepTime <int>, ArrTime <int>, UniqueCarrier <chr>,
    ## #   FlightNum <int>, TailNum <chr>, ActualElapsedTime <int>,
    ## #   AirTime <int>, ArrDelay <int>, DepDelay <int>, Origin <chr>,
    ## #   Dest <chr>, Distance <int>, TaxiIn <int>, TaxiOut <int>,
    ## #   Cancelled <int>, CancellationCode <chr>, Diverted <int>,
    ## #   Carrier <chr>, Code <chr>

``` r
# All flights where taxiing took longer than flying
filter(hflights, (TaxiOut+TaxiIn)>AirTime)
```

    ## # A tibble: 1,389 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1         24         1     731     904 AA                  460
    ##  2  2011     1         30         7    1959    2132 AA                  533
    ##  3  2011     1         24         1    1621    1749 AA                 1121
    ##  4  2011     1         10         1     941    1113 AA                 1436
    ##  5  2011     1         31         1    1301    1356 CO                  241
    ##  6  2011     1         31         1    2113    2215 CO                 1533
    ##  7  2011     1         31         1    1434    1539 CO                 1541
    ##  8  2011     1         31         1     900    1006 CO                 1583
    ##  9  2011     1         30         7    1304    1408 CO                  241
    ## 10  2011     1         30         7    2004    2128 CO                  423
    ## # ... with 1,379 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime<500 | ArrTime >2200)
```

    ## # A tibble: 27,799 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1          4         2    2100    2207 AA                  533
    ##  2  2011     1         14         5    2119    2229 AA                  533
    ##  3  2011     1         10         1    1934    2235 AA                 1294
    ##  4  2011     1         26         3    1905    2211 AA                 1294
    ##  5  2011     1         30         7    1856    2209 AA                 1294
    ##  6  2011     1          9         7    1938    2228 AS                  731
    ##  7  2011     1         31         1    1919    2231 CO                  190
    ##  8  2011     1         31         1    2116    2344 CO                  209
    ##  9  2011     1         31         1    1850    2211 CO                  250
    ## 10  2011     1         31         1    2102    2216 CO                  299
    ## # ... with 27,789 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay>0 & ArrDelay<0)
```

    ## # A tibble: 27,712 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1          2         7    1401    1501 AA                  428
    ##  2  2011     1          5         3    1405    1507 AA                  428
    ##  3  2011     1         18         2    1408    1508 AA                  428
    ##  4  2011     1         18         2     721     827 AA                  460
    ##  5  2011     1         12         3    2015    2113 AA                  533
    ##  6  2011     1         13         4    2020    2116 AA                  533
    ##  7  2011     1         26         3    2009    2103 AA                  533
    ##  8  2011     1          1         6    1631    1736 AA                 1121
    ##  9  2011     1         10         1    1639    1740 AA                 1121
    ## 10  2011     1         12         3    1631    1739 AA                 1121
    ## # ... with 27,702 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# All flights that were cancelled after being delayed
filter(hflights, DepDelay>0 & Cancelled==1)
```

    ## # A tibble: 40 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1         26         3    1926      NA CO                  310
    ##  2  2011     1         11         2    1100      NA US                  944
    ##  3  2011     1         19         3    1811      NA XE                 2376
    ##  4  2011     1          7         5    2028      NA XE                 3050
    ##  5  2011     2          4         5    1638      NA AA                 1121
    ##  6  2011     2          8         2    1057      NA CO                  408
    ##  7  2011     2          2         3     802      NA XE                 2189
    ##  8  2011     2          9         3     904      NA XE                 2605
    ##  9  2011     2          1         2    1508      NA OO                 5812
    ## 10  2011     3         31         4    1016      NA CO                  586
    ## # ... with 30 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# Select the flights that had JFK as their destination: c1
c1 <- filter(hflights, Dest=="JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2
c2 <- mutate (c1, Date = paste(Year, Month, DayofMonth, sep="-"))

# Print out a selection of columns of c2
select(c2, Date, DepTime, ArrTime, TailNum)
```

    ## # A tibble: 695 x 4
    ##    Date     DepTime ArrTime TailNum
    ##    <chr>      <int>   <int> <chr>  
    ##  1 2011-1-1     654    1124 N324JB 
    ##  2 2011-1-1    1639    2110 N324JB 
    ##  3 2011-1-2     703    1113 N324JB 
    ##  4 2011-1-2    1604    2040 N324JB 
    ##  5 2011-1-3     659    1100 N229JB 
    ##  6 2011-1-3    1801    2200 N206JB 
    ##  7 2011-1-4     654    1103 N267JB 
    ##  8 2011-1-4    1608    2034 N267JB 
    ##  9 2011-1-5     700    1103 N708JB 
    ## 10 2011-1-5    1544    1954 N644JB 
    ## # ... with 685 more rows

### 6 arrange()

``` r
# dplyr and the hflights tbl are available

# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc, DepDelay)
```

    ## # A tibble: 68 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     7         23         6     605      NA F9                  225
    ##  2  2011     1         17         1     916      NA XE                 3068
    ##  3  2011    12          1         4     541      NA US                  282
    ##  4  2011    10         12         3    2022      NA MQ                 3724
    ##  5  2011     7         29         5    1424      NA CO                 1079
    ##  6  2011     9         29         4    1639      NA OO                 2062
    ##  7  2011     2          9         3     555      NA MQ                 3265
    ##  8  2011     5          9         1     715      NA OO                 1177
    ##  9  2011     1         20         4    1413      NA UA                  552
    ## 10  2011     1         17         1     831      NA WN                    1
    ## # ... with 58 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode)
```

    ## # A tibble: 68 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     1         20         4    1413      NA UA                  552
    ##  2  2011     1          7         5    2028      NA XE                 3050
    ##  3  2011     2          4         5    1638      NA AA                 1121
    ##  4  2011     2          8         2    1057      NA CO                  408
    ##  5  2011     2          1         2    1508      NA OO                 5812
    ##  6  2011     2         21         1    2257      NA OO                 1111
    ##  7  2011     2          9         3     555      NA MQ                 3265
    ##  8  2011     3         18         5     727      NA UA                  109
    ##  9  2011     4          4         1    1632      NA DL                    8
    ## 10  2011     4          8         5    1608      NA WN                    4
    ## # ... with 58 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)
```

    ## # A tibble: 68 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     8         18         4    1808      NA AA                 1294
    ##  2  2011     2          4         5    1638      NA AA                 1121
    ##  3  2011     7         29         5    1424      NA CO                 1079
    ##  4  2011     1         26         3    1703      NA CO                  410
    ##  5  2011     8         11         4    1320      NA CO                 1669
    ##  6  2011     7         25         1    1654      NA CO                 1422
    ##  7  2011     1         26         3    1926      NA CO                  310
    ##  8  2011     3         31         4    1016      NA CO                  586
    ##  9  2011     2          8         2    1057      NA CO                  408
    ## 10  2011     4          4         1    1632      NA DL                    8
    ## # ... with 58 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# dplyr and the hflights tbl are available

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))
```

    ## # A tibble: 227,496 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011    12         12         1     650     808 AA                 1740
    ##  2  2011    11         19         6    1752    1910 AA                 1903
    ##  3  2011    12         22         4    1728    1848 AA                 1903
    ##  4  2011    10         23         7    2305       2 AA                  742
    ##  5  2011     9         27         2    1206    1300 AA                 1948
    ##  6  2011     3         17         4    1647    1747 AA                 1505
    ##  7  2011     6         21         2     955    1315 AA                  466
    ##  8  2011     5         20         5    2359     130 AA                  426
    ##  9  2011     4         19         2    2023    2142 AA                 1925
    ## 10  2011     5         12         4    2133      53 AA                 1294
    ## # ... with 227,486 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

``` r
# Arrange flights by total delay (normal order).
arrange(hflights, (DepDelay+ArrDelay))
```

    ## # A tibble: 227,496 x 23
    ##     Year Month DayofMonth DayOfWeek DepTime ArrTime UniqueCarrier FlightNum
    ##    <int> <int>      <int>     <int>   <int>   <int> <chr>             <int>
    ##  1  2011     7          3         7    1914    2039 XE                 2804
    ##  2  2011     8         31         3     934    1039 OO                 2040
    ##  3  2011     8         21         7     935    1039 OO                 2001
    ##  4  2011     8         28         7    2059    2206 OO                 2003
    ##  5  2011     8         29         1     935    1041 OO                 2040
    ##  6  2011    12         25         7     741     926 OO                 4591
    ##  7  2011     1         30         7     620     812 OO                 4461
    ##  8  2011     8          3         3    1741    1810 XE                 2603
    ##  9  2011     8          4         4     930    1041 OO                 1171
    ## 10  2011     8         18         4     939    1043 OO                 2001
    ## # ... with 227,486 more rows, and 15 more variables: TailNum <chr>,
    ## #   ActualElapsedTime <int>, AirTime <int>, ArrDelay <int>,
    ## #   DepDelay <int>, Origin <chr>, Dest <chr>, Distance <int>,
    ## #   TaxiIn <int>, TaxiOut <int>, Cancelled <int>, CancellationCode <chr>,
    ## #   Diverted <int>, Carrier <chr>, Code <chr>

### 7 summarise()

``` r
# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist=min(Distance), max_dist=max(Distance))
```

    ## # A tibble: 1 x 2
    ##   min_dist max_dist
    ##      <dbl>    <dbl>
    ## 1       79     3904

``` r
# Print out a summary with variable max_div
summarise(filter(hflights, Diverted==1), max_div=max(Distance))
```

    ## # A tibble: 1 x 1
    ##   max_div
    ##     <dbl>
    ## 1    3904

``` r
# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1<- filter(hflights, ArrDelay!="NA")

# Generate summary about ArrDelay column of temp1
summarize(temp1, earliest=min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd=sd(ArrDelay))
```

    ## # A tibble: 1 x 4
    ##   earliest average latest    sd
    ##      <dbl>   <dbl>  <dbl> <dbl>
    ## 1      -70    7.09    978  30.7

``` r
# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, TaxiIn!="NA" & TaxiOut!="NA")

# Print the maximum taxiing difference of temp2 with summarize()
summarize(temp2, max_taxi_diff=max(abs(TaxiIn-TaxiOut)))
```

    ## # A tibble: 1 x 1
    ##   max_taxi_diff
    ##           <int>
    ## 1           160

### 8 The pipe operator %&gt;%

``` r
# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
hflights %>% mutate(diff=TaxiOut-TaxiIn) %>%
    filter(diff!="NA") %>% 
    summarise(avg=mean(diff))
```

    ## # A tibble: 1 x 1
    ##     avg
    ##   <dbl>
    ## 1  8.99

``` r
# Chain together mutate(), filter() and summarize()
hflights %>% 
    mutate(RealTime=ActualElapsedTime+100, mph=(60*Distance)/RealTime) %>%
    filter(mph!="NA" & mph<70) %>%
    summarize(n_less=n(), n_dest=n_distinct(Dest), min_dist=min(Distance), max_dist=max(Distance))
```

    ## # A tibble: 1 x 4
    ##   n_less n_dest min_dist max_dist
    ##    <int>  <int>    <dbl>    <dbl>
    ## 1   6726     13       79      305

``` r
# Finish the command with a filter() and summarize() call
hflights %>%
  mutate(
    RealTime = ActualElapsedTime + 100, 
    mph = 60 * Distance / RealTime
  ) %>% 
    filter(mph<105 | Cancelled=="1" | Diverted=="1") %>%
    summarize(n_non=n(),
              n_dest=n_distinct(Dest),
              min_dist=min(Distance),
              max_dist=max(Distance))
```

    ## # A tibble: 1 x 4
    ##   n_non n_dest min_dist max_dist
    ##   <int>  <int>    <dbl>    <dbl>
    ## 1 42400    113       79     3904

``` r
# hflights and dplyr are loaded

# Count the number of overnight flights
filter(hflights, DepTime!="NA", ArrTime!="NA", DepTime>ArrTime) %>%
summarize(num=n())
```

    ## # A tibble: 1 x 1
    ##     num
    ##   <int>
    ## 1  2718

### 9 group\_by()

``` r
# hflights is in the workspace as a tbl, with translated carrier names

# Make an ordered per-carrier summary of hflights
hflights %>%
  group_by(UniqueCarrier) %>%
  summarize(
    p_canc = 100*sum(Cancelled=="1")/n(),
    avg_delay = mean(ArrDelay, na.rm=TRUE)
  ) %>%
  arrange(avg_delay, p_canc)
```

    ## # A tibble: 15 x 3
    ##    UniqueCarrier p_canc avg_delay
    ##    <chr>          <dbl>     <dbl>
    ##  1 US             1.13     -0.631
    ##  2 AA             1.85      0.892
    ##  3 FL             0.982     1.85 
    ##  4 AS             0         3.19 
    ##  5 YV             1.27      4.01 
    ##  6 DL             1.59      6.08 
    ##  7 CO             0.678     6.10 
    ##  8 MQ             2.90      7.15 
    ##  9 EV             3.45      7.26 
    ## 10 WN             1.55      7.59 
    ## 11 F9             0.716     7.67 
    ## 12 XE             1.55      8.19 
    ## 13 OO             1.39      8.69 
    ## 14 B6             2.59      9.86 
    ## 15 UA             1.64     10.5

``` r
# dplyr and hflights (with translated carrier names) are pre-loaded

# How many airplanes only flew to one destination?
hflights %>%
  group_by(TailNum) %>%
  summarize(ndest=n_distinct(Dest)) %>%
  filter(ndest=="1") %>%
  summarize(nplanes=n())
```

    ## # A tibble: 1 x 1
    ##   nplanes
    ##     <int>
    ## 1    1526

``` r
# Find the most visited destination for each carrier. 
# The tbl you print out should have a single column,
# named nplanes and a single row.
hflights %>%
  group_by(UniqueCarrier, Dest) %>%
  summarize(n=n()) %>%
  mutate(rank= rank(desc(n))) %>%
  filter(rank=="1")
```

    ## # A tibble: 15 x 4
    ## # Groups:   UniqueCarrier [15]
    ##    UniqueCarrier Dest      n  rank
    ##    <chr>         <chr> <int> <dbl>
    ##  1 AA            DFW    2105     1
    ##  2 AS            SEA     365     1
    ##  3 B6            JFK     695     1
    ##  4 CO            EWR    3924     1
    ##  5 DL            ATL    2396     1
    ##  6 EV            DTW     851     1
    ##  7 F9            DEN     837     1
    ##  8 FL            ATL    2029     1
    ##  9 MQ            DFW    2424     1
    ## 10 OO            COS    1335     1
    ## 11 UA            SFO     643     1
    ## 12 US            CLT    2212     1
    ## 13 WN            DAL    8243     1
    ## 14 XE            CRP    3175     1
    ## 15 YV            CLT      71     1

### 10 dplyr and databases

``` r
library(data.table)
hflights2 <- as.data.table(hflights)

# hflights2 is pre-loaded as a data.table

# Use summarize to calculate n_carrier
hflights2 %>% summarize(n_carrier=n_distinct(UniqueCarrier))

# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "", 
                   port = 111, 
                   user = "",
                   password = "")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
  nycflights %>% group_by(carrier) %>% summarize(n_flights=n(), avg_delay=mean(arr_delay, na.rm=TRUE)) %>% arrange(avg_delay)
```
