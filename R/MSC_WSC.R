#' MSC Dataset
#'
#' This dataset contains measurements of confidence in understanding and ability to
#' simplify algebraic expressions involving exponents. The 5-point Likert-type items
#' were developed by Keller et al. (...) and administered to 2,200 Amazon Mechanical
#' Turk workers. The dataset includes Math Confidence Scale (MCS) measurements taken before
#' and after a math training intervention. The final variable, named 'type', indicates whether
#' the data were collected before or after the intervention.
#'
#'
#' @name MSC_WSC
#' @docType data
#' @format MSC_WSC is a data frame with 2200 cases (rows) and 7 variables (columns).
#' The variables are named item_1, item_2 ...., item_6, and type ("pre" or "post").
#' \describe{
#'   \item{item_1}{I understand the meaning of a factor in an algebraic expression.}
#'   \item{item_2}{I understand the difference between a base and an expression in an algebraic expression.}
#'   \item{item_3}{I can simplify algebraic expressions that involve multiplying exponential expressions with the same base.}
#'   \item{item_4}{I can simplify algebraic expressions that involve dividing exponential expressions with the same base.}
#'   \item{item_5}{I can simplify algebraic expressions that involve raising an expression to a power.}
#'   \item{item_6}{I can simplify algebraic expressions that involve negative exponents.}
#'   \item{type}{Either "pre" or "post", indicating assessment timing.}
#' }
#'
#' @usage data(MSC_WSC)
#'
#' @source Keller et al., ....
#'
#' @references Keller et al., ....
#'
#' @keywords datasets
#'
#' @examples
#' data(MSC_WSC)
#' summary(MSC_WSC)

NULL
