# Load relevant libraries =====================================================
require(tidyverse)

# Create the dataset ==========================================================
data_to_plot <- data.frame(id = seq(1,40), 
                           person = paste0( "P", seq(1,40)), 
                           type = sample(x = c("Indian","European","American"), 
                                         size = 40, 
                                         replace = TRUE),
                           age = sample(seq(10, 90), 40, replace = TRUE))

num_bars <- nrow(data_to_plot)  # Number of bars to plot

# Assign angle for each 'id' in the dataset just created
# where text will appear. Should be above the bars and centered
angle <-  90 - (360 / num_bars) * (data_to_plot$id - 0.5)     

# Alignment of labels - angles less than 90 degrees correspond to left plot
data_to_plot$hjust <- ifelse(angle < -90, 1, 0)

# Flip labels on the left part of the plot by 180 degrees
data_to_plot$angle <- ifelse(angle < -90, angle + 180, angle)


p1 <- data_to_plot %>% 
  ggplot(mapping = aes(x = factor(id), y = age, fill = type)) +
  
  # Note that id is a factor. 
  # If x is numeric, there is some space between the first bar
  
  geom_bar(stat = "identity") +
  
  # Limits of the plot.
  # The negative value controls the size of the inner circle 
  # The positive one is useful to add size over each bar
  
  ylim(-120,120) +
  
  # Custom the theme: no axis title and no cartesian grid
  
  theme_minimal() +
  
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    
    # Adjust the margin to make in sort labels are not truncated!
    plot.margin = unit(rep(-1,4), "cm")
    
  ) +
  
  # This makes the coordinate polar instead of cartesian.
  coord_polar(start = 0) +
  
  # Add the labels, using the data_to_plot dataframe
  geom_text(data = data_to_plot, 
            aes(x = id, y = age + 20, 
                label = person, 
                hjust = hjust), 
            color = "black", 
            fontface = "bold",
            alpha = 0.6, 
            size = 2.5, 
            angle = data_to_plot$angle, 
            inherit.aes = FALSE)

ggsave(filename = "bar_plots/plots/circular_bar.png", plot = p1)

# =============================================================================