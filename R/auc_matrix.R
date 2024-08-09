#' AUC evaluation for matrix (data.frame) data
#'
#' @param y Label binary class vector
#' @param prob probability output
#' @param weights optional vector of case weights
#'
#' @return A matrix with AUC values
#' @export
#'
#' @examples
#' x_train <- matrix(rnorm(650 * 20), 650, 20)
#' x_test  <- matrix(rnorm(350 * 20), 350, 20)
#' y_train <- ifelse(rnorm(650) > 0, 1, 0)
#' y_test  <- ifelse(rnorm(350) > 0, 1, 0)
#' fit <- plus(x_train, y_train)
#' p_response <- predict(fit, newx = x_test)
#' p_class <- plus:::predict.plus(fit, newx = x_test, type = "class")
#' p_class <- as.matrix(p_class)
#' auc_matrix(p_class, p_response)
auc_matrix <- function(y, prob, weights){

  ny <- nrow(y)
  Y <- rep(c(0,1),c(ny,ny))
  Prob <- c(prob, prob)
  if(missing(weights)){
    auc(y = Y, prob = Prob)
  } else {
    Weights <- as.vector(weights*y)
    auc(y = Y, prob = Prob, w = Weights)
  }

}
