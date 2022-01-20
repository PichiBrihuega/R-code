

install.packages("palmerpenguins")

library(palmerpenguins)
data(package = 'palmerpenguins')
head(penguins)

library(tidyverse)

count(penguins)
penguins %>%
  count(species,sex)
  

penguins %>%
  group_by(species) %>%
  summarize(across(where(is.numeric), mean, na.rm = TRUE))
penguins %>%
  group_by(species) %>%
  summarize(across(where(is.numeric), min, na.rm = TRUE))
penguins %>%
  group_by(species) %>%
  summarize(across(where(is.numeric), max, na.rm = TRUE))
penguins %>%
  group_by(species) %>%
  summarize(across(where(is.numeric), sd, na.rm = TRUE))
  

library(ggplot2)

island_hist <- ggplot(data = penguins, aes(x = island )) +
  geom_histogram(aes(fill = species),
                 alpha = 0.5,
                 position = "identity",
                 stat = "count") +
  scale_fill_manual(values = c("darkorange","purple","cyan4")) +
  theme_minimal() +
  labs(x = "island",
       y = "Frequency",
       title = "flipper number")

island_hist


length_box <- ggplot(data = penguins, aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot(aes(color = species), width = 0.6, show.legend = TRUE) +
  geom_jitter(aes(color = species), alpha = 0.7, show.legend = FALSE, position = position_jitter(width = 0.3, seed = 0)) +
  scale_color_manual(values = c("darkorange","purple","cyan4")) +
  theme_minimal() +
  labs(x = "Sex",
       y = "Flipper length (mm)")

length_box
