#' Print a sobol object
#'
#' @aliases print.sobol
#' @param x fitted sobol object
#' @param digits significant digits in printout
#' @param \dots additional print arguments
#' @return Invisibly returns the sobol object. Side effect: prints information about the Sobol sequence generator.
#' @keywords models
#' @method print sobol
#' @export
#' @examples
#' gen <- sobol(dimension = 2)
#' print(gen)
print.sobol <- function(x, digits = max(3, getOption("digits") - 3), ...) {
  cat("\nSobol Sequence Generator\n")
  cat("========================\n\n")

  if (length(x$call) > 0) {
    cat("Call: ", deparse(x$call), "\n\n")
  }

  cat("Dimension:      ", x$dimension, "\n")
  cat("Points generated:", x$count, "\n")
  if (x$seed > 0) {
    cat("Initial seed:   ", x$seed, "\n")
  }

  cat("\nUse next_point() to generate the next point in the sequence\n")
  cat("Use skip_points() to skip ahead in the sequence\n")
  cat("Use reset_sobol() to reset the generator\n")

  invisible(x)
}
