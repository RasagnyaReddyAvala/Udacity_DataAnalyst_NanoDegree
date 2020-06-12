data = read.csv("C:/Users/avala/Downloads/results.csv")
data1 = read.csv("C:/Users/avala/Downloads/results (1).csv")
library(ggplot2)
library(tidyverse)

final_data <- data %>%
  inner_join(data1, by=c("year" = "year"))
head(final_data)

final_data <- final_data %>%
  rename(Global_Avg=moving_avg.x, 
         Boston_Avg=moving_avg.y)
#Approcah 1
ggplot(final_data, aes(x=year)) + 
  geom_line(aes(y = Global_Avg), color = "darkred") + 
  geom_line(aes(y = Boston_Avg), color="steelblue") + 
  labs(y="Moving avg", title = "Global avg temp vs Boston avg temp") +
  theme_minimal()

final_data <- final_data %>%
  select(year, Global_Avg, Boston_Avg) %>%
  gather(key = "variable", value = "value", -year)

#With legends
ggplot(final_data, aes(x = year, y = value)) + 
  geom_line(aes(color = variable)) + 
  scale_color_manual(values = c("darkred", "steelblue")) +
  labs(y="Moving avg", title = "Global avg temp vs Boston avg temp") +
  theme_minimal()

