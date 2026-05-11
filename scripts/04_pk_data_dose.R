pk_data_dose <- pk_data %>%
  mutate(
    DOSE = if_else(TRT == "Low Dose", 50, 100),
    CONC_NORM = CONC/DOSE
  )
