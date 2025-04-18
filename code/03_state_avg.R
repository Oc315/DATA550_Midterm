library(dplyr)
library(readr)
library(ggplot2)
library(here)

data <- read_csv(here("data/NWSS_subset.csv"))

state_avg <- data %>%
  filter(!is.na(ptc_15d), !is.na(reporting_jurisdiction)) %>%
  group_by(reporting_jurisdiction) %>%
  summarise(avg_viral_load = mean(ptc_15d, na.rm = TRUE)) %>%
  arrange(desc(avg_viral_load))

saveRDS(state_avg, here("output/state_avg.rds"))
