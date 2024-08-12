
<!-- README.md is generated from README.Rmd. Please edit that file -->

# plus

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
#>       Lambda Index Measure      SE Nonzero
#> min 0.005152    37  0.2948 0.08232      15
#> 1se 0.014335    26  0.3687 0.07902      11
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
#>  [1,]  0.9983758
#>  [2,]  0.9825414
#>  [3,]  0.9629690
#>  [4,]  0.9304139
#>  [5,]  0.9991706
#>  [6,]  0.9831281
#>  [7,]  0.9969993
#>  [8,]  0.9978295
#>  [9,]  0.9875074
#> [10,]  0.9968640
#> [11,]  0.9727998
#> [12,]  0.9855236
#> [13,]  0.9949839
#> [14,]  0.9836214
#> [15,]  0.9626422
```

Additionally you can get evaluation performance metrics for the plus
models

    #> [1] 0.36
    #> $deviance
    #> lambda.min 
    #>   1.473088 
    #> 
    #> $class
    #> lambda.min 
    #>        0.4 
    #> 
    #> $auc
    #> [1] 0.36
    #> 
    #> $mse
    #> lambda.min 
    #>  0.5363815 
    #> 
    #> $mae
    #> lambda.min 
    #>  0.9601982

The plus algorithm can be applied in different datasets
