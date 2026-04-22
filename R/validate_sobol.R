#' Validate sobol object constructed via new_sobol function
#'
#' @param sobol_object A sobol object constructed with new_sobol function
#'
#' @return A validated sobol_object
#' @export
#'
#' @examples
#' gen <- new_sobol(
#'   generator = new(SobolGenerator, 2L),
#'   dimension = 2L,
#'   count = 0L,
#'   seed = 0L
#' )
#' validate_sobol(gen)
validate_sobol <- function(sobol_object) {
  values <- unclass(sobol_object)

  # Check that generator is present
  if (is.null(values$generator)) {
    stop("Generator must not be NULL")
  }

  # Check dimension is valid
  stopifnot(is.numeric(values$dimension) || is.integer(values$dimension))
  stopifnot(values$dimension >= 1 && values$dimension <= 10)

  # Check count is numeric
  stopifnot(is.numeric(values$count) || is.integer(values$count))
  stopifnot(values$count >= 0)

  # Check seed is numeric
  stopifnot(is.numeric(values$seed) || is.integer(values$seed))

  sobol_object
}
