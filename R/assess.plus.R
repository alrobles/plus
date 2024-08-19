#' Assessment of performance metrics in plus models
#' @aliases assess.plus
#' @param object A plus object
#' @param newx A matrix with new data to test performance
#' @param newy A vector with the observed classes to test performance
#' @param weights optional vector of case weights
#' @param \dots additional arguments
#'
#' @return A list with performance metrics for plus models

#' @examples
#' #' data(binexample)
#' x = binexample$x
#' y = binexample$y
#' s <- sample(seq(nrow(x)), 65, replace = FALSE)
#' x_train <- x[s, ]
#' x_test  <- x[-s, ]
#' y_train <- y[s]
#' y_test  <- y[-s]
#' fit <- plus(x_train, y_train)
#' assess(fit, newx = x_test, newy = y_test)
#' @rdname assess
#' @export assess
assess <- function(object, newx=NULL, newy, weights = NULL, ...) {
  UseMethod("assess")
}
#' @rdname assess
#' @export assess.plus
#' @export
assess.plus <- function(object, newx=NULL, newy, weights = NULL, ...){
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
    attr(out, "measure") = names(measure)
    outlist[[measure]] = out
  }
  outlist
}
