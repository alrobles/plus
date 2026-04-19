# Assessment of auc metrics in plus models

Assessment of auc metrics in plus models

## Usage

``` r
get_auc(object, newx = NULL, newy = NULL, weights = NULL, ...)

# S3 method for class 'plus'
get_auc(object, newx = NULL, newy = NULL, weights = NULL, ...)
```

## Arguments

- object:

  A plus object

- newx:

  A matrix with new data to test performance

- newy:

  A vector with the observed classes to test performance

- weights:

  optional vector of case weights

- ...:

  additional arguments

## Examples

``` r
data(binexample)
x <- binexample$x
y <- binexample$y
train <- sample(seq(length(y)), 50, replace = FALSE)
x_train <- x[train, ]
x_test  <- x[-train, ]
y_train <- y[train]
y_test  <- y[-train]
fit <- plus(x_train, y_train)
#> Warning: no non-missing arguments to max; returning -Inf
#> Warning: no non-missing arguments to min; returning Inf
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Error in lognet(x, is.sparse, y, weights, offset, alpha, nobs, nvars,     jd, vp, cl, ne, nx, nlam, flmin, ulam, thresh, isd, intr,     vnames, maxit, kopt, family, pb): one multinomial or binomial class has 1 or 0 observations; not allowed
get_auc(fit, x_test, y_test)
#> Error: object 'fit' not found
```
