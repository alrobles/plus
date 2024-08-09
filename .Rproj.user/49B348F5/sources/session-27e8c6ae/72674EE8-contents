#' print a plus object
#'
#' @aliases print.plus
#' @param x fitted plus object
#' @param digits significant digits in printout
#' @param \dots additional print arguments
#' @return information about the plus model
#' @keywords models regression
#' @method print plus
#' @export
#' @examples
#' x <- matrix(rnorm(1000 * 20), 1000, 20)
#' y <- ifelse(rnorm(1000) > 0, 1, 0)
#' fit <- plus(x, y)
#' print(fit)
print.plus <-
  function (x, digits = max(3, getOption("digits") - 3), ...)
  {
    cat("\nCall: ", deparse(x$plus$call), "\n\n")


    optlams = c(x$plus$lambda.min,x$plus$lambda.1se)
    which = match(optlams,x$plus$lambda)
    mat = with(x, cbind(optlams, which, x$plus$cvm[which], x$plus$cvsd[which], x$plus$nzero[which]))
    dimnames(mat) = list(c("min", "1se"), c("Lambda", "Index","Measure",
                                            "SE", "Nonzero"))
    cat("Measure:", x$plus$name,"\n\n")

    mat = data.frame(mat, check.names = FALSE)
    class(mat) = c("anova", class(mat))
    print(mat, digits = digits)

  }
