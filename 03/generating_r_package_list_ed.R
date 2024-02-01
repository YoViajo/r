library(dplyr)

my_r_dir <- '/home/yoviajo/Documentos/lab/'
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

# exportar contenido a archivo de texto
write.table(tbl_pkgs, "/home/yoviajo/Documentos/lab/datvis/61/tab_paqs.txt")
