# Gets the Area under ROC curve usingthe concordance statistics

Gets the Area under ROC curve usingthe concordance statistics

## Usage

``` r
auc(y, prob, w)
```

## Arguments

- y:

  A vector of binary clases

- prob:

  A vector of probabilities (logistic regression output)

- w:

  optional vector of case weights

## Value

The AUC value for a plus object

## Examples

``` r
x_train <- matrix(rnorm(650 * 20), 650, 20)
x_test  <- matrix(rnorm(350 * 20), 350, 20)
y_train <- ifelse(rnorm(650) > 0, 1, 0)
y_test  <- ifelse(rnorm(350) > 0, 1, 0)
fit <- plus(x_train, y_train)
p_response <- plus:::predict.plus(fit, newx = x_test)
p_class <- plus:::predict.plus(fit, newx = x_test, type = "class")
auc(p_class, p_response)
#> [1] 1
```
