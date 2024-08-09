#' Assesment of performance metrics in plus models
#' @param object A plus object
#' @param newx A matrix with new data to test performance
#' @param newy A vector with the observed classes to test performance
#' @param weights optional vector of case weights
#' @param \dots additional arguments
#'
#' @return A list with performance metrics for plus models
#' @export
#' @examples
#' x_train <- matrix(rnorm(650 * 20), 650, 20)
#' x_test  <- matrix(rnorm(350 * 20), 350, 20)
#' y_train <- ifelse(rnorm(650) > 0, 1, 0)
#' y_test  <- ifelse(rnorm(350) > 0, 1, 0)
#' fit <- plus(x_train, y_train)
#' assess_plus(fit, newx = x_test, newy = y_test)
assess_plus <- function(object, newx=NULL, newy, weights = NULL, ...){
  ### object must be either a glmnet or cv.glmnet object, or else a matrix/vector of predictions of a glmnet model  (not on the mean scale, but natural parameter scale)

  predmat = predict(object, newx = newx,...)
  fam = "binomial"
  attr(predmat, "family") = fam

  type.measures = c("deviance", "class", "auc", "mse", "mae")

  y <- drop(newy)
  dimy <- dim(y)
  nrowy <- ifelse(is.null(dimy),length(y),dimy[1])

  if (is.null(weights)){
    weights = rep(1, nrowy)
  }
  outlist <- as.list(type.measures)
  names(outlist) <- type.measures

  for(measure in type.measures){

    teststuff <-  do.call(plus_cv_lognet, list(predmat, y, measure) )
    out <-  drop(with(teststuff, apply(cvraw, 2, stats::weighted.mean, w = weights, na.rm = TRUE)))
    attr(out, "measure") = measure
    outlist[[measure]] = out
  }
  outlist
}
