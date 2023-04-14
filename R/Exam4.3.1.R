#' @title    Example 4.3.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.3.1
#' @description Exam4.3.1 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3.1}}
#'
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#'
#' data(DataExam4.3)
#' library(tidyverse)
#' library(ggplot2)
#'
#' # Pg. 57
#' fm4.4    <-
#'   aov(
#'       formula     = Percent ~ Repl + Treat*SeedLot
#'     , data        = DataExam4.3 %>%
#'                     filter(Treat != "control")
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
#'    )
#'
#'
#'  # Pg. 57
#'  anova(fm4.4)
#'  model.tables(x = fm4.4, type = "means")
#'
#'   library(emmeans)
#'
#'
#'   emmeans(
#'       object     = fm4.4
#'     , specs      = ~ Treat
#'     , by         = NULL
#'     , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'     , contr      =
#'     , options    = get_emm_option("emmeans")
#'     , weights    =
#'     , offset     =
#'     , tran       =
#'     )
#'
#'  emmip(
#'      object        = fm4.4
#'    , formula       = ~ Treat
#'    , type          = c("link", "response", "predict.type")[1]
#'    , CIs           = c(TRUE, FALSE)[1]
#'    , PIs           = c(TRUE, FALSE)[2]
#'    , style         =
#'    , engine        = get_emm_option("graphics.engine")
#'    , plotit        = TRUE
#'    , nesting.order = FALSE
#'    ) +
#'    theme_classic()
#'
#'   emmeans(
#'         object     = fm4.4
#'       , specs      = ~ SeedLot
#'       , by         = NULL
#'       , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'       , contr      =
#'       , options    = get_emm_option("emmeans")
#'       , weights    =
#'       , offset     =
#'       , tran       =
#'       )
#'
#'  emmip(
#'      object        = fm4.4
#'    , formula       = ~ SeedLot
#'    , type          = c("link", "response", "predict.type")[1]
#'    , CIs           = c(TRUE, FALSE)[1]
#'    , PIs           = c(TRUE, FALSE)[2]
#'    , style         =
#'    , engine        = get_emm_option("graphics.engine")
#'    , plotit        = TRUE
#'    , nesting.order = FALSE
#'    ) +
#'    theme_classic()
#'
#'   emmeans(
#'         object     = fm4.4
#'       , specs      = ~ Treat * SeedLot
#'       , by         = NULL
#'       , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'       , contr      =
#'       , options    = get_emm_option("emmeans")
#'       , weights    =
#'       , offset     =
#'       , tran       =
#'       )
#'
#'  emmip(
#'      object        = fm4.4
#'    , formula       = SeedLot ~ Treat
#'    , type          = c("link", "response", "predict.type")[1]
#'    , CIs           = c(TRUE, FALSE)[1]
#'    , PIs           = c(TRUE, FALSE)[2]
#'    , style         =
#'    , engine        = get_emm_option("graphics.engine")
#'    , plotit        = TRUE
#'    , nesting.order = FALSE
#'    ) +
#'    theme_classic()
#'
#'
#'  emmip(
#'      object        = fm4.4
#'    , formula       = Treat ~ SeedLot
#'    , type          = c("link", "response", "predict.type")[1]
#'    , CIs           = c(TRUE, FALSE)[1]
#'    , PIs           = c(TRUE, FALSE)[2]
#'    , style         =
#'    , engine        = get_emm_option("graphics.engine")
#'    , plotit        = TRUE
#'    , nesting.order = FALSE
#'    ) +
#'    theme_classic()
NULL
