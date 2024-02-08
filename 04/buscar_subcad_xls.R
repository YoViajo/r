library(readxl)
library(dplyr)
library(purrr)
library(fs)

buscar_subcadena <- function(path_carpeta, subcadena) {
  # Ajuste para buscar archivos .xls
  archivos <- fs::dir_ls(path = path_carpeta, glob = "*.xls")
  
  resultados <- archivos %>% map_df(~buscar_en_archivo(.x, subcadena), .id = "Archivo")
  
  if (nrow(resultados) == 0) {
    cat("Subcadena no encontrada en ningún archivo.")
  } else {
    print(resultados)
  }
}

buscar_en_archivo <- function(archivo, subcadena) {
  hojas <- excel_sheets(archivo)
  resultados_hoja <- map_df(hojas, ~buscar_en_hoja(archivo, .x, subcadena), .id = "Hoja")
  return(resultados_hoja)
}

buscar_en_hoja <- function(archivo, hoja, subcadena) {
  datos <- read_excel(archivo, sheet = hoja)
  contiene_subcadena <- datos %>% map_lgl(~any(grepl(subcadena, ., fixed = TRUE)))
  if (any(contiene_subcadena)) {
    return(data.frame(Archivo = basename(archivo), Hoja = hoja, stringsAsFactors = FALSE))
  } else {
    return(data.frame(Archivo = character(0), Hoja = character(0), stringsAsFactors = FALSE))
  }
}

# Ejemplo de uso:
# Reemplaza 'tu_subcadena' con la subcadena que quieres buscar.
buscar_subcadena("D:/Users/earmijo/Downloads/a/tmp/", "PARDO")
