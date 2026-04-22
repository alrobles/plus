#' Summarize a sobol object
#'
#' @aliases summary.sobol
#' @param object fitted sobol object
#' @param \dots additional summary arguments
#' @return A list with summary information about the Sobol sequence generator.
#' @keywords models
#' @method summary sobol
#' @export
#' @examples
#' gen <- sobol(dimension = 3)
#' summary(gen)
summary.sobol <- function(object, ...) {
  cat("\nSobol Sequence Generator Summary\n")
  cat("=================================\n\n")

  if (length(object$call) > 0) {
    cat("Call:\n")
    print(object$call)
    cat("\n")
  }

  cat("Generator Properties:\n")
  cat("  Dimension:           ", object$dimension, "\n")
  cat("  Points generated:    ", object$count, "\n")
  cat("  Initial seed:        ", object$seed, "\n")
  cat("  Maximum sequence:    ", 2^31 - 1, "\n")
  cat("  Remaining capacity:  ", 2^31 - 1 - object$count, "\n\n")

  cat("Methods available:\n")
  cat("  next_point(object)   - Generate next point\n")
  cat("  skip_points(object, n) - Skip n points\n")
  cat("  reset_sobol(object)  - Reset to beginning\n\n")

  summary_list <- list(
    dimension = object$dimension,
    count = object$count,
    seed = object$seed,
    max_sequence = 2^31 - 1,
    remaining = 2^31 - 1 - object$count
  )

  invisible(summary_list)
}
