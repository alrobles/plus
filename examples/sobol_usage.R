# Example: Using the Sobol Sequence Generator in the plus package

# This file demonstrates the usage of the new S3 Sobol sequence generator
# Following the patterns established in the plus package

# =============================================================================
# Basic Usage
# =============================================================================

# Load the plus package
library(plus)

# Create a 2-dimensional Sobol generator
gen <- sobol(dimension = 2)
print(gen)
# Output shows:
# - Dimension: 2
# - Points generated: 0
# - Available methods: next_point(), skip_points(), reset_sobol()

# =============================================================================
# Generate Single Points (Incremental Interface)
# =============================================================================

# Generate the next point in the sequence
point1 <- next_point(gen)
print(point1)  # Returns numeric vector of length 2

# Generate another point
point2 <- next_point(gen)
print(point2)

# Check the generator status
print(gen)  # Shows: Points generated: 2

# =============================================================================
# Generate Multiple Points at Once
# =============================================================================

# Create a fresh generator
gen2 <- sobol(dimension = 2)

# Generate 100 points at once
points <- generate_points(gen2, n = 100)
dim(points)  # 100 x 2 matrix

# Visualize the uniform coverage
plot(points, pch = 20, col = "blue",
     main = "First 100 points of 2D Sobol Sequence",
     xlab = "Dimension 1", ylab = "Dimension 2")

# =============================================================================
# Advanced: Skip and Reset Operations
# =============================================================================

# Create a generator and skip ahead
gen3 <- sobol(dimension = 3)
gen3 <- skip_points(gen3, 1000)
point <- next_point(gen3)  # This is the 1001st point

# Reset the generator to start over
gen3 <- reset_sobol(gen3)
first_point <- next_point(gen3)  # Back to the first point

# =============================================================================
# Reproducibility: Starting from a Specific Position
# =============================================================================

# Create two generators starting at position 500
gen4a <- sobol(dimension = 2, seed = 500)
gen4b <- sobol(dimension = 2, seed = 500)

# Both will generate the same sequence
point_a <- next_point(gen4a)
point_b <- next_point(gen4b)
all.equal(point_a, point_b)  # TRUE

# =============================================================================
# S3 Methods
# =============================================================================

# Create a generator
gen5 <- sobol(dimension = 3)

# Print method shows basic information
print(gen5)

# Summary method shows detailed information
summary(gen5)
# Output includes:
# - Dimension: 3
# - Points generated: 0
# - Initial seed: 0
# - Maximum sequence: 2147483647
# - Remaining capacity: 2147483647

# =============================================================================
# Validation
# =============================================================================

# The constructor automatically validates inputs
tryCatch({
  gen_invalid <- sobol(dimension = 15)  # Max is 10
}, error = function(e) {
  cat("Error caught:", e$message, "\n")
})

# The validate_sobol() function can be used explicitly
gen6 <- new_sobol(
  generator = new(SobolGenerator, 2L),
  dimension = 2L,
  count = 0L,
  seed = 0L
)
validate_sobol(gen6)  # Returns validated object

# =============================================================================
# Example Application: Quasi-Monte Carlo Integration
# =============================================================================

# Integrate f(x,y) = x^2 + y^2 over [0,1]^2
# True value = 2/3 ≈ 0.6667

# Using Sobol sequence
n <- 10000
gen_qmc <- sobol(dimension = 2)
points_qmc <- generate_points(gen_qmc, n = n)
estimate_qmc <- mean(points_qmc[,1]^2 + points_qmc[,2]^2)

# Using random sampling (for comparison)
points_rand <- matrix(runif(2*n), ncol = 2)
estimate_rand <- mean(points_rand[,1]^2 + points_rand[,2]^2)

cat("\nNumerical Integration Results:\n")
cat("True value:           ", 2/3, "\n")
cat("Sobol estimate:       ", estimate_qmc, "\n")
cat("Random estimate:      ", estimate_rand, "\n")
cat("Sobol error:          ", abs(estimate_qmc - 2/3), "\n")
cat("Random error:         ", abs(estimate_rand - 2/3), "\n")

# =============================================================================
# Example: Comparing Coverage (2D Visualization)
# =============================================================================

# Generate 500 points with different methods
n_compare <- 500

# Sobol sequence
gen_sobol <- sobol(dimension = 2)
pts_sobol <- generate_points(gen_sobol, n = n_compare)

# Random sampling
pts_random <- matrix(runif(2*n_compare), ncol = 2)

# Plot comparison
par(mfrow = c(1, 2))
plot(pts_random, pch = 20, col = "red",
     main = "Random Sampling (500 points)",
     xlab = "x", ylab = "y", xlim = c(0,1), ylim = c(0,1))

plot(pts_sobol, pch = 20, col = "blue",
     main = "Sobol Sequence (500 points)",
     xlab = "x", ylab = "y", xlim = c(0,1), ylim = c(0,1))

# Notice how Sobol provides more uniform coverage

# =============================================================================
# Example: Higher Dimensions
# =============================================================================

# Create a 5-dimensional generator
gen_5d <- sobol(dimension = 5)

# Generate points in 5D space
points_5d <- generate_points(gen_5d, n = 1000)
dim(points_5d)  # 1000 x 5

# Check the summary
summary(gen_5d)

# =============================================================================
# Following plus Package Patterns
# =============================================================================

# The sobol class follows the same S3 patterns as the plus class:
# 1. Constructor: new_sobol() creates the structure
# 2. Validator: validate_sobol() checks the object
# 3. User function: sobol() provides the user-facing interface
# 4. S3 methods: print.sobol() and summary.sobol() for display
# 5. Helper functions: next_point(), skip_points(), reset_sobol(), generate_points()

# Compare with plus class structure:
plus_example <- plus(
  x = matrix(rnorm(1000 * 20), 1000, 20),
  y = ifelse(rnorm(1000) > 0, 1, 0)
)
print(plus_example)  # Uses print.plus()
class(plus_example)  # "plus"

# Similarly for sobol:
sobol_example <- sobol(dimension = 2)
print(sobol_example)  # Uses print.sobol()
class(sobol_example)  # "sobol"
