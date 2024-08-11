#' Gets the Area under ROC curve usingthe concordance statistics
#'
#' @param y A vector of binary clases
#' @param prob A vector of probabilities (logistic regression output)
#' @param w optional vector of case weights
#'
#' @return The AUC value for a plus object
#' @export
#'
#' @examples
#' x_train <- matrix(rnorm(650 * 20), 650, 20)
#' x_test  <- matrix(rnorm(350 * 20), 350, 20)
#' y_train <- ifelse(rnorm(650) > 0, 1, 0)
#' y_test  <- ifelse(rnorm(350) > 0, 1, 0)
#' fit <- plus(x_train, y_train)
#' p_response <- plus:::predict.plus(fit, newx = x_test)
#' p_class <- plus:::predict.plus(fit, newx = x_test, type = "class")
#' auc(p_class, p_response)
auc <- function(y, prob, w){
  if(missing(w))
    survival::concordance(y ~ prob)$concordance
  else survival::concordance(y ~ prob, weights = w)$concordance
}
