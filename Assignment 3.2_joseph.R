# Georgette Joseph
# Assignment 3.2 
# 12/09/2024
# DSC520-T301


# Load the data
data <- read.csv("acs-14-1yr-s0201.csv")

# Inspect column names and data types
str(data)
# Number of rows
nrow(data)

# Number of columns
ncol(data)

# Structure of the dataset
str(data)
install.packages("ggplot2")
library(ggplot2)

# Create the histogram
ggplot(data, aes(x = HSDegree)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Distribution of High School Degrees",
       x = "High School Degree (%)",
       y = "Frequency") +
  theme_minimal()
# Try smaller or larger bin sizes
ggplot(data, aes(x = HSDegree)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +  # Smaller bins
  labs(title = "Distribution of High School Degrees",
       x = "High School Degree (%)",
       y = "Frequency") +
  theme_minimal()

# Create the probability plot
qqnorm(data$HSDegree, main = "Probability Plot of HSDegree")
qqline(data$HSDegree, col = "red")


# Install and load pastecs package
install.packages("pastecs")
library(pastecs)

# Quantify normality
results <- stat.desc(data$HSDegree, basic = FALSE, norm = TRUE)

# Print results
print(results)
