#' Assessment of auc metrics in plus models
#' @aliases get_auc.plus
#' @param object A plus object
#' @param newx A matrix with new data to test performance
#' @param newy A vector with the observed classes to test performance
#' @param weights optional vector of case weights
#' @param \dots additional arguments
#'
#' @rdname get_auc
#' @export get_auc
get_auc <- function(object, newx = NULL, newy = NULL, weights = NULL, ...) {
    UseMethod("get_auc")
  }

#' @rdname get_auc
#' @export get_auc.plus
#' @export
#' @examples
#' data(binexample)
#' x <- binexample$x
#' y <- binexample$y
#' train <- sample(seq(length(y)), 65, replace = FALSE)
#' x_train <- x[train, ]
#' x_test  <- x[-train, ]
#' y_train <- y[train]
#' y_test  <- y[-train]
#' fit <- plus(x_train, y_train)
#' get_auc(fit, x_test, y_test)
get_auc.plus <- function(object, newx = NULL, newy =NULL, weights = NULL, ...){

  if(is.null(newx)){
    stop("Provde newx data")
  }

  if(is.null(newy)){
    stop("Provide newy data")
  }
  p_response <- plus:::predict.plus(object, newx = newx, type = "response")
  names(p_response) <- "auc"
  return(auc(newy, p_response, w = weights))
}
