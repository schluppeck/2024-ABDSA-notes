# visualise a version of tidy data
#
# ds 2020-02-25

library(tidyverse)
library(janitor)

# set theme
theme_set(theme_minimal())

fname <- "diabetes_012_health_indicators_BRFSS2015.csv"

d <- read_csv(fname) |> 
  clean_names() |>
  mutate(sex = as_factor(sex))

# look at how data are organised
glimpse(d)

# BMI by gender/sex
# make a plot and store it in a variable called "myplot"
myplot <- d |> 
  ggplot(aes(x = bmi)) +
  geom_histogram() 

# show it
myplot

# show and and change the display rule... to break up by gender/sex
myplot + 
  facet_wrap(~sex) +
  labs(title="Distribution of BMI", caption="data: https://www.kaggle.com/")
  
# can we do better? having two plots is not so good...
# try labelling gender by color


d |> 
  ggplot(aes(x = bmi, fill=sex)) +
  geom_histogram() +
  scale_fill_brewer(palette = "Set2") +
  labs(title="Distribution of BMI", caption="data: https://www.kaggle.com/")
  


