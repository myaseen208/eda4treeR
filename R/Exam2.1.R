#' @title    Example 2.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam2.1
#' @description Exam2.1 is used to  compare two seed lots by using single factor ANOVA.
#' @author
#' \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item  Sami Ullah (\email{samiullahuos@@gmail.com})
#'          }
#'
#' @references
#' \enumerate{
#'          \item Williams, E. R., Matheson, A. C. and Harwood, C. E. (2023). \emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing (\href{https://www.publish.csiro.au/book/3145/}{https://www.publish.csiro.au/book/3145/}).
#'              }
#'
#' @seealso
#'    \code{\link{DataExam2.1}}
#'
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#' data(DataExam2.1)
#' library(tidyverse)
#'
#' # Pg. 22
#'
#' fmtab2.3  <-
#'   lm(
#'     formula     = dbh ~ SeedLot
#'   , data        = DataExam2.1
#' # , subset
#' # , weights
#' # , na.action
#'   , method      = "qr"
#'   , model       = TRUE
#'   , x           = FALSE
#'   , y           = FALSE
#'   , qr          = TRUE
#'   , singular.ok = TRUE
#'   , contrasts   = NULL
#'   )
#'
#' # Pg. 23
#'
#' anova(fmtab2.3)
#'
#' library(supernova)
#'
#' supernova(fmtab2.3)
#'
#' library(emmeans)
#'
#' # Pg. 23
#'
#' emmeans(
#'     object     = fmtab2.3
#'   , specs      = ~ SeedLot
#'   , by         = NULL
#'   , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'   , contr      =
#'   , options    = get_emm_option("emmeans")
#'   , weights    =
#'   , offset     =
#'   , tran       =
#'   )
#'
#'
#' emmip(
#'     object        = fmtab2.3
#'   , formula       = ~ SeedLot
#'   , type          = c("link", "response", "predict.type")[1]
#'   , CIs           = c(TRUE, FALSE)[1]
#'   , PIs           = c(TRUE, FALSE)[2]
#'   , style         =
#'   , engine        = get_emm_option("graphics.engine")
#'   , plotit        = TRUE
#'   , nesting.order = FALSE
#'   ) +
#'   theme_classic()
#'
NULL
