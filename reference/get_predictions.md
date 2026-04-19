# Get predictions to asses model performance from a fitted plus model.

Get predictions to asses model performance from a fitted plus model.

## Usage

``` r
get_predictions(object, newx, newy, plus = TRUE)
```

## Arguments

- object:

  A plus object with glmnet classification

- newx:

  New data to predict the class

- newy:

  The observed class to meassure the performance of the model

- plus:

  Logical. If it is true use the cutoff threshold from the plus model.
  This tends to reduce the false negatives and increase the recall.
  Othewise gets the predicted value from glmnet default predicted
  response.#'

## Value

A `data.frame` containing four columns. The truth independent value
(observed y), the probability to belong in Class1, the probability to
belong Class2 and the predicted class either the plus (use cutoff
threshold) or glmnet model.

## Examples

``` r
data(binexample)
x = binexample$x
y = binexample$y
s <- sample(seq(nrow(x)), 65, replace = FALSE)
train_x <- x[s, ]
train_y <- y[s]
newx <- x[-s, ]
newy <- y[-s]
model <- plus(train_x, train_y)
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
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
#> Warning: one multinomial or binomial class has fewer than 8  observations; dangerous ground
get_predictions(model, newx, newy)
#> # A tibble: 35 × 4
#>    truth  Class1     Class2 predicted
#>    <fct>   <dbl>      <dbl> <fct>    
#>  1 Class1  0.999 0.00105    Class2   
#>  2 Class2  0.970 0.0298     Class2   
#>  3 Class2  0.744 0.256      Class2   
#>  4 Class2  0.996 0.00403    Class2   
#>  5 Class2  0.994 0.00606    Class2   
#>  6 Class2  0.999 0.000604   Class2   
#>  7 Class1  1.000 0.00000769 Class2   
#>  8 Class1  0.843 0.157      Class2   
#>  9 Class1  0.977 0.0234     Class2   
#> 10 Class1  0.996 0.00398    Class2   
#> # ℹ 25 more rows
get_predictions(model, newx, newy, plus = FALSE)
#> # A tibble: 35 × 4
#>    truth  Class1 Class2 predicted
#>    <fct>   <dbl>  <dbl> <fct>    
#>  1 Class1  0.930 0.0699 Class1   
#>  2 Class2  0.923 0.0767 Class1   
#>  3 Class2  0.834 0.166  Class1   
#>  4 Class2  0.961 0.0387 Class1   
#>  5 Class2  0.930 0.0696 Class1   
#>  6 Class2  0.956 0.0436 Class1   
#>  7 Class1  0.970 0.0295 Class1   
#>  8 Class1  0.886 0.114  Class1   
#>  9 Class1  0.924 0.0765 Class1   
#> 10 Class1  0.915 0.0854 Class1   
#> # ℹ 25 more rows
```
