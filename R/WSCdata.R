#' A new four-arm within-study comparison data on math and vocabulary training
#'
#'
#' This dataset was collected using a new four-arm within-study comparison design.
#' The study aimed to examine the impact of a mathematics training intervention and
#' a vocabulary study session on posttest scores in mathematics and vocabulary, respectively.
#' The innovative four-arm within-study comparison design facilitates both experimental
#' and quasi-experimental identification of average causal effects.
#'
#'
#' @name WSCdata
#' @docType data
#' @format A data frame with 2200 observations.
#' There are 33 variables recorded for each individual.
#' \itemize{
#' \item "female"
#' is the indicator variable for female (0 = Non-female, 1 = Female).
#' \item "white" is the indicator variable for White ethnicity (0 = No, 1 = Yes).
#' \item "black" is the indicator variable for Black ethnicity (0 = No, 1 = Yes).
#' \item "hisp" is the indicator variable for Hispanic ethnicity (0 = No, 1 = Yes).
#' \item "asian" is the indicator variable for Asian ethnicity (0 = No, 1 = Yes).
#' \item "married" is the indicator variable for marital status (0 = Not Married, 1 = Married).
#' \item "age" is age in years of the individual.
#' \item "income" is the indicator variable for household income equal to or greater than $40k (0 = Less than $40k, 1 = Equal to or greater than $40k).
#' \item "collegeS" is the indicator variable for college education for self (0 = No, 1 = Yes).
#' \item "collegeM" is the indicator variable for college education for mother (0 = No, 1 = Yes).
#' \item "collegeD" is the indicator variable for college education for father (0 = No, 1 = Yes).
#' \item "calc" is the indicator variable for having taken a calculus course (0 = No, 1 = Yes).
#' \item "books" is the number of books read in past year (ranging from 0 to 60).
#' \item "mathLike" is the indicator variable for  (0 = No, 1 = Yes).
#' \item "Big5O" is Big Five Personality Inventory Openness Subscale score.
#' \item "Big5C" is Big Five Personality Inventory Conscientiousness Subscale score.
#' \item "Big5E" is Big Five Personality Inventory Extraversion Subscale score.
#' \item "Big5A" is Big Five Personality Inventory Agreeableness Subscale score.
#' \item "Big5N" is Big Five Personality Inventory Neuroticism Subscale score.
#' \item "AMAS" is Abbreviated Math Anxiety Scale (AMAS) score.
#' \item "BDI" is Beck Depression Inventory (BDI) score.
#' \item "MCS" is Math Confidence Scale (MCS) score.
#' \item "GSES" is General Self-Efficacy Scale (GSES) score.
#' \item "vocabPre" is pre-test vocabulary score.
#' \item "mathPre" is pre-test math score.
#' \item "vocabPost" is post-test vocabulary score.
#' \item "mathPost" is post-test math score.
#' \item "MCSpost" is post-test MCS score.
#' \item "mathGrp" is the indicator variable for group where participants were
#' randomly assigned to math training (0 = No, 1 = Yes).
#' \item "mathSel" is the indicator variable for group where participants
#' selected math training (0 = No, 1 = Yes).
#' \item "logAge" is log-transformed age.
#' \item "logBooks" is log-transformed number of books.
#' \item "logBDI" is log-transformed BDI (Beck Depression Inventory) score.
#' }
#'
#' "mathGrp" and "mathSel" can derive different treatment and selection indicators for either
#' math training or vocabulary training. The four arms in the new WSC design can be represented
#' by these two variables. See paper for more details.
#'
#' @usage data(WSCdata)
#'
#' @source Keller et al., ....
#'
#' @references Keller et al., ....
#'
#' @keywords datasets
#'
#' @examples
#' if (requireNamespace("tidyverse", quietly = TRUE)) {
#' # Load functions ----------------------------------------------------------
#' library(tidyverse)
#'
#' # Load data ---------------------------------------------------------------
#' head(WSCdata)
#'
#' # Indicators for group comparisons (math and vocabulary)  -----------------------
#' # Group indicators for ATE, ATT, and ATU are generated from random assignment and
#' # self-selection group indicators. For example, the math training group indicator
#' # among the treated (used to estimate the average treatment effect among the treated)
#' # is determined based on whether participants were randomized and self-selected for
#' # training. Specifically, the treatment group includes participants who were both
#' # randomized and self-selected for training. The control group includes participants
#' # who were self-selected to be trained in math but was not randomized to be.
#'
#' # RCT math
#' WSCdata <- WSCdata %>%
#'  mutate(ind_rct_math = mathGrp)
#'
#' # ATT math
#' WSCdata <- WSCdata %>%
#'  mutate(ind_att_math = case_when(mathGrp == 1 & mathSel == 1 ~ 1,
#'                                 mathGrp == 0 & mathSel == 1 ~ 0))
#' table(WSCdata$ind_att_math, useNA = "always")
#'
#' # ATU math
#' WSCdata <- WSCdata %>%
#' mutate(ind_atu_math = case_when(mathGrp == 1 & mathSel == 0 ~ 1,
#'                                 mathGrp == 0 & mathSel == 0 ~ 0))
#' table(WSCdata$ind_atu_math, useNA = "always")
#'
#' # QED math
#' WSCdata <- WSCdata %>%
#' mutate(ind_QED_math = case_when(mathGrp == 1 & mathSel == 1 ~ 1,
#'                                  mathGrp == 0 & mathSel == 0 ~ 0))
#' table(WSCdata$ind_QED_math, useNA = "always")
#'
#' # RCT vocab
#' WSCdata <- WSCdata %>%
#'  mutate(ind_rct_vocab = 1-ind_rct_math)
#'
#' # ATT vocab
#' WSCdata <- WSCdata %>%
#'  mutate(ind_att_vocab = case_when(mathGrp == 0 & mathSel == 0 ~ 1,
#'                                   mathGrp == 1 & mathSel == 0 ~ 0))
#' table(WSCdata$ind_att_vocab, useNA = "always")
#'
#' # ATU vocab
#' WSCdata <- WSCdata %>%
#'  mutate(ind_atu_vocab = case_when(mathGrp == 0 & mathSel == 1 ~ 1,
#'                                   mathGrp == 1 & mathSel == 1 ~ 0))
#' table(WSCdata$ind_atu_vocab, useNA = "always")
#'
#' # QED vocab
#' WSCdata <- WSCdata %>%
#'  mutate(ind_QED_vocab = case_when(mathGrp == 0 & mathSel == 0 ~ 1,
#'                                   mathGrp == 1 & mathSel == 1 ~ 0))
#' table(WSCdata$ind_QED_vocab, useNA = "always")
#'
#' # Baseline covariates list ---------------------------------------------------------------
#' # A list of covariates that will be used for further adjustment
#' cov_nms <- c(
#' "female",
#' "white",
#' "black",
#' "asian",
#' "hisp",
#' "married",
#' "logAge",
#' "income",
#' "collegeS",
#' "collegeM",
#' "collegeD",
#' "calc",
#' "logBooks",
#' "mathLike",
#' "big5O",
#' "big5C",
#' "big5E",
#' "big5A",
#' "big5N",
#' "AMAS",
#' "logBDI",
#' "MCS",
#' "GSES",
#' "vocabPre",
#' "mathPre"
#' )
#'
#' # Differences in means -----------------------------------------------------
#' # Experimentally identified estimates for ATE for math
#' fmla_unadj_ate_math <- as.formula(paste("mathPost ~ ind_rct_math"))
#' summary(lm(fmla_unadj_ate_math, data = WSCdata))
#'
#' # Experimentally identified estimates for ATT for math
#' fmla_unadj_att_math <- as.formula(paste("mathPost ~ ind_att_math"))
#' summary(lm(fmla_unadj_att_math, data = WSCdata))
#'
#' # Experimentally identified estimates for ATU for math
#' fmla_unadj_atu_math <- as.formula(paste("mathPost ~ ind_atu_math"))
#' summary(lm(fmla_unadj_atu_math, data = WSCdata))
#'
#' # Experimentally identified estimates for ATE for vocabulary
#' fmla_unadj_ate_vocab <- as.formula(paste("vocabPost ~ ind_rct_vocab"))
#' summary(lm(fmla_unadj_ate_vocab, data = WSCdata))
#'
#' # Experimentally identified estimates for ATT for vocabulary
#' fmla_unadj_att_vocab <- as.formula(paste("vocabPost ~ ind_att_vocab"))
#' summary(lm(fmla_unadj_att_vocab, data = WSCdata))
#'
#' # Experimentally identified estimates for ATU for vocabulary
#' fmla_unadj_atu_vocab <- as.formula(paste("vocabPost ~ ind_atu_vocab"))
#' summary(lm(fmla_unadj_atu_vocab, data = WSCdata))
#'
#' # ANCOVA ------------------------------------------------------------------
#' # Covariates adjusted estimates for ATE for math
#' fmla_ancova_ate_math <-
#'  as.formula(paste("mathPost ~ ind_rct_math + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_ate_math, data = WSCdata))
#'
#' # Covariates adjusted estimates for ATT for math
#' fmla_ancova_att_math <-
#'  as.formula(paste("mathPost ~ ind_att_math + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_att_math, data = WSCdata))
#'
#' # Covariates adjusted estimates for ATU for math
#' fmla_ancova_atu_math <-
#'  as.formula(paste("mathPost ~ ind_atu_math + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_atu_math, data = WSCdata))
#'
#' # Covariates adjusted estimates for ATE for vocabulary
#' fmla_ancova_ate_vocab <-
#'  as.formula(paste("vocabPost ~ ind_rct_vocab + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_ate_vocab, data = WSCdata))
#'
#' # Covariates adjusted estimates for ATT for math
#' fmla_ancova_att_vocab <-
#'  as.formula(paste("mathPost ~ ind_att_vocab + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_att_vocab, data = WSCdata))
#'
#' # Covariates adjusted estimates for ATU for math
#' fmla_ancova_atu_vocab <-
#'  as.formula(paste("mathPost ~ ind_atu_vocab + ", paste(cov_nms, collapse = " + ")))
#' summary(lm(fmla_ancova_atu_vocab, data = WSCdata))
#'
#' # Propensity Score Overlaps ------------------------------------------------------------
#' # Propensity Score overlap plot for RCT math training propensity
#' ## Define the formula for the propensity score model for math training propensity
#' fmla_ps_rct_math <-
#'   as.formula(paste("ind_rct_math ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_rct_math <- predict(glm(
#'   formula = fmla_ps_rct_math,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_rct_math <- data.frame(cbind(lps = log(ps_rct_math), ind_rct_math = WSCdata$ind_rct_math))
#'
#' ## Create an overlap density plot based on log transformed propensity scores for
#' ## treatment and control group
#' lps_rct_math |>
#'   mutate(ind_rct_math_fct = case_when(ind_rct_math == 1 ~ "treatment",
#'                                  ind_rct_math == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_rct_math_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for math training in RCT groups") +
#'   guides(fill=guide_legend(title="RCT group"))
#'
#' # Propensity Score overlap plot for math training propensity among the treated group
#' ## Define the formula for the propensity score model for math training propensity
#' ## among the treated group
#' fmla_ps_att_math <-
#'   as.formula(paste("ind_att_math ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_att_math <- predict(glm(
#'   formula = fmla_ps_att_math,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_att_math <- data.frame(cbind(lps = log(ps_att_math), ind_att_math = WSCdata$ind_att_math))
#'
#' ## Create an overlap density plot based on log transformed propensity scores for
#' ## treatment and control group
#' lps_att_math |>
#'   filter(!is.na(ind_att_math)) |>
#'   mutate(ind_att_math_fct = case_when(ind_att_math == 1 ~ "treatment",
#'                                  ind_att_math == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_att_math_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for math training in treatment groups among the treated") +
#'   guides(fill=guide_legend(title="Att group"))
#'
#' # Propensity Score overlap plot for math training propensity among the control group
#' ## Define the formula for the propensity score model for math training
#' ## propensity among the control group
#' fmla_ps_atu_math <-
#'   as.formula(paste("ind_atu_math ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_atu_math <- predict(glm(
#'   formula = fmla_ps_atu_math,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_atu_math <- data.frame(cbind(lps = log(ps_atu_math), ind_atu_math = WSCdata$ind_atu_math))
#'
#' ## Create an overlap density plot based on log transformed propensity scores for
#' ## treatment and control group
#' lps_atu_math |>
#'   filter(!is.na(ind_atu_math)) |>
#'   mutate(ind_atu_math_fct = case_when(ind_atu_math == 1 ~ "treatment",
#'                                  ind_atu_math == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_atu_math_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for math training in treatment groups among the control") +
#'   guides(fill=guide_legend(title="ATU group"))
#'
#' # Propensity Score overlap plot for RCT vocabulary training propensity
#' ## Define the formula for the propensity score model for vocabulary training propensity
#' fmla_ps_rct_vocab <-
#'   as.formula(paste("ind_rct_vocab ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_rct_vocab <- predict(glm(
#'   formula = fmla_ps_rct_vocab,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_rct_vocab <- data.frame(cbind(lps = log(ps_rct_vocab),
#' ind_rct_vocab = WSCdata$ind_rct_vocab))
#'
#' ## Create an overlap density plot based on log transformed propensity scores for
#' ## treatment and control group
#' lps_rct_vocab |>
#'   mutate(ind_rct_vocab_fct = case_when(ind_rct_vocab == 1 ~ "treatment",
#'                                   ind_rct_vocab == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_rct_vocab_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for vocabulary training in RCT groups") +
#'   guides(fill=guide_legend(title="RCT group"))
#'
#' # Propensity Score overlap plot for vocabulary training propensity among the treated group
#' ## Define the formula for the propensity score model for vocabulary training
#' ## propensity among the treated group
#' fmla_ps_att_vocab <-
#'   as.formula(paste("ind_att_vocab ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_att_vocab <- predict(glm(
#'   formula = fmla_ps_att_vocab,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_att_vocab <- data.frame(cbind(lps = log(ps_att_vocab),
#' ind_att_vocab = WSCdata$ind_att_vocab))
#'
#' ## Create an overlap density plot based on log transformed propensity scores for
#' ## treatment and control group
#' lps_att_vocab |>
#'   filter(!is.na(ind_att_vocab)) |>
#'   mutate(ind_att_vocab_fct = case_when(ind_att_vocab == 1 ~ "treatment",
#'                                   ind_att_vocab == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_att_vocab_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for vocabulary training in
#'   treatment groups among the treated") +
#'   guides(fill=guide_legend(title="ATT group"))
#'
#' # Propensity Score overlap plot for vocabulary training propensity among the control group
#' ## Define the formula for the propensity score model for vocabulary training
#' ## propensity among the control group
#' fmla_ps_atu_vocab <-
#'   as.formula(paste("ind_atu_vocab ~ ", paste(cov_nms, collapse = " + ")))
#'
#' ## Fit a logistic regression model to predict propensity scores
#' ps_atu_vocab <- predict(glm(
#'   formula = fmla_ps_atu_vocab,
#'   family = "binomial",
#'   data = WSCdata
#' ), type = "response")
#'
#' ## Merge propensity scores to the original dataset
#' lps_atu_vocab <- data.frame(cbind(lps = log(ps_atu_vocab), ind_atu_vocab = WSCdata$ind_atu_vocab))
#'
#' ## Create an overlap density plot based on log transformed propensity scores
#' ## for treatment and control group
#' lps_atu_vocab |>
#'   filter(!is.na(ind_atu_vocab)) |>
#'   mutate(ind_atu_vocab_fct = case_when(ind_atu_vocab == 1 ~ "treatment",
#'                                   ind_atu_vocab == 0 ~ "control")) |>
#'   ggplot(aes(x = lps, fill = ind_atu_vocab_fct)) + geom_density(alpha = 0.25) +
#'   xlab("Log Propensity Score") +
#'   ylab("Density") +
#'   ggtitle("Propensity score overlap for vocabulary training in treatment groups among the contol") +
#'   guides(fill=guide_legend(title="ATU group"))
#' }

NULL
