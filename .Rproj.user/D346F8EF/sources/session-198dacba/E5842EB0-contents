library(here)
library(dplyr)

library(here)

source(here("source","simulate_logistic.R"))

dat <- simulate_logistic_data(
  n = 200,
  beta0 = 1,
  beta1 = 0.3,
  seed = 123
)

saveRDS(
  dat,
  here("data","logistic_sim_data.rds")
)