# Georgette Joseph
# Assignment 5.2
# 01/07/2025
# DSC520-T301


# Load required libraries
library(dplyr)
library(purrr)

# Load the dataset
file_path <- "C:\\Users\\gjose\\OneDrive\\Documents\\DSC520-T301 (2253-1)\\week-6-housing.xlsx"
housing_data <- readxl::read_excel(file_path, sheet = "Sheet2")

# Using dplyr

# GroupBy: Group data by 'ctyname' and summarize the average 'Sale Price'
grouped_data <- housing_data %>%
  group_by(ctyname) %>%
  summarize(avg_sale_price = mean(`Sale Price`, na.rm = TRUE))
print("Grouped Data:")
print(grouped_data)

# Summarize: Get summary statistics for 'Sale Price'
summary_stats <- housing_data %>%
  summarize(
    min_price = min(`Sale Price`, na.rm = TRUE),
    max_price = max(`Sale Price`, na.rm = TRUE),
    mean_price = mean(`Sale Price`, na.rm = TRUE),
    median_price = median(`Sale Price`, na.rm = TRUE),
    sd_price = sd(`Sale Price`, na.rm = TRUE)
  )
print("Summary Statistics:")
print(summary_stats)

# Mutate: Create a new column 'Price_per_sqft'
housing_data <- housing_data %>%
  mutate(Price_per_sqft = `Sale Price` / sq_ft_lot)
print("Data with Price_per_sqft:")
head(housing_data) %>% print()

# Filter: Filter properties sold for over $500,000 and built after 2000
filtered_data <- housing_data %>%
  filter(`Sale Price` > 500000, year_built > 2000)
print("Filtered Data:")
print(filtered_data)

# Select: Select relevant columns
selected_columns <- housing_data %>%
  select(`Sale Date`, `Sale Price`, ctyname, year_built, Price_per_sqft)
print("Selected Columns:")
print(selected_columns)

# Arrange: Sort data by 'Sale Price' in descending order
sorted_data <- housing_data %>%
  arrange(desc(`Sale Price`))
print("Sorted Data:")
head(sorted_data) %>% print()

# Using purrr

# Keep: Keep only numeric columns
numeric_columns <- housing_data %>%
  keep(is.numeric)
print("Numeric Columns:")
print(numeric_columns)

# Discard: Discard columns with any missing values
non_missing_columns <- housing_data %>%
  discard(~ any(is.na(.)))
print("Non-missing Columns:")
print(non_missing_columns)

# Using cbind and rbind 

# cbind: Add a new column 'Price Category'
housing_data <- housing_data %>%
  mutate(Price_Category = ifelse(`Sale Price` > 500000, "High", "Low"))
print("Data with Price_Category:")
head(housing_data) %>% print()

# rbind: Append a copy of the first 5 rows to the dataset
rbind_data <- bind_rows(housing_data, housing_data[1:5, ])
print("Data after rbind:")
head(rbind_data) %>% print()

# Split a string, then concatenate

# Split the 'addr_full' column into parts and concatenate back together
housing_data <- housing_data %>%
  mutate(
    addr_parts = strsplit(as.character(addr_full), " "), # Split strings into parts
    addr_concat = sapply(addr_parts, paste, collapse = " ") # Concatenate back together
  )
print("Data with addr_parts and addr_concat:")
head(housing_data) %>% print()

# Convert the 'addr_parts' column to a character representation for saving
housing_data <- housing_data %>%
  mutate(addr_parts = sapply(addr_parts, paste, collapse = " "))

# Save results 
write.csv(housing_data, "housing_data_transformed.csv", row.names = FALSE)
print("Transformed data saved as housing_data_transformed.csv")
