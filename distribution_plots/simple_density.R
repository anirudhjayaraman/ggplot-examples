# =============================================================================
# Simple Density Plot
# =============================================================================

library(tidyverse)
library(hrbrthemes)

options(scipen = 10^7)

# Load the datset from GitHub -------------------------------------------------

data_source <- "https://raw.githubusercontent.com/anirudhjayaraman/covid-19-india/master/downloaded_data/2020-06-07/tested_numbers_icmr_data.csv"
datset <- read.table(data_source, header = TRUE, sep = ",")

# Plotting --------------------------------------------------------------------

p1 <- datset %>%
  ggplot(mapping = aes(x = Tests.per.million)) + 
  theme_ipsum() + 
  geom_density(fill = "steelblue")

p1

ggsave(filename = "distribution_plots/plots/simple_density.png", plot = p1)
# =============================================================================