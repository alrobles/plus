#' Constructor function for the class sobol
#' A constructor for the sobol sequence generator class
#'
#' @param generator An Rcpp SobolGenerator object. The underlying C++ generator.
#' @param dimension The dimension of the Sobol sequence (1-10).
#' @param count The current count of generated points.
#' @param seed The initial seed/skip value used.
#' @param call Call to this function for reproducibility.
#'
#' @export
#' @return An object of class sobol
#'
#' @examples
#' # Create a 2-dimensional Sobol generator
#' gen <- new_sobol(
#'   generator = new(SobolGenerator, 2L),
#'   dimension = 2L,
#'   count = 0L,
#'   seed = 0L,
#'   call = match.call()
#' )
new_sobol <- function(generator = NULL,
                      dimension = 1L,
                      count = 0L,
                      seed = 0L,
                      call = character()) {

  sobol <- structure(
    list(
      generator = generator,
      dimension = dimension,
      count = count,
      seed = seed,
      call = call
    ),
    class = "sobol"
  )
  return(sobol)
}
