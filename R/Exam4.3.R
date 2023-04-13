#' @title    Example 4.3 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.3
#' @description Exam4.3 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3}}
#'
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#' data(DataExam4.3)
#' library(tidyverse)
#' library(ggplot2)
#'
#'
#'  # Pg.
#'
#'  fm4.2    <-
#'    aov(
#'        formula     = Percent ~ Replication + Contcomp + SeedLot +
#'                                Pretreatment/Contcomp + Contcomp /SeedLot +
#'                                Pretreatment/ Contcomp/SeedLot
#'       , data      = DataExam4.3
#'     # , subset
#'     # , weights
#'     # , na.action
#'       , method      = "qr"
#'       , model       = TRUE
#'       , x           = FALSE
#'       , y           = FALSE
#'       , qr          = TRUE
#'       , singular.ok = TRUE
#'       , contrasts   = NULL
#'      )
#'  anova(fm4.2)
#'
#'  library(supernova)
#'
#'  supernova(fm4.2)
#'
#'  library(emmeans)
#'
#'
#'    emmeans(
#'        object     = fm4.2
#'      , specs      = ~ Contcomp
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
#'       object        = fm4.2
#'     , formula       = ~ Contcomp
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
#'     emmeans(
#'        object     = fm4.2
#'      , specs      = ~ Contcomp + Pretreatment
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
#'       object        = fm4.2
#'     , formula       = Contcomp ~ Pretreatment
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
#'      emmeans(
#'        object     = fm4.2
#'      , specs      = ~ SeedLot
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
#'       object        = fm4.2
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
#'     emmeans(
#'        object     = fm4.2
#'      , specs      = ~ Contcomp + SeedLot
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
#'       object        = fm4.2
#'     , formula       = Contcomp ~ SeedLot
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
#'  DataExam4.3 %>%
#'    dplyr::group_by(Pretreatment,Contcomp,SeedLot) %>%
#'    dplyr::summarize(Mean=mean(Percent))
#'    RESFIT <- data.frame(residualvalue=residuals(fm4.2),fittedvalue=fitted.values(fm4.2))
#'    ggplot(mapping = aes(x = fitted.values(fm4.2), y = residuals(fm4.2)))+
#'    geom_point(size = 2)+
#'    labs(
#'        x = "Fitted Values"
#'      , y = "Residuals"
#'      ) +
#'      theme_classic()
#'
NULL
