# Georgette Joseph
# Assignment 4.2
# 12/19/2024
# DSC520-T301

# Load necessary libraries
library(ggplot2)

# Load the dataset
scores_data <- read.csv("C:\\Users\\gjose\\OneDrive\\Documents\\DSC520-T301 (2253-1)\\scores.csv")




# 1. What are the observational units in this study?
# The observational units are the students who took the course.

# 2. Identify the variables and determine which are categorical and quantitative?
# Variables:
# - Count: Quantitative (Number of students achieving a score)
# - Score: Quantitative (Total points earned in the course)
# - Section: Categorical (Type of section: Sports or Regular)

# 3. Create one variable to hold a subset for the two sections
regular_section <- subset(scores_data, Section == "Regular")
sports_section <- subset(scores_data, Section == "Sports")

# 4. Plot scores and number of students for each section
# Sports Section plot
plot(
  sports_section$Score,
  sports_section$Count,
  type = "b",
  col = "blue",
  xlab = "Score",
  ylab = "Number of Students",
  main = "Sports Section: Score Distribution",
  pch = 19
)

# Regular Section plot
plot(
  regular_section$Score,
  regular_section$Count,
  type = "b",
  col = "red",
  xlab = "Score",
  ylab = "Number of Students",
  main = "Regular Section: Score Distribution",
  pch = 19
)


# 4a. Comparing and contrasting distributions
# Can you say one section tended to score more points than the other? 
# The Regular Section tended to score more points overall due to the narrower
# range of higher scores compared to the Sports Section.


# 4b. Did every student in one section score more points than in the other? 
# No, not every student in one section scored more than every student in the
# other. The Sports Section scores range from 200 to 400 and the Regular 
# Section scores range from 280 to 380. Some students in the Sports Section 
# outperformed those in the Regular Section,but many scored lower.


# 4c. What could be one additional variable that was not mentioned that could be 
# influencing the point distributions between the two sections?
# The students' GPA could influence the point distributions.
# Students with better GPA's may perform very well regardless of the section,
# which could lead to higher scores.