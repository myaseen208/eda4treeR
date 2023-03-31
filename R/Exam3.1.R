#' @title    Data for Example 3.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam3.1
#' @description Exam3.1 is part of data from Australian Centre for Agricultural Research (ACIAR)
#'              in Queensland, Australia (Experiment 309).
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
#'    \code{\link{DataExam3.1}}
#'
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#' @importFrom supernova supernova
#' @importFrom emmeans emmeans emmip
#'
#' @examples
#' data(DataExam3.1)
#' library(tidyverse)
#'
#' fmtab3.3     <-
#'   lm(
#'      formula     = Ht ~ Repl*SeedLot
#'    , data        = DataExam3.1
#'  # , subset
#'  # , weights
#'  # , na.action
#'    , method      = "qr"
#'    , model       = TRUE
#'    , x           = FALSE
#'    , y           = FALSE
#'    , qr          = TRUE
#'    , singular.ok = TRUE
#'    , contrasts   = NULL
#'     )
#'
#'  anova(fmtab3.3)
#'
#'  library(supernova)
#'
#'  supernova(fmtab3.3)
#'
#'  library(emmeans)
#'
#'
#'  emmeans(
#'      object     = fmtab3.3
#'    , specs      = ~ SeedLot
#'    , by         = NULL
#'    , fac.reduce = function(coefs) apply(coefs, 2, mean)
#'    , contr      =
#'    , options    = get_emm_option("emmeans")
#'    , weights    =
#'    , offset     =
#'    , tran       =
#'    )
#'
#'  library(ggplot2)
#'  ggplot(mapping = aes(x = fitted.values(fmtab3.3), y = residuals(fmtab3.3)))+
#'  geom_point(size = 2) +
#'  labs(
#'     x = "Fitted Values"
#'   , y = "Residual"
#'    ) +
#'  theme_classic()
#'
NULL
