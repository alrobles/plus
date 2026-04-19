# Evaluation metric of plus classification

Evaluation metric of plus classification

## Usage

``` r
plus_cv_lognet(
  predmat,
  y,
  type.measure = c("deviance", "class", "auc", "mse", "mae"),
  weights = NULL
)
```

## Arguments

- predmat:

  A prediction matrix given the plus model (lambda min)

- y:

  A vector of a binary virable to test performance

- type.measure:

  The type of performance metric ("deviance", "class", "auc", "mse",
  "mae")

- weights:

  optional vector of case weights

## Value

If the type.measure is AUC returns auc value. Otherwise returna vector
of values given the metrics.

## Examples

``` r
x_train <- matrix(rnorm(650 * 20), 650, 20)
x_test  <- matrix(rnorm(350 * 20), 350, 20)
y_train <- ifelse(rnorm(650) > 0, 1, 0)
y_test  <- ifelse(rnorm(350) > 0, 1, 0)
fit <- plus(x_train, y_train)
p <- predict(fit,newx = x_test)
plus_cv_lognet(p, y_test, type.measure = "auc")
#> $cvraw
#>           [,1]
#> [1,] 0.4785294
#> 
#> $weights
#>   1 
#> 350 
#> 
#> $N
#> [1] 1
#> 
#> $type.measure
#> [1] "auc"
#> 
```
