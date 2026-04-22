#' Create a Sobol Sequence Generator
#'
#' Creates a Sobol sequence generator object for generating quasi-random
#' low-discrepancy sequences. Sobol sequences are useful for quasi-Monte Carlo
#' methods, numerical integration, and sampling in high-dimensional spaces.
#'
#' @param dimension Integer between 1 and 10. The dimension of the Sobol sequence.
#' @param seed Integer. Optional initial position in the sequence. If provided,
#'   the generator will skip to this position. Default is 0 (start from beginning).
#'
#' @return A sobol object containing:
#'   \item{generator}{The underlying Rcpp SobolGenerator object}
#'   \item{dimension}{The dimension of the sequence}
#'   \item{count}{Number of points generated}
#'   \item{seed}{Initial seed/skip value}
#'   \item{call}{The function call for reproducibility}
#'
#' @export
#' @examples
#' # Create a 2-dimensional Sobol generator
#' gen <- sobol(dimension = 2)
#' print(gen)
#'
#' # Generate some points
#' point1 <- next_point(gen)
#' point2 <- next_point(gen)
#'
#' # Generate multiple points at once
#' points <- generate_points(gen, n = 10)
#'
#' # Reset and start over
#' gen <- reset_sobol(gen)
#'
#' # Create generator starting at position 100
#' gen2 <- sobol(dimension = 3, seed = 100)
sobol <- function(dimension = 1L, seed = 0L) {
  # Validate inputs
  dimension <- as.integer(dimension)
  seed <- as.integer(seed)

  if (dimension < 1 || dimension > 10) {
    stop("Dimension must be between 1 and 10")
  }

  if (seed < 0) {
    stop("Seed must be non-negative")
  }

  # Create the C++ generator
  if (seed > 0) {
    generator <- new(SobolGenerator, dimension, seed)
  } else {
    generator <- new(SobolGenerator, dimension)
  }

  # Create the S3 object
  sobol_obj <- new_sobol(
    generator = generator,
    dimension = dimension,
    count = seed,
    seed = seed,
    call = match.call()
  )

  # Validate and return
  validate_sobol(sobol_obj)
}
