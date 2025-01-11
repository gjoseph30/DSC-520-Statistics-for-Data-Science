# Author: Georgette Joseph
# Assignment 1.2 Task 5
# 11/29/2024
# DSC520-T301


# Load required libraries
library(ggplot2)
library(sn)  # For skew-normal distributions

# Generate values for the x-axis
x <- seq(-4, 4, length.out = 1000)

# Normal distribution
normal <- dnorm(x, mean = 0, sd = 1)

# Positively skewed distribution
pos_skew <- dsn(x, xi = 0, omega = 1, alpha = 5)

# Negatively skewed distribution
neg_skew <- dsn(x, xi = 0, omega = 1, alpha = -5)

# Combine data into a data frame
df <- data.frame(
  x = rep(x, 3),
  density = c(normal, pos_skew, neg_skew),
  distribution = factor(rep(c("Normal", "Positively Skewed", "Negatively Skewed"), each = length(x)))
)

# Plot the distributions
ggplot(data = df, aes(x = x, y = density, color = distribution)) +
  geom_line(linewidth = 1) +  # Updated to 'linewidth'
  facet_wrap(~ distribution) +
  labs(title = "Normal, Positively Skewed, and Negatively Skewed Distributions",
       x = "X", y = "Density") +
  theme_minimal() +
  scale_color_manual(values = c("blue", "green", "red")) +
  theme(legend.position = "none")  # Removes the legend

