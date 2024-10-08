#' @title    Example 5.2 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam5.2
#' @description Exam5.2 presents the height of 37 seedlots from 6 sites.
#'
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
#'    \code{\link{DataExam5.2}}
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
#'
#' data(DataExam5.2)
#'
#' # Pg. 75
#' fm5.7 <-
#'  lm(
#'      formula = ht ~ site*seedlot
#'    , data    = DataExam5.2
#'    )
#'
#' # Pg. 77
#' anova(fm5.7)
#'
#' fm5.9 <-
#'  lm(
#'      formula = ht ~ site*seedlot
#'    , data    = DataExam5.2
#'    )
#' # Pg. 77
#' anova(fm5.9)
#'
#' ANOVAfm5.9 <- anova(fm5.9)
#'
#' ANOVAfm5.9[4, 1:3] <- c(384, 384*964, 964)
#' ANOVAfm5.9[3, 4]   <- ANOVAfm5.9[3, 3]/ANOVAfm5.9[4, 3]
#' ANOVAfm5.9[3, 5]   <-
#'     pf(
#'         q = ANOVAfm5.9[3, 4]
#'     , df1 = ANOVAfm5.9[3, 1]
#'     , df2 = ANOVAfm5.9[4, 1]
#'     , lower.tail = FALSE
#'     )
#' # Pg. 77
#' ANOVAfm5.9
#'
#'
#' Tab5.14 <-
#'   DataExam5.2 %>%
#'   summarise(
#'        Mean = round(mean(ht, na.rm = TRUE), 0)
#'      , .by  = seedlot
#'      ) %>%
#'    left_join(
#'       DataExam5.2 %>%
#'       nest_by(seedlot) %>%
#'       mutate(fm2 = list(lm(ht ~ sitemean, data = data))) %>%
#'       summarise(Slope = round(coef(fm2)[2], 2))
#'     , by = "seedlot"
#'      ) %>%
#'   as.data.frame()
#'
#' # Pg. 81
#' Tab5.14
#'
#'
#' DevSS2 <-
#'   DataExam5.2 %>%
#'   nest_by(seedlot) %>%
#'   mutate(fm2 = list(lm(ht ~ sitemean, data = data))) %>%
#'   summarise(SSE = anova(fm2)[2, 2]) %>%
#'   ungroup() %>%
#'   summarise(Dev = sum(SSE)) %>%
#'   as.numeric()
#'
#'
#' ANOVAfm5.9.1 <-
#'   rbind(
#'      ANOVAfm5.9[1:3, ]
#'    , c(
#'         ANOVAfm5.9[2, 1]
#'       , ANOVAfm5.9[3, 2] - DevSS2
#'       , (ANOVAfm5.9[3, 2] - DevSS2)/ANOVAfm5.9[2, 1]
#'       , NA
#'       , NA
#'       )
#'    , c(
#'         ANOVAfm5.9[3, 1]-ANOVAfm5.9[2, 1]
#'       , DevSS2
#'       , DevSS2/(ANOVAfm5.9[3, 1]-ANOVAfm5.9[2, 1])
#'       , DevSS2/(ANOVAfm5.9[3, 1]-ANOVAfm5.9[2, 1])/ANOVAfm5.9[4, 3]
#'       , pf(
#'               q = DevSS2/(ANOVAfm5.9[3, 1]-ANOVAfm5.9[2, 1])/ANOVAfm5.9[4, 3]
#'           , df1 = ANOVAfm5.9[3, 1]-ANOVAfm5.9[2, 1]
#'           , df2 = ANOVAfm5.9[4, 1]
#'           , lower.tail = FALSE
#'           )
#'       )
#'    , ANOVAfm5.9[4, ]
#'   )
#' rownames(ANOVAfm5.9.1) <-
#'   c(
#'      "site"
#'    , "seedlot"
#'    , "site:seedlot"
#'    , "  regressions"
#'    , "  deviations"
#'    , "Residuals"
#'    )
#'
#' # Pg. 82
#' ANOVAfm5.9.1
#'
#' Code <-
#'  c(
#'    "a","a","a","a","b","b","b","b"
#'  , "c","d","d","d","d","e","f","g"
#'  , "h","h","i","i","j","k","l","m"
#'  ,"n","n","n","o","p","p","q","r"
#'  , "s","t","t","u","v"
#'  )
#'
#' Tab5.14$Code <- Code
#'
#' ggplot(
#'    data = Tab5.14
#'  , mapping = aes(x = Mean, y = Slope)
#'  ) +
#'  geom_point(size = 2) +
#'  geom_text(
#'     mapping = aes(label = Code)
#'   , hjust   = -0.5
#'   , vjust   = -0.5
#'  ) +
#'  theme_bw() +
#'  labs(
#'      x = "SeedLot Mean"
#'    , y = "Regression Coefficient"
#'    )
NULL

