#' Generate Next Point in Sobol Sequence
#'
#' Generates the next point in the Sobol sequence.
#'
#' @param sobol_object A sobol object created with \code{sobol()}
#'
#' @return A numeric vector of length \code{dimension} containing the next point
#'   in the sequence. Values are in the range [0, 1).
#' @export
#'
#' @examples
#' gen <- sobol(dimension = 2)
#' point1 <- next_point(gen)
#' point2 <- next_point(gen)
#' print(point1)
#' print(point2)
next_point <- function(sobol_object) {
  if (!inherits(sobol_object, "sobol")) {
    stop("Object must be of class 'sobol'")
  }

  # Generate the next point using the C++ generator
  point <- sobol_object$generator$next()

  # Update count (note: modifies by reference, but we return for CRAN compliance)
  sobol_object$count <- sobol_object$count + 1

  return(point)
}


#' Skip Points in Sobol Sequence
#'
#' Skips ahead n points in the Sobol sequence without generating them.
#'
#' @param sobol_object A sobol object created with \code{sobol()}
#' @param n Integer. Number of points to skip.
#'
#' @return The updated sobol object (invisibly). Side effect: advances the generator.
#' @export
#'
#' @examples
#' gen <- sobol(dimension = 2)
#' gen <- skip_points(gen, n = 100)
#' # Now next_point() will generate the 101st point
#' point <- next_point(gen)
skip_points <- function(sobol_object, n) {
  if (!inherits(sobol_object, "sobol")) {
    stop("Object must be of class 'sobol'")
  }

  n <- as.integer(n)
  if (n < 0) {
    stop("n must be non-negative")
  }

  if (n > 0) {
    # Skip n points using the C++ generator
    sobol_object$generator$skip(n)

    # Update count
    sobol_object$count <- sobol_object$count + n
  }

  # Return the updated object for CRAN compliance (side effect with return)
  invisible(sobol_object)
}


#' Reset Sobol Sequence Generator
#'
#' Resets the Sobol sequence generator back to the beginning.
#'
#' @param sobol_object A sobol object created with \code{sobol()}
#'
#' @return The updated sobol object (invisibly). Side effect: resets the generator.
#' @export
#'
#' @examples
#' gen <- sobol(dimension = 2)
#' point1 <- next_point(gen)
#' point2 <- next_point(gen)
#' gen <- reset_sobol(gen)
#' # Now next_point() will generate the same as point1 again
#' point1_again <- next_point(gen)
reset_sobol <- function(sobol_object) {
  if (!inherits(sobol_object, "sobol")) {
    stop("Object must be of class 'sobol'")
  }

  # Reset the C++ generator
  sobol_object$generator$reset()

  # Reset count to 0 (or to seed if one was used)
  sobol_object$count <- 0

  # Return the updated object for CRAN compliance (side effect with return)
  invisible(sobol_object)
}


#' Generate Multiple Points from Sobol Sequence
#'
#' Generates multiple points from the Sobol sequence at once.
#'
#' @param sobol_object A sobol object created with \code{sobol()}
#' @param n Integer. Number of points to generate.
#'
#' @return A matrix with n rows and dimension columns, where each row is a point
#'   in the sequence.
#' @export
#'
#' @examples
#' gen <- sobol(dimension = 3)
#' points <- generate_points(gen, n = 100)
#' head(points)
#'
#' # Plot the first 1000 points in 2D
#' gen2d <- sobol(dimension = 2)
#' pts <- generate_points(gen2d, n = 1000)
#' plot(pts, pch = ".", main = "Sobol Sequence (2D)")
generate_points <- function(sobol_object, n) {
  if (!inherits(sobol_object, "sobol")) {
    stop("Object must be of class 'sobol'")
  }

  n <- as.integer(n)
  if (n <= 0) {
    stop("n must be positive")
  }

  # Pre-allocate matrix
  points <- matrix(0, nrow = n, ncol = sobol_object$dimension)

  # Generate points
  for (i in 1:n) {
    points[i, ] <- next_point(sobol_object)
  }

  return(points)
}
