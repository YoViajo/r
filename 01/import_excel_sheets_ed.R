#install the packages if necessary
if(!require("tidyverse")) install.packages("tidyverse")
if(!require("fs")) install.packages("fs")
if(!require("readxl")) install.packages("readxl")


#load packages
library(tidyverse)
library(fs)
library(readxl)

#import first sheet
read_excel("/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx")

#import third sheet
read_excel("/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx", 3)

path <- "/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx"

path %>%
  excel_sheets()

path <- "/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx"

mad <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map(read_excel,
      path = path)

str(mad)

path <- "/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx"

mad <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(read_excel,
         path = path)

mad


path <- "/home/yoviajo/Documentos/lab/proy/otros/94/dat/madrid_temp.xlsx"

mad <- path %>%
  excel_sheets() %>%
  set_names() %>%
  map_df(read_excel,
         path = path,
         .id = "yr2")

str(mad)

dir_ls()

# Definir directorio de trabajo
setwd("/home/yoviajo/Documentos/lab/proy/otros/94/dat/")
#we can filter the files that we want
dir_ls(regexp = "xlsx") 

#without joining
dir_ls(regexp = "xlsx") %>%
  map(read_excel)

#joining with a new id column
dir_ls(regexp = "xlsx") %>%
  map_df(read_excel, .id = "city")

read_multiple_excel <- function(path) {
  path %>%
    excel_sheets() %>% 
    set_names() %>% 
    map_df(read_excel, path = path)
}

#separately
data <- dir_ls(regexp = "xlsx") %>% 
  map(read_multiple_excel)

str(data)

#joining all data.frames
data_df <- dir_ls(regexp = "xlsx") %>% 
  map_df(read_multiple_excel,
         .id = "city")

str(data_df)
