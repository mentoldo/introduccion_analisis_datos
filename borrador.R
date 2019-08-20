library(readxl)

## Excel
memoria <- read_xls("/home/psyche/Documentos/Psicología/Tesis/Datos/EXP1.xls")


memoria


## Bajamos la EnPreCoSP

url <- "https://www.indec.gob.ar/ftp/cuadros/menusuperior/enprecosp/bases_enprecosp2011.rar"

download.file(url, "data/enprecops2011.rar")

system("7z x ./data/enprecops2011.rar -o./data/enprecops/")
