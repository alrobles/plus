# validate plus_object constructed via new_plus function

validate plus_object constructed via new_plus function

## Usage

``` r
validate_plus(plus_object)
```

## Arguments

- plus_object:

  A plus object constructed with new_plus function

## Value

A validated plus_object

## Examples

``` r
validate_plus(
new_plus(fit_plus = fit_plus_example,
pred_y = predicted_y_example,
cutoff = cutoff_example,
predicted_coefficients = predicted_coefficients_example)
)
#> 
#> Call:  glmnet::cv.glmnet(x = train.X, y = Label.obs, family = "binomial") 
#> 
#> Measure: Binomial Deviance 
#> 
#>       Lambda Index Measure      SE Nonzero
#> min 0.000794    45  0.1774 0.01763       5
#> 1se 0.006746    22  0.1925 0.01632       5
```
