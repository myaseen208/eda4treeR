#' @title    Example 4.4 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.4
#' @description Exam4.4 presents the height means for 4 seedlots under factorial arrangement for two
#'              levels of Fertilizer and two levels of Irrigation.
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
#'
#' @seealso
#'    \code{\link{DataExam4.4}}
#'
#'
#' @import dae
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#' data(DataExam4.4)
#' library(tidyverse)
#' library(ggplot2)
#' library(dae)
#'
#' fm4.6    <- aov(
#'       formula     = Height ~ Rep + Irrig*Ferti*SeedDLot +
#'                              Error(Rep/Irrig:Ferti)
#'     , data        = DataExam4.4
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
#'     )
#'  summary(fm4.6)
#'
#'    library(supernova)
#'
#'    supernova(fm4.6)
#'
#'
#'    emmeans(
#'        object     = fm4.6
#'      , specs      = ~ Irrig
#'      , by         = NULL
#'      , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'      , contr      =
#'      , options    = get_emm_option("emmeans")
#'      , weights    =
#'      , offset     =
#'      , tran       =
#'      )
#'
#'   emmip(
#'       object        = fm4.6
#'     , formula       = ~ Irrig
#'     , type          = c("link", "response", "predict.type")[1]
#'     , CIs           = c(TRUE, FALSE)[1]
#'     , PIs           = c(TRUE, FALSE)[2]
#'     , style         =
#'     , engine        = get_emm_option("graphics.engine")
#'     , plotit        = TRUE
#'     , nesting.order = FALSE
#'     ) +
#'     theme_classic()
#'
#'
#'    emmeans(
#'          object     = fm4.6
#'        , specs      = ~ Ferti
#'        , by         = NULL
#'        , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'        , contr      =
#'        , options    = get_emm_option("emmeans")
#'        , weights    =
#'        , offset     =
#'        , tran       =
#'        )
#'
#'   emmip(
#'       object        = fm4.4
#'     , formula       = ~ Ferti
#'     , type          = c("link", "response", "predict.type")[1]
#'     , CIs           = c(TRUE, FALSE)[1]
#'     , PIs           = c(TRUE, FALSE)[2]
#'     , style         =
#'     , engine        = get_emm_option("graphics.engine")
#'     , plotit        = TRUE
#'     , nesting.order = FALSE
#'     ) +
#'     theme_classic()
#'
#'    emmeans(
#'          object     = fm4.6
#'        , specs      = ~ SeedLot
#'        , by         = NULL
#'        , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'        , contr      =
#'        , options    = get_emm_option("emmeans")
#'        , weights    =
#'        , offset     =
#'        , tran       =
#'        )
#'
#'   emmip(
#'       object        = fm4.4
#'     , formula       = ~ SeedLot
#'     , type          = c("link", "response", "predict.type")[1]
#'     , CIs           = c(TRUE, FALSE)[1]
#'     , PIs           = c(TRUE, FALSE)[2]
#'     , style         =
#'     , engine        = get_emm_option("graphics.engine")
#'     , plotit        = TRUE
#'     , nesting.order = FALSE
#'     ) +
#'     theme_classic()
#'
NULL

