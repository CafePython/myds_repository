# Packages installed for running
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")

library("here")
library("skimr")
library("janitor")
library("dplyr")

# Isolate one column
penguins %>%
  select(species)

# Or show column except the one mentioned
penguins %>%
  select(-species)

# Renaming options
penguins %>%
  rename(island_new=island)

# Renaming upper or lower letter
rename_with(penguins, toupper)
rename_with(penguins, tolower)

# Cleaning names
clean_names(penguins)

# sorting by bill_length_mm
penguins %>%
  arrange(bill_length_mm)

# reverse sorting by bill_length_mm
penguins %>%
  arrange(-bill_length_mm)

# save sorting into a new dataframe
penguins2 <- penguins %>% arrange(-bill_length_mm)
View(penguins2)

# groupby by one column and then get summarize about it. (mean)
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))

# groupby by one column and then get summarize about it. (max)
penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm))

# groupby by several columns and then get summarize about it. (max, mean)
penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# in case we want data only "Adelie" penguins
penguins %>%
  filter(species == "Adelie")

## Transforming data
id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
employee <- data.frame(id, name, job_title)
print(employee)

# séparation of first & last name into 2 distinct columns
new_employee <- separate(employee, name, into=c('first_name', 'last_name'), sep=' ')

# the opposite function of separate is unite
unite(new_employee, 'name', first_name, last_name, sep=' ')

# create new variable with mutate
View(penguins)

penguins %>%
  mutate(body_mass_kg=body_mass_g/1000)
