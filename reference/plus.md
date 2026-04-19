# plus model helper function

plus model helper function

## Usage

``` r
plus(
  x = x,
  y = y,
  alpha = 1,
  sample_use_time = 30,
  learning_rate = 1,
  qq = 0.1
)
```

## Arguments

- x:

  A set of independent numeric variables.

- y:

  A binary dependent variable

- alpha:

  The elastic net mixing parameter, with \\0\le\alpha\le 1\\. (See
  glmnet)

- sample_use_time:

  Number of use time

- learning_rate:

  learning rate

- qq:

  quantile threshold

## Value

and object of the class plus

## Examples

``` r
data(binexample)
x = binexample$x
y = binexample$y
plus(x, y)
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
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
#> 
#> Call:  glmnet::cv.glmnet(x = train.X, y = y, family = "binomial") 
#> 
#> Measure: Binomial Deviance 
#> 
#>      Lambda Index Measure     SE Nonzero
#> min 0.01444    25  0.6214 0.1533      17
#> 1se 0.13466     1  0.7560 0.1450       0
```
