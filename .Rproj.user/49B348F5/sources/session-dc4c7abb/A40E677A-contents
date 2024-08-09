#' Constructor function for the class plus
#' A constructor for the plus class
#'
#' @param fit_plus a cv.glmnet object. Is the output of the plus
#' algorithm performance
#' @param pred_y A vector of predictied probabilities of the plus model
#' @param cutoff The threshold cut of the plus model
#' @param predicted_coefficients the coefficientes values predicted for the plus model
#' @param call Call this function
#'
#' @export
#' @return an object of class plus
#'
#' @examples
#' new_plus(fit_plus = fit_plus_example,
#' pred_y = predicted_y_example,
#' cutoff = cutoff_example,
#' predicted_coefficients = predicted_coefficients_example,
#' call = match.call()
#' )
new_plus <- function(fit_plus = list(),
                     pred_y = matrix(),
                     cutoff = numeric(),
                     predicted_coefficients = Matrix::Matrix(),
                     call = character()
                     ){
  predicted_coefficients <- Matrix::Matrix(predicted_coefficients, sparse = TRUE)

  plus <- structure(
    list(plus = fit_plus,
         pred_y = pred_y,
         cutoff = cutoff,
         predicted_coefficients = predicted_coefficients,
         call = call),
    class = "plus"
  )
  return(plus)
}
