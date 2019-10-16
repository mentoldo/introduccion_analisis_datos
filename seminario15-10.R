## Dirección de la base

url <- "http://datos.jus.gob.ar/dataset/42720e56-2274-4ad5-820d-c366d784bc8c/resource/a768b6d5-7f1f-4067-a0b1-84600e2f1fde/download/intervenciones-domiciliarias-violencia-familiar-2019-trimestre-2.csv"

base <- read.csv(url)
# base <- read.csv2(url, sep = ",")


?read.table


names(base)

## Tabla de distribución de frecuencias para género

f <- table(base$victima_genero)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)

cbind(f, frel)

## Tabla de distribución de frecuencias agresor_relación_víctima

f <- table(base$agresor_relacion_victima)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)

cbind(f, frel)

## Tabla de distribución de frecuencias tipo_violencia
# attach(base)
f <- table(base$violencia_tipo)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)

barplot(frel, col = "tomato",
        ylim = c(0, 0.6))

pie(frel)

cbind(f, frel)

##
edad_reco <- cut(base$victima_edad, breaks = seq(0, 80, by = 10), include.lowest = TRUE)
f <- table(edad_reco)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)

cbind(f, fcum, frel, frelcum)

hist(base$victima_edad)

## Víctima-Nacionalidad
f <- table(base$victima_nacionalidad)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)
cbind(f, fcum, frel, frelcum)


## Víctima-embarazo

f <- table(base$victima_embarazo)
fcum <- cumsum(f)
frel <- prop.table(f)
frelcum <- cumsum(frel)
cbind(f, fcum, frel, frelcum)


##

media <- mean(victima_edad)
sd <- sd(victima_edad)

sd/media


boxplot(victima_edad, col = "steelblue")
