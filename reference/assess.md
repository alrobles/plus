# Assessment of performance metrics in plus models

Assessment of performance metrics in plus models

## Usage

``` r
assess(object, newx = NULL, newy, weights = NULL, ...)

# S3 method for class 'plus'
assess(object, newx = NULL, newy, weights = NULL, ...)
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

## Value

A list with performance metrics for plus models

## Examples

``` r
#' data(binexample)
x = binexample$x
y = binexample$y
s <- sample(seq(nrow(x)), 65, replace = FALSE)
x_train <- x[s, ]
x_test  <- x[-s, ]
y_train <- y[s]
y_test  <- y[-s]
fit <- plus(x_train, y_train)
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Error in lognet(x, is.sparse, y, weights, offset, alpha, nobs, nvars,     jd, vp, cl, ne, nx, nlam, flmin, ulam, thresh, isd, intr,     vnames, maxit, kopt, family, pb): one multinomial or binomial class has 1 or 0 observations; not allowed
assess(fit, newx = x_test, newy = y_test)
#> Error: object 'fit' not found
```
