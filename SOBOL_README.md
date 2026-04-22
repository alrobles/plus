# Sobol Sequence Generator

The `plus` package now includes a Sobol sequence generator for generating quasi-random low-discrepancy sequences.

## What are Sobol Sequences?

Sobol sequences are quasi-random sequences that provide better coverage of the sample space compared to pseudo-random sequences. They are particularly useful for:

- Quasi-Monte Carlo methods
- Numerical integration
- Sensitivity analysis
- High-dimensional sampling

## Usage

### Basic Usage

```r
library(plus)

# Create a 2-dimensional Sobol generator
gen <- sobol(dimension = 2)
print(gen)

# Generate a single point
point <- next_point(gen)
print(point)

# Generate multiple points at once
points <- generate_points(gen, n = 100)
plot(points, pch = 20, main = "Sobol Sequence (2D)")
```

### Advanced Features

#### Skip Points

```r
gen <- sobol(dimension = 2)
gen <- skip_points(gen, 1000)
# Next point will be the 1001st in the sequence
```

#### Reset Generator

```r
gen <- sobol(dimension = 2)
p1 <- next_point(gen)
gen <- reset_sobol(gen)
p1_again <- next_point(gen)  # Same as p1
```

#### Start from Specific Position

```r
# Create generator starting at position 500
gen <- sobol(dimension = 3, seed = 500)
```

### Example: Comparison with Random Sampling

```r
# Generate 1000 points using Sobol sequence
gen_sobol <- sobol(dimension = 2)
points_sobol <- generate_points(gen_sobol, n = 1000)

# Generate 1000 points using random sampling
points_random <- matrix(runif(2000), ncol = 2)

# Plot comparison
par(mfrow = c(1, 2))
plot(points_random, pch = 20, main = "Random Sampling",
     xlim = c(0, 1), ylim = c(0, 1))
plot(points_sobol, pch = 20, main = "Sobol Sequence",
     xlim = c(0, 1), ylim = c(0, 1))
```

Notice how the Sobol sequence provides more uniform coverage of the space.

### Example: Numerical Integration

Sobol sequences can improve the efficiency of Monte Carlo integration:

```r
# Function to integrate: f(x,y) = x^2 + y^2 over [0,1]^2
# True value = 2/3

# Using random sampling
n <- 10000
x_rand <- runif(n)
y_rand <- runif(n)
estimate_rand <- mean(x_rand^2 + y_rand^2)

# Using Sobol sequence
gen <- sobol(dimension = 2)
points <- generate_points(gen, n = n)
estimate_sobol <- mean(points[,1]^2 + points[,2]^2)

cat("True value:      ", 2/3, "\n")
cat("Random estimate: ", estimate_rand, "\n")
cat("Sobol estimate:  ", estimate_sobol, "\n")
```

## Methods

The sobol class supports the following S3 methods:

- `print.sobol()`: Print information about the generator
- `summary.sobol()`: Display detailed summary

```r
gen <- sobol(dimension = 3)
print(gen)
summary(gen)
```

## Implementation Details

The implementation uses:
- C++ with Rcpp for performance
- Direction numbers for generating Sobol sequences
- Support for dimensions 1-10
- Maximum sequence length of 2^31 - 1 points

## References

- Sobol, I.M. (1967). "On the distribution of points in a cube and the approximate evaluation of integrals"
- Joe, S. and Kuo, F. Y. (2008). "Constructing Sobol sequences with better two-dimensional projections"
