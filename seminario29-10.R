f <- function(a, b){
  a^2
}

f(3, 5)

paste(c("a", "B"), "a", "b")

library(formattable)
library(kableExtra)
library(dplyr)
enprecosp <- read.table("data/enprecosp_2011.txt", header = TRUE, sep = "|")



## Prevalencia de consumo del último mes y riesgo percibido
## Alcohol
riesgo_perc <- factor(enprecosp$BIBA14_02,
                      labels = c("Ningún riesgo",
                                 "Riesgo leve o moderado",
                                 "Gran riesgo",
                                 "No sé que riesgo corre"))


prev_mes <- factor(enprecosp$P1M_BA,
                   labels = c("Sí",
                              "No"))

## Realizamos una tabla de frecuencias absolutas conjunta
tc <- table(riesgo_perc, prev_mes)
tc

tc_tot <- prop.table(tc)
tc_tot <- addmargins(tc_tot)

addmargins(tc, 2)

tc_fila <- addmargins(tc, margin = 1)
tc_fila <- prop.table(tc_fila, 1)


tc_col <- addmargins(tc, margin = 2)
tc_col <- prop.table(tc_fila, 2)


sexo <- factor(enprecosp$BHCH04J,
               labels = c("Varón",
                          "Mujer"))

prev_alcohol <- factor(enprecosp$P1M_BA,
                       labels = c("Sí",
                                  "No"))

tc <- table(sexo, prev_alcohol)

tc

## Veamos el grado de asociación
a <- tc[1,1]
b <- tc[1,2]
c <- tc[2,1]
d <- tc[2,2]


Q <- ( a*d - b*c )/ ( a*d + b*c )

riesgo_perc <- factor(enprecosp$BIBA14_01,
                      labels = c("Ningún riesgo",
                                 "Riesgo leve o moderado",
                                 "Gran riesgo",
                                 "No sé qué riesgo"))

# prop.table(table(riesgo_perc))

prev_alcohol <- factor(enprecosp$P1M_BA,
                       labels = c("Sí",
                                  "No"))

tc <- table(riesgo_perc, prev_alcohol)

## Calculamos las frecuencias esperadas y observadas
chi <- chisq.test(tc)
chi$observed

##                         prev_alcohol
## riesgo_perc                Sí   No
##   Ningún riesgo          4153 2813
##   Riesgo leve o moderado 7432 7309
##   Gran riesgo            4549 7622
##   No sé qué riesgo        193  272

chi$statistic


(chi$observed - chi$expected)^2
(chi$observed - chi$expected)^2/chi$expected
sum((chi$observed - chi$expected)^2/chi$expected)


sexo <- factor(enprecosp$BHCH04J,
               labels = c("Varón",
                          "Mujer"))

prev_alcohol <- factor(enprecosp$P1M_BA,
                       labels = c("Sí",
                                  "No"))

tc <- table(sexo, prev_alcohol)

chi <- chisq.test(tc)
chi_val <- chi$statistic

n <- sum(tc)
phi <- sqrt(chi_val/n)

names(enprecosp)
sum(enprecosp$W_PERS)



riesgo_perc <- factor(enprecosp$BIBA14_01,
                      labels = c("Ningún riesgo",
                                 "Riesgo leve o moderado",
                                 "Gran riesgo",
                                 "No sé qué riesgo"))

# prop.table(table(riesgo_perc))

prev_alcohol <- factor(enprecosp$P1M_BA,
                       labels = c("Sí",
                                  "No"))

tc <- table(riesgo_perc, prev_alcohol)


chi <- chisq.test(tc)
chi$observed
chi$expected
chi_val <- chi$statistic; chi_val

f <- nrow(tc)
c <- ncol(tc)
n <- sum(tc)

C <- sqrt(chi_val/(chi_val + n)); C

Cmax <- sqrt((min(f, c) - 1) / min(f, c)); Cmax

V <- sqrt(chi_val/(n * min(ncol(tc), nrow(tc))))



## Base de violencia
url <- "http://datos.jus.gob.ar/dataset/42720e56-2274-4ad5-820d-c366d784bc8c/resource/a768b6d5-7f1f-4067-a0b1-84600e2f1fde/download/intervenciones-domiciliarias-violencia-familiar-2019-trimestre-2.csv"

base <- read.csv(url)

library(readxl)
memoria <- read_xls("data/EXP1.xls")


plot(memoria$NPD1, memoria$NPD3)

cor(memoria$NPD1, memoria$NPD3)
cor(memoria$NPD2, memoria$NPD3)


cor(memoria$NPD3, memoria$EDAD)


plot(memoria$EDAD, memoria$NPD3)

library(dplyr)

SR <- memoria %>%
  filter(GRUPO == 'SR')


cor(SR$NPD3, SR$EDAD)


## IF
x <- 0
if(x == 0){
  "X vale cero"
}

x <- c(1:10, NA)



if(is.na(x)){
  "Te faltan valores"
}


##

x <- 1

while(x < 10){
  print(x)
  x <- x + 1
}

x <- rnorm(100)

for(i in 1:10){
  print(x[i])
}

letras <- letters[1:10]

for(i in letras){
  print(paste(i, "Letra"))
}

for(i in 1:length(letras)){
  print(letras[i])
}

## Definimos una función que calcula la media
media <- function(x = 1:10){
  sum(x)/length(x)
}

class(media)
media()
media(2:20)


holaMundo <- function(){
  print("hola mundo")
  return(NULL)
}

holaMundo()

var <- holaMundo()

sumar <- function(x, y){
  x + y
}

sumar(5, 6)
