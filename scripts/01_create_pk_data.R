library(tidyverse)

pk_data <- tibble(
  USUBJID = rep(c("SUBJ001", "SUBJ002", "SUBJ003", "SUBJ004"), each = 6),
  TRT = rep(c("Low Dose", "Low Dose", "High Dose", "High Dose"), each = 6),
  TIME = rep(c(0, 1, 2, 4, 8, 12),4),
  CONC = c(0, 15, 28, 20, 10, 4,
           0, 18, 30, 22, 12, 5,
           0, 25, 45, 38, 20, 9,
           0, 28, 50, 40, 22, 10)
)

print(pk_data)
