####Manejo y visualizaci?n de datos en R####

####2. Flujo y funciones basicas ####
####2.1. (4) Recomendaciones basicas ####

# (1) Asegurate en "global options" no tener marcado "Restore Rdata..."

# (2) Asegurate tener definido tu directorio de trabajo y un proyecto organizado: 
setwd ("")
getwd ()

# Una alternativa muy recomendable es definir un proyecto (preferiblemente)
# con git.

# Carpetas para los diferentes grupos de archivos:
# Por ejemplo: “1-archivos”, “2-scripts”, “3-resultados”

# Los nombres de los archivos deben tener un significado y terminar en ".R"
ajuste-modelos.R  # Correcto
a-mod.r           # Incorrecto

#Si los archivos deben ejecutarse en secuencia está bien 
#poner un prefijo con los números

# Por ejemplo: una carpeta de "2-scipts" con los archivos: 
# 0-descarga.R, 1-exploracion.R, 2-Análisis.R

# (3) Manten tu codigo comprensible y facil de leer

# (3.1) Documenta tu codigo para que alguien mas pueda usarlo
# o lo puedas usar tu mismo cuando vuelvas a ver el script :)
# puedes correr todo el codigo pero la parte con la almohadilla no se va a ejecutar

# (3.2) usa nombres memorables y correctos para las variables

# "There are only two hard things in Computer Science: 
# cache invalidation and naming things."
# - Phil Karlton

# Usa nombres correctos (e.g. no caracteres especiales o palabras reservadas)
# Y nombres claros, por ejemplo: https://style.tidyverse.org/syntax.html
# se recomienda usar minusculas separadas por "_"
# se recomienda reservar los "." para objetos tipo S3

mi_vector # Correcto
vector_1 # Correcto

MiVector # Incorrecto
Vector.1 # Incorrecto

# los nombres para variables deben ser nombres y para funciones verbos
# evitar usar nombres comunes en otras funciones / variables

# (3.3) espaciado

# poner espacio despues de las comas, no antes
x[, 1]  # Correcto
x[,1]   # Incorrecto
x[ ,1]  # Incorrecto
x[ , 1] # Incorrecto

# sin espacio antes o despues de parentesis
mean(x, na.rm = TRUE)   # Correcto
mean (x, na.rm = TRUE)  # Incorrecto
mean( x, na.rm = TRUE ) # Incorrecto

# (4) Estructura lógicamente tu código
# Por ejemplo

# (4.1) establecer el directorio de trabajo
# (4.2) llamar a librerias (o instalarlas si no estan instaladas)
#       y asegurate de posteriormente citarlos
library("dplyr")
citation("dplyr")

# (4.3) leer datos
# (4.4) Gestionar de archivos
# (4.5) Analizar los datos
# (4.6) Obtener los resultados que deseas y ¡guardar!
# (archivo, mapa)

####2.2. Introduccion a la gestion de datos, ejemplo con base ####
#1- Ambiente de trabajo
getwd()
setwd("nuevo directorio")

#2- llama a librer?as (e inst?lalas si no est?n instaladas)
install.packages(c("dplyr", "ggplot2"), dep = T)
library("dplyr")
citation(dplyr)

#3- ----- Importar y salvar datos
mydata<- data.frame(
  ID = c(10,20,30,40,50,60,70,80,90,100),
  items = c("libro", "libro", "bol?grafo", "manual","estuche", "manual", "libro", "manual", "estuche","estuche"),
  store = c(TRUE,FALSE,TRUE,FALSE, TRUE,FALSE,TRUE,FALSE,FALSE,FALSE),
  price = c(2.5,8,10,7,8,10,30,1,10,7))

write.csv(mydata,"data_T11.csv")

mydata<-read.csv("data_T11.csv")

#Siempre compueba que los datos se han leido correctamente

mydata<-read.table("data_T11.csv", header=T,	sep=",")
mydata<-read.table("clipboard", header=T,sep="\t")

#4- --- Estadisticas basicas de un data.frame y dibuja datos
summary(mydata)

#tapply() - agrupa los datos de un vector de acuerdo a una variable especificada y les aplica una funci?n
tapply(mydata$price, mydataframe$items, FUN = mean)
tapply(mydata$price, mydataframe$items, FUN = sd)
tapply(mydata$price, mydataframe$items, FUN = range)
tapply(mydata$price, mydataframe$items, FUN = quantile)

#aggregate() - Agrupa los datos de un arreglo de datos de acuerdo 
#a una variable especificada y les aplica una funci?n. Los 
#resultados vienen dados en forma de arreglo de datos con las 
#mismas variables de entrada, pero con tantas filas (casos) 
#como niveles del factor utilizados para agrupar los datos.

aggregate(mydata[,c("ID","price")], list(mydataframe$items), FUN = mean)

#ddply() - resume diferentes funciones para diferentes  factores
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54),
  alt = rnorm(28, mean=160,sd=0.7)
)

ddply(dfx, .(group, sex), summarize,
      mean = mean(age),
      sd = sd(age))

# (5) Obtener los resultados que deseas y ¡salvarlos!
#  (archivo, mapa)

plot(dfx$age, pch=16, col="gray", ylab="Age")
abline(h=mean(dfx$age), col="red", lwd=2)

#guarda el graficos
tiff("MiPrimeraFigura.tif",res=400, width = 120, 
     height = 100, units = "mm")
plot(dfx$age, pch=16, col="gray", ylab="Age")
abline(h=mean(dfx$age), col="red", lwd=2)
dev.off()

##Incluye cosas al grafico
plot(dfx$age~dfx$alt, pch=16,col="gray", 
     ylab="Age", xlab="Height")

plot(dfx$age~dfx$sex, pch=16,col="gray", 
     ylab="Age", xlab="Sex")

plot(dfx$group~dfx$sex, pch=16,col="gray", 
     ylab="Group", xlab="Sex")

#### 2.3. Funciones ####
# Ejemplo de http://adv-r.had.co.nz/Functions.html


# Vamos a ver un ejemplo para contestar a los siguientes puntos:
# ¿Cuales son los tres componentes de una funcion?
# Tres componentes de una función (1) body: cuerpo dentro de la funcion,
# (2) formals: argumentos que controlan como puedes usar la funcion, 
# (3) environment: mapa que incluye la localizacion de las variables
# Cuanod generas una funcion muestra los tres componentes y si no es 
# que no se ha creado en el ambiente global

f1 <- function(x) {
  function() {
    x + 10
  }
}
formals(f1)
body(f1)
environment(f1)
f1

# ¿Que nos devuelve el siguiente codigo?
x <- 10
f1 <- function(x) {
  function() {
    x + 10
  }
}
f1(1)()

# ¿Como harias esta linea mas facil de leer?
mean(, TRUE, x = c(1:10, NA))
  
# ¿Tiene la siguiente funcion un error? ¿Por que?
f2 <- function(a, b) {
    a * 10
  }
f2(10, stop("This is an error!"))
