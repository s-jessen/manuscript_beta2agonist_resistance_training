#' lmm
#'
#' @param df_long a long format dataframe with the following columns:
#' protein, abundance, time, intervention
#'
#' @return A single data frame containing all comparisons containing:
#' - main effects of time and intervention
#' - within-group changes in resistance and terbutaline groups
#' - interaction effect (time*intervention)
#'
#' @export
#'
#' @examples
#'
lmm <- function(df_long) {

  #Empty vectpr for collecting results
  results_list <- vector("list", length = length(unique(df_long$protein)))

  #Iteration counter
  iteration = 0

  #Proteins to iterate over
  genes <- unique(df_long$protein)

  for (gene in genes) {

    #subset df
    subset_df <- df_long %>%
      dplyr::filter(protein == gene)

    #Fit linear mixed model
    lm <- lmer(abundance ~ time*intervention + (1|id), data = subset_df, REML=FALSE)

    #Anova
    anova <- anova(lm)

    #Retrieve interaction and main effects
    interaction <- emmeans::emmeans(lm, pairwise ~ time|intervention, adjust="none", pbkrtest.limit = 5000, lmerTest.limit = 5000) %>%
      summary(infer=TRUE)

    main_intervention <- emmeans(lm, specs = pairwise ~ intervention, adjust="none", pbkrtest.limit = 5000, lmerTest.limit = 5000) %>%
      summary(infer=TRUE)

    main_time <- emmeans(lm, specs = pairwise ~ time, adjust="none", pbkrtest.limit = 5000, lmerTest.limit = 5000) %>%
      summary(infer=TRUE)

    # Extract estimates and p-values into temporary tibble
    tmp <- tibble(
      protein = gene,
      contrast = c("interaction",
                   "main_intervention",
                   "main_time",
                   "resistance",
                   "terbutaline"),
      effect_size = c(
        interaction$contrasts$estimate[1] - interaction$contrasts$estimate[2],
        main_intervention$contrasts$estimate,
        main_time$contrasts$estimate,
        interaction$contrasts$estimate[1],
        interaction$contrasts$estimate[2]
      ),
      p = c(
        anova["time:intervention", "Pr(>F)"],
        main_intervention$contrasts$p.value,
        main_time$contrasts$p.value,
        interaction$contrasts$p.value[1],
        interaction$contrasts$p.value[2]
      )
    )

    #Append results to results list
    results_list[[gene]] <- tmp

    #Print progress
    cat(round(iteration/length(genes)*100, 2), "%\n")

    iteration = iteration + 1
  }

  #Combine all results
  results <- dplyr::bind_rows(results_list)

  results_final <- results %>%
    dplyr::group_by(contrast) %>%
    dplyr::mutate(
      q = qvalue(p)$qvalues,
      regulated = case_when(q < 0.05 ~ "+")) %>%
    dplyr::arrange(desc(effect_size))

  return(results_final)

}
