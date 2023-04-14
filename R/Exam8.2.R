#' @title    Example 8.2 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam8.2
#' @description Exam8.2 presents the Diameter at breast height (Dbh) of 60 SeedLots
#'              under layout of row column design with 6 rows and 10 columns in 18
#'              countries and 59 provinces of 18 selected countries.
#' @author
#' \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item  Sami Ullah (\email{samiullahuos@@gmail.com})
#'          }
#'
#' @references
#' \enumerate{
#'          \item Williams, E.R., Matheson, A.C. and Harwood, C.E. (2023).\emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing.
#'              }
#'
#' @seealso
#'    \code{\link{DataExam8.2}}
#'
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam8.2)
#' library(tidyverse)
#' library(ggplot2)
#'
#' # Pg.
#'
#' fm8.2  <-
#'   lmer(
#'     formula = dbhmean ~ Repl + Column + Contcompf + Contcompf:Standard +
#'               (1|Repl:Row ) + (1|Repl:Column ) + (1|Contcompf:Clone)
#'   , data    = DataExam8.2
#'     )
#' summary(fm8.2)
#' summary(fm8.2)$varcor
#'
#' anova(fm8.2)
#'
#' library(car)
#' Anova(fm8.2, type = "II", test.statistic = "Chisq")
#'
NULL
