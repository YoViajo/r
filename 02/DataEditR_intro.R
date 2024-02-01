# LIBRERÍAS ----
library(DataEditR)
library(tidyverse)
library(tidyquant)

# DATOS ----
mpg

# 1.0 EDICIÓN DE DATOS ----

# 1.1. data_edit() ----

mpg_subset <- data_edit(
    x = mpg
)

