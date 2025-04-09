# R
data <- read.csv("data/NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv")
small_data <- data[1:10000, ]  # or adjust as needed
write.csv(small_data, "data/NWSS_subset.csv", row.names = FALSE)
