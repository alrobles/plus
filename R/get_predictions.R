#' Get predictions to asses model performance from a fitted plus model.
#'
#' @param object A plus object with glmnet classification
#' @param newx New data to predict the class
#' @param newy The observed class to meassure the performance of the model
#' @param plus Logical. If it is true use the cutoff threshold from the plus model.
#' This tends to reduce the false negatives and increase the recall. Othewise
#' gets the predicted value from glmnet default predicted response.#'
#' @return A \code{data.frame} containing four columns. The truth independent
#' value (observed y), the probability to belong in Class1, the probability to
#' belong Class2 and the predicted class either the plus (use cutoff threshold)
#' or glmnet model.
#' @export
#'
#' @examples
#' data(binexample)
#' x = binexample$x
#' y = binexample$y
#' s <- sample(seq(nrow(x)), 65, replace = FALSE)
#' train_x <- x[s, ]
#' train_y <- y[s]
#' newx <- x[-s, ]
#' newy <- y[-s]
#' model <- plus(train_x, train_y)
#' get_predictions(model, newx, newy)
#' get_predictions(model, newx, newy, plus = FALSE)
get_predictions <- function(object, newx, newy, plus = TRUE){

  truth <- ifelse(newy == 1, "Class1", "Class2") |> as.factor()

  if(plus){
    predicted   <- predict(object, newx = newx, s = "lambda.min", type = "class")
    predicted <- ifelse(predicted == 1, "Class1", "Class2") |> as.factor()
    class1 <- predict(object, newx = newx, s = "lambda.min", type = "response") |> as.numeric()
    class2 <- 1 - class1
  } else{
    predicted   <- predict(object$plus, newx = newx, type = "class") |> as.factor()
    predicted <- ifelse(predicted == 1, "Class1", "Class2") |> as.factor()
    class1 <- predict(object$plus, newx = newx, type = "response") |> as.numeric()
    class2 <- 1 - class1
  }

  tab <- tibble::as_tibble(
    data.frame(truth = truth,
               Class1 = class1,
               Class2 = class2,
               predicted)
  )
  return(tab)
}

