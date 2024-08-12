
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
#> Warning: from glmnet C++ code (error code -80); Convergence for 80th lambda
#> value not reached after maxit=100000 iterations; solutions for larger lambdas
#> returned
#> Warning: from glmnet C++ code (error code -86); Convergence for 86th lambda
#> value not reached after maxit=100000 iterations; solutions for larger lambdas
#> returned
#> 
#> Call:  glmnet::cv.glmnet(x = train.X, y = y, family = "binomial") 
#> 
#> Measure: Binomial Deviance 
#> 
#>       Lambda Index Measure      SE Nonzero
#> min 0.006853    37  0.3883 0.10025      19
#> 1se 0.017374    27  0.4863 0.08725      15
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
#>  [1,]  0.9399620
#>  [2,]  0.2392404
#>  [3,]  0.6045430
#>  [4,]  0.9735024
#>  [5,]  0.9836893
#>  [6,]  0.9555901
#>  [7,]  0.9677669
#>  [8,]  0.8561529
#>  [9,]  0.9037057
#> [10,]  0.7302149
#> [11,]  0.9976634
#> [12,]  0.9600405
#> [13,]  0.9678719
#> [14,]  0.9649344
#> [15,]  0.9151221
```

Additionally you can get evaluation performance metrics for the plus
models

    #> [1] 0.5384615
    #> $deviance
    #> lambda.min 
    #>   1.570621 
    #> 
    #> $class
    #> lambda.min 
    #>       0.52 
    #> 
    #> $auc
    #> [1] 0.5384615
    #> 
    #> $mse
    #> lambda.min 
    #>  0.5816832 
    #> 
    #> $mae
    #> lambda.min 
    #>  0.9998962

The plus algorithm can be applied in different datasets
