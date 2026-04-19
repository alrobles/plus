# print a plus object

print a plus object

## Usage

``` r
# S3 method for class 'plus'
print(x, digits = max(3, getOption("digits") - 3), ...)
```

## Arguments

- x:

  fitted plus object

- digits:

  significant digits in printout

- ...:

  additional print arguments

## Value

information about the plus model

## Examples

``` r
x <- matrix(rnorm(1000 * 20), 1000, 20)
y <- ifelse(rnorm(1000) > 0, 1, 0)
fit <- plus(x, y)
print(fit)
#> 
#> Call:  glmnet::cv.glmnet(x = train.X, y = y, family = "binomial") 
#> 
#> Measure: Binomial Deviance 
#> 
#>      Lambda Index Measure      SE Nonzero
#> min 0.00416    33  0.2298 0.01550       8
#> 1se 0.01055    23  0.2437 0.01237       5
```
