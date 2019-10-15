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

