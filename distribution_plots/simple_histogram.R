# =============================================================================
# Simple Histogram Plot
# =============================================================================

library(tidyverse)
library(hrbrthemes)

# Load the datset from GitHub ---------------------------------------------

data_source <- "https://raw.githubusercontent.com/anirudhjayaraman/covid-19-india/master/downloaded_data/2020-06-07/tested_numbers_icmr_data.csv"
datset <- read.table(data_source, header = TRUE, sep = ",")

p1 <- datset %>%
  ggplot(mapping = aes(x = Tests.per.million)) + 
  theme_ipsum() + 
  geom_histogram(fill = "steelblue", bins = 50)

p1

ggsave(filename = "distribution_plots/plots/simple_histogram.png", plot = p1)
# =============================================================================