library(readxl)

## Excel
memoria <- read_xls("/home/psyche/Documentos/Psicología/Tesis/Datos/EXP1.xls")


memoria


## Bajamos la EnPreCoSP

url <- "https://www.indec.gob.ar/ftp/cuadros/menusuperior/enprecosp/bases_enprecosp2011.rar"

download.file(url, "data/enprecops2011.rar")

system("7z x ./data/enprecops2011.rar -o./data/enprecops/")


## CEPRAM

cepram <- read.csv2("./data/cuestionario.csv")

cepram <- cepram[!is.na(cepram$TOMA),]

names(cepram)
cepram <- cepram[!names(cepram) == "DNI"]
cepram <- cepram[!names(cepram) == "NRO"]


cepram <- cepram[,!grepl("^CURSO", names(cepram))]
cepram <- cepram[,!grepl("^PROFE", names(cepram))]

names(cepram)[grepl("^CURSO", names(cepram))]
names(cepram)[grepl("^PROFE", names(cepram))]

write.csv2(cepram, row.names = FALSE, file = "./data/cepram.csv")


##
cepram <- read.csv2("./data/cepram.csv")
names(cepram)
