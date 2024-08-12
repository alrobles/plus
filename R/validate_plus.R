
#' validate plus_object constructed via new_plus function
#'
#' @param plus_object A plus object constructed with new_plus function
#'
#' @return A validated plus_object
#' @export
#'
#' @examples
#' validate_plus(
#' new_plus(fit_plus = fit_plus_example,
#' pred_y = predicted_y_example,
#' cutoff = cutoff_example,
#' predicted_coefficients = predicted_coefficients_example)
#' )
validate_plus <- function(plus_object){
  values  <- unclass(plus_object)
  stopifnot(class(values$plus) == "cv.glmnet")
  stopifnot(is.matrix(values$pred_y))
  stopifnot(is.numeric(values$cutoff))
  stopifnot(class(values$predicted_coefficients) == "dgCMatrix")
  plus_object
}
