pk_data_blq <- pk_data %>%
  mutate(
    BLQFL = if_else(CONC < 5 & TIME > 0, "Y", "N"),
    LLOQ = 5
  )
