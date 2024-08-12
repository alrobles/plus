
<!-- README.md is generated from README.Rmd. Please edit that file -->

# plus

<!--        _            -->
<!--  _ __ | |_   _ ___  -->
<!-- | '_ \| | | | / __| -->
<!-- | |_) | | |_| \__ \ -->
<!-- | .__/|_|\__,_|___/ -->
<!-- |_|                 -->
<!-- badges: start -->
<!-- badges: end -->

Positive and unlabeled Learning from Unbalanced cases and Sparse
structures (PLUS)

## Installation

You can install the development version of plus from
[GitHub](https://github.com/alrobles/PLUS) with:

``` r
# install.packages("devtools")
devtools::install_github("alrobles/plus")
```

The goal of plus is implement the Positive and unlabeled Learning from
Unbalanced cases and Sparse structures (PLUS) algorithm, originally
published in:
[PLoS](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1009956)
\## Example

The use of plus is very simple:

``` r
library(plus)
data(binexample)
x = binexample$x
y = binexample$y
plus(x, y)
#> 
#> Call:  glmnet::cv.glmnet(x = train.X, y = y, family = "binomial") 
#> 
#> Measure: Binomial Deviance 
#> 
#>      Lambda Index Measure      SE Nonzero
#> min 0.00777    35  0.3383 0.10399      17
#> 1se 0.04147    17  0.4411 0.06799       8
```

You can predict new data:

``` r
data(binexample)
x = binexample$x
y = binexample$y
train <- sample(seq(length(y)), 85, replace = FALSE)
x_train <- x[train, ]
x_test  <- x[-train, ]
y_train <- y[train]
y_test  <- y[-train]
fit <- plus(x_train, y_train)
predict(fit, newx = x_test)
#>       lambda.min
#>  [1,]  0.9099319
#>  [2,]  0.9988322
#>  [3,]  0.9212976
#>  [4,]  0.3999964
#>  [5,]  0.3390931
#>  [6,]  0.7253012
#>  [7,]  0.9839539
#>  [8,]  0.7999568
#>  [9,]  0.5424189
#> [10,]  0.9999993
#> [11,]  0.9939600
#> [12,]  0.9996293
#> [13,]  0.9805778
#> [14,]  0.9982364
#> [15,]  0.8101654
```

Additionally you can get evaluation performance metrics for the plus
models

    #> [1] 0.4044118
    #> $deviance
    #> lambda.min 
    #>   1.280583 
    #> 
    #> $class
    #> lambda.min 
    #>       0.32 
    #> 
    #> $auc
    #> [1] 0.4044118
    #> 
    #> $mse
    #> lambda.min 
    #>  0.4468466 
    #> 
    #> $mae
    #> lambda.min 
    #>  0.8697495

The plus algorithm can be applied in different datasets
