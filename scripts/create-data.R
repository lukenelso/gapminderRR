# Clear R
rm(list=ls())

install.packages("gapminder")
gapminder::gapminder

install.packages("here")
install.packages("tidyverse")
readr::write_csv(gapminder::gapminder, path = here::here("data/raw/gapminder.csv"))
#use path = here::here sets path and means when you move project folder connections kept together

gapminder_df <- readr::read_csv(here::here("data/raw/gapminder.csv"))

gapminder_meta_shell <- metadatar::create_meta_shell(gapminder_df, 
                                                     factor_cols = c("country", "continent"))
write.csv(gapminder_meta_shell, file = here::here("data/metadata/gapminder_meta_shell.csv"), 
          row.names = F)
