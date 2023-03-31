#' @title    Example 2.2 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam2.2
#' @description Exam2.2 is used to  compare two seed lots by using ANOVA under RCB Design.
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
#'    \code{\link{DataExam2.2}}
#'
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#' library(tidyverse)
#' data(DataExam2.2)
#'
#' fmtab2.5  <-
#'  lm(
#'       formula       = dbh ~ Blk + SeedLot
#'     , data        = DataExam2.2
#'   # , subset
#'   # , weights
#'   # , na.action
#'     , method      = "qr"
#'     , model       = TRUE
#'     , x           = FALSE
#'     , y           = FALSE
#'     , qr          = TRUE
#'     , singular.ok = TRUE
#'     , contrasts   = NULL
#'   )
#'
#' anova(fmtab2.5)
#'
#' library(supernova)
#'
#' supernova(fmtab2.5)
#'
#' library(emmeans)
#'
#'
#' emmeans(
#'     object     = fmtab2.5
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
#'     object        = fmtab2.5
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
