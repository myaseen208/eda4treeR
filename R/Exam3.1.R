#' @title    Data for Example 3.1 from Experimental Design and Analysis for Tree Improvement
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
#'          \item E.R. Williams, C.E. Harwood and A.C. Matheson (2023). \emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing (\href{https://www.publish.csiro.au/book/3145/}{https://www.publish.csiro.au/book/3145/}).
#'              }
#'
#' @seealso
#'    \code{\link{DataExam3.1}}
#'
#' @importFrom car Anova
#' @import dae
#' @import dplyr
#' @importFrom emmeans emmeans emmip
#' @import ggplot2
#' @importFrom lmerTest lmer
#' @importFrom magrittr %>%
#' @import predictmeans
#' @importFrom stats lm anova model.tables
#' @importFrom supernova supernova
#'
#' @examples
#' library(car)
#' library(dae)
#' library(dplyr)
#' library(emmeans)
#' library(ggplot2)
#' library(lmerTest)
#' library(magrittr)
#' library(predictmeans)
#' library(supernova)
#'
#' data(DataExam3.1)
#'
#' # Pg. 28
#' fmtab3.3 <-
#'           lm(
#'               formula = ht ~ repl*seedlot
#'             , data    = DataExam3.1
#'             )
#'
#'
#' fmtab3.3ANOVA1 <-
#'   anova(fmtab3.3) %>%
#'   mutate(
#'   "F value" =
#'          c(
#'            anova(fmtab3.3)[1:2, 3]/anova(fmtab3.3)[3, 3]
#'          , anova(fmtab3.3)[3, 4]
#'          , NA
#'          )
#'           )
#'
#'  # Pg. 33 (Table 3.3)
#' fmtab3.3ANOVA1 %>%
#'   mutate(
#'   "Pr(>F)"  =
#'        c(
#'          NA
#'        , pf(
#'             q   = fmtab3.3ANOVA1[2, 4]
#'           , df1 = fmtab3.3ANOVA1[2, 1]
#'           , df2 = fmtab3.3ANOVA1[3, 1], lower.tail = FALSE
#'           )
#'        , NA
#'        , NA
#'        )
#'        )
#'
#'  # Pg. 33  (Table 3.3)
#'  emmeans(object  = fmtab3.3, specs = ~ seedlot)
#'
#'  # Pg. 34  (Figure 3.2)
#'  ggplot(
#'     mapping = aes(
#'                   x = fitted.values(fmtab3.3)
#'                 , y = residuals(fmtab3.3)
#'                 )
#'                 ) +
#'  geom_point(size = 2) +
#'  labs(
#'     x = "Fitted Values"
#'   , y = "Residual"
#'    ) +
#'  theme_classic()
#'
#'
#' # Pg. 33 (Table 3.4)
#' DataExam3.1m <- DataExam3.1
#' DataExam3.1m[c(28, 51, 76), 5] <- NA
#' DataExam3.1m[c(28, 51, 76), 6] <- NA
#'
#'
#' fmtab3.4 <-
#'           lm(
#'               formula   = ht ~ repl*seedlot
#'             , data      = DataExam3.1m
#'             )
#'
#' fmtab3.4ANOVA1 <-
#'   anova(fmtab3.4) %>%
#'   mutate(
#'       "F value" =
#'             c(
#'                anova(fmtab3.4)[1:2, 3]/anova(fmtab3.4)[3, 3]
#'              , anova(fmtab3.4)[3, 4]
#'              , NA
#'              )
#'              )
#'
#' # Pg. 33 (Table 3.4)
#' fmtab3.4ANOVA1 %>%
#'   mutate(
#'   "Pr(>F)"  =
#'        c(
#'          NA
#'        , pf(
#'             q   = fmtab3.4ANOVA1[2, 4]
#'           , df1 = fmtab3.4ANOVA1[2, 1]
#'           , df2 = fmtab3.4ANOVA1[3, 1], lower.tail = FALSE
#'           )
#'        , NA
#'        , NA
#'        )
#'        )
#'
#'  # Pg. 33  (Table 3.4)
#'  emmeans(object  = fmtab3.4, specs = ~ seedlot)
#'
NULL
