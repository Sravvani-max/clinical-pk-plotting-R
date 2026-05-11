pk_summary <- pk_data %>%
  group_by(TRT, TIME) %>%
  summarise(
    mean_conc = mean(CONC),
    sd_conc = sd(CONC),
    n = n(),
    .groups = "drop"
  ) %>%
  mutate(
    ymin = mean_conc - sd_conc,
    ymax = mean_conc +sd_conc
  )

print(pk_summary)
