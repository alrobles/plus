# AUC evaluation for matrix (data.frame) data

AUC evaluation for matrix (data.frame) data

## Usage

``` r
auc_matrix(y, prob, weights)
```

## Arguments

- y:

  Label binary class vector

- prob:

  probability output

- weights:

  optional vector of case weights

## Value

A matrix with AUC values

## Examples

``` r
x_train <- matrix(rnorm(650 * 20), 650, 20)
x_test  <- matrix(rnorm(350 * 20), 350, 20)
y_train <- ifelse(rnorm(650) > 0, 1, 0)
y_test  <- ifelse(rnorm(350) > 0, 1, 0)
fit <- plus(x_train, y_train)
p_response <- predict(fit, newx = x_test)
p_class <- plus:::predict.plus(fit, newx = x_test, type = "class")
p_class <- as.matrix(p_class)
auc_matrix(p_class, p_response)
#> [1] 0.5
```
