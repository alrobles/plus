#' make predictions from a "plus" object.
#' This function makes predictions from plus object. Is in essence a cross-validated glmnet model,
#'  optimized with the plus algorithm. It use the optimal value chosen for
#' \code{lambda} for a fit.
#' @param object Fitted \code{"pluse"} object.
#' @param \dots additional predict arguments
#' @param newx Matrix of new values for \code{x} at which predictions are to be
#' made. Must be a matrix; can be sparse as in \code{Matrix} package.
#' @param s Value(s) of the penalty parameter \code{lambda} at which
#' predictions are required. Default is the value \code{s="lambda.min"} stored
#' on the CV \code{object}. Alternatively \code{s="lambda.1se"} can be used. If
#' \code{s} is numeric, it is taken as the value(s) of \code{lambda} to be
#' used. (For historical reasons we use the symbol 's' rather than 'lambda' to
#' reference this parameter)
#' @param type Type of prediction required. Type \code{"link"} gives the linear
#' predictors for \code{"binomial"}. Type \code{"response"} gives the fitted probabilities for
#' \code{"binomial"}. Type \code{"coefficients"} computes the coefficients at the requested values for
#' \code{s}. Type \code{"class"} produces the class label corresponding to
#' the maximum probability. Type \code{"nonzero"} returns a list of the indices
#' of the nonzero coefficients for each value of \code{s}.
#' @return A vector of predicted probabilities or classes
#' @importFrom stats predict
#' @method predict plus
#' @aliases predict.plus
#' @export
#'
#' @examples
#' x_train <- matrix(rnorm(650 * 20), 650, 20)
#' x_test  <- matrix(rnorm(350 * 20), 350, 20)
#' y_train <- ifelse(rnorm(650) > 0, 1, 0)
#' y_test  <- ifelse(rnorm(350) > 0, 1, 0)
#' fit <- plus(x_train, y_train)
#' predict(fit, newx = x_test)
predict.plus <- function(object, ..., newx = NULL, s = "lambda.min", type = 'response'){
  if(is.numeric(s))lambda = s
  else
    if(is.character(s)){
      s = match.arg(s)
      lambda = object$plus[[s]]
      names(lambda)=s
    }
  else stop("Invalid form for s")

  if(is.null(newx)){
    prob <- object$pred_y
  } else{
    prob <- predict(object$plus$glmnet.fit, newx, s = lambda, type = "response")
  }

  if(type == 'response'){
    return(prob)
  } else if(type == 'class'){
    return(as.factor(prob > object$cutoff))
  }
}
