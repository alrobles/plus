
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
#>      Lambda Index Measure      SE Nonzero
#> min 0.00692    36  0.5564 0.14560      20
#> 1se 0.04885    15  0.6982 0.07907       6
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
#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground

#> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
#> multinomial or binomial class has fewer than 8 observations; dangerous ground
predict(fit, newx = x_test)
#>       lambda.min
#>  [1,]  0.8199882
#>  [2,]  0.9896921
#>  [3,]  0.9357935
#>  [4,]  0.9552818
#>  [5,]  0.8592861
#>  [6,]  0.9734173
#>  [7,]  0.9221861
#>  [8,]  0.9481288
#>  [9,]  0.9724365
#> [10,]  0.9940004
#> [11,]  0.9903649
#> [12,]  0.8809392
#> [13,]  0.9953123
#> [14,]  0.8704460
#> [15,]  0.9935770
```

Additionally you can get evaluation performance metrics for the plus
models

    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground
    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground
    #> Warning in max(map.pred.y[map.pred.y > 0]): no non-missing arguments to max;
    #> returning -Inf
    #> Warning in min(map.pred.y[map.pred.y < 0]): no non-missing arguments to min;
    #> returning Inf
    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground

    #> Warning in lognet(xd, is.sparse, ix, jx, y, weights, offset, alpha, nobs, : one
    #> multinomial or binomial class has fewer than 8 observations; dangerous ground
    #> [1] 0.6153846
    #> $deviance
    #> lambda.min 
    #>   1.529837 
    #> 
    #> $class
    #> lambda.min 
    #>       0.48 
    #> 
    #> $auc
    #> [1] 0.6153846
    #> 
    #> $mse
    #> lambda.min 
    #>  0.5650617 
    #> 
    #> $mae
    #> lambda.min 
    #>  0.9765319

The plus algorithm can be applied in different datasets
