library(dplyr)

my_r_dir <- 'YOUR-FOLDER-HERE'
df <- renv::dependencies(my_r_dir)

n_to_colect <- 50 # number of pkgs to collect (most to least frequent)

tbl_pkgs <- df %>%
  group_by(Package) %>%
  count() %>%
  arrange(-n) %>%
  #view() %>%
  ungroup() %>%
  slice(1:n_to_colect)

tbl_pkgs
