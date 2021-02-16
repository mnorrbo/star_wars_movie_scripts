library(tidyverse)
library(janitor)


# Reading in data and labelling -------------------------------------------

sw_4 <- read.table("raw_data/SW_EpisodeIV.txt") %>%
  as_tibble() %>% 
  mutate(episode = "4",
         line = 1:nrow(.))

sw_5 <- read.table("raw_data/SW_EpisodeV.txt") %>%
  as_tibble() %>% 
  mutate(episode = "5",
         line = 1:nrow(.))

sw_6 <- read.table("raw_data/SW_EpisodeVI.txt") %>%
  as_tibble() %>% 
  mutate(episode = "6",
         line = 1:nrow(.))


# Joining datasets and cleaning -------------------------------------------

sw_trilogy <- sw_4 %>%
  bind_rows(sw_5) %>% 
  bind_rows(sw_6) %>%
  mutate(character = str_to_title(character))


# Writing clean dataset ---------------------------------------------------

write_csv(sw_trilogy, "clean_data/original_sw_trilogy.csv")
