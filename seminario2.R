letras<-letters[1:5]
letras
letras[3]
  letras[c(2,5)]
i<-c(2,5)
letras[i]
m<-matrix(1:9,nrow=3)
m
m[1:2,]
lista<-list(nombre=c("Pedro","Juan","Ramona"),
            sexo=c("Masculino","Masculino","Femenino"),
            edad=c("25","18","23"))
lista
str(lista)
lista$nombre
lista1<-lista[1]
lista2<-lista[[1]]
class(lista1)
class(lista2)
lista3<-lista[[3]]


## BISG04. Durante los últimos 12 meses, a visitado a algún
## profesional de la salud mental por problemas de angustia,
## relaciones personales, depresión u otros?
at_prof <- factor(enprecosp$BISG04,
                  labels = c("Sí", "No", "Ns/Nc")
)

consumo <- factor(enprecosp$P1A_TA,
                  labels = c("Sí", "No")
)

tabla <- table(at_prof, consumo)

format(prop.table(tabla), digits = 1, scientific = FALSE)
format(prop.table(tabla, 2), digits = 2, scientific = FALSE)
format(prop.table(tabla, 1), digits = 3, scientific = FALSE)

library(questionr)

tabla <- wtd.table(at_prof, consumo, enprecosp$W_PERS)


library(questionr)

tc <- wtd.table(riesgo_perc, abuso, enprecosp$W_PERS)

enprecosp <- read.table("data/enprecosp_2011.txt", header = TRUE, sep = "|")



## Seleccionamos la nueva variable y la guardamos en una nueva variable
saludsub <- enprecosp$BISG01

## Vemos cuantos casos tenemos en total
length(saludsub)

## Convertimos a factor y etiquetamos los códigos de valores
saludsub <- factor(saludsub,
                   labels = c("Excelente", "Muy buena", "Buena", "Regular", "Mala"),
                   ordered = TRUE)

## Calculamos las frecuencias absolutas simples
f <- table(saludsub)

## Calculamos las frecuencias relativas simples
frel <- prop.table(f)

## Calculamos las frecuencias absolutas acumuladas
fcum <- cumsum(f)

## Calculamos las frecuencias relativas acumuladas
frelcum <- cumsum(frel)

## Juntamos todo y armamos una tabla de distribución de freucuencias.
cbind(f, fcum, frel,frelcum)

frecuencia <- cbind(f, fcum, frel,frelcum)

print(frecuencia, digits = 2)

Ahora analicemos las variables `BISG02` (Ha sufrido algún accidente el útlimo años) y `BISG03` (Ha sufrido alguna enfermedad el último año)


## Seleccionamos BISG02 y la guardamos en una nueva variable
accidente <- enprecosp$BISG02
enfermedad <- enprecosp$BISG03

## Convertimos a factor y etiquetamos los códigos de valores
accidente <- factor(accidente,
                    labels = c("Sí", "No", "Ns/Nc"))
enfermedad <- factor(enfermedad,
                     labels = c("Sí", "No", "Ns/Nc"))

## Construimos las frecuencias para la variable accidente
f <- table(accidente)
frel <- prop.table(f)

## Juntamos todo y armamos una tabla de distribución de freucuencias.
cbind(f, frel)

## Construimos las frecuencias para la variable enfermedad
f <- table(enfermedad)
frel <- prop.table(f)

## Juntamos todo y armamos una tabla de distribución de freucuencias.
cbind(f, frel)
