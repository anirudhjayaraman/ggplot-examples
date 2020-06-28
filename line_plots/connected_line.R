# =============================================================================
# Connected Line Chart
# =============================================================================

library(tidyverse)
library(hrbrthemes)

# Load the datset from GitHub ---------------------------------------------

data_source <- "https://raw.githubusercontent.com/anirudhjayaraman/covid-19-india/master/downloaded_data/2020-06-06/case_time_series.csv"
datset <- read.table(data_source, header = TRUE, sep = ",")

# change Date to an R Date object
datset$Date <- as.Date(datset$Date)  # critical to getting line plot to work


# Basic -------------------------------------------------------------------

p1 <- datset %>%
  tail(n = 50) %>%
  ggplot(aes(x = Date, y = Total.Confirmed)) +
  geom_point() + 
  geom_line()

plot(p1)


# With theme Ipsum --------------------------------------------------------

p2 <- datset %>%
  tail(n = 50) %>%
  ggplot(aes(x = Date, y = Total.Confirmed)) +
  geom_point() + 
  geom_line() + 
  theme_ipsum()

plot(p2)

ggsave(filename = "line_plots/plots/connected_line.png", plot = p2)

# =============================================================================