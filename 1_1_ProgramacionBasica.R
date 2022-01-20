####Manejo y visualizaci?n de datos en R####

####1. Programaci?n b?sica
####1.0. Entorno de trabajo en R studio
1
1 + 2   #R se puede usar simplemente como una calculadora, pero actualmente
        #no hemos guardado ningun objecto

a <- 1 # flecha: asignacion. Asignar nombres a los objetos o crear una variable
b <- 2
a
a + b
str(a) #str() es una funcion en R

#En environment podemos ver los objetos que tenemos en nuesta sesion de trabajo.

####1.1. Usando paquetes y librerias
install.packages('tidyverse') #descarga e instala paquetes de CRAN 
                              #("The Comprehensive R Archive Network")
library(tidyverse)  #carga la libreria, haciendo  que todas las 
                    #funciones estén disponibles para usase
library(dplyr)
library(plyr)
tidyverse::select   #usa una determinada funci?n de un paquete 
                    #(esto se usa cuando hay conflicto porque en dos paquetes
                    #se llaman igual las funciones)
data("iris")        #carga unos datos determinados en el ambiente de trabajo

str(iris)     #obtienes un resumen de la estructura de un objeto
class(iris)   #puedes ver la clase de objeto que es
dim(iris)     #puedes ver las dimensiones dle objeto
view(iris)    #puedes ver el archivo

names(iris)
kk <- iris[,c(-Sepal.Length)]
view(kk)

#select funcion para seleccionar datos
new <- select(iris,-"Sepal.Length")
view(new)
#selecciona todas las variables de la base de datos iris menos "Sepal.Lenght"
#Luego renomrbra usando la función rename() del paquete dplyr la variable "Petal.length" como "Lenght"

####1.2. Pidiendo ayuda y viendo ejemplos
?mean #obtenemos ayuda de una funcion particular

install.packages("remotes")
remotes::install_github("VeruGHub/easyclimate")
library(easyclimate)
#ver vignettes:
# https://verughub.github.io/easyclimate/articles/climatic-indices.html

####1.3. Directorio de trabajo
getwd() #nos muestra el directorio de trabajo actual
setwd("C:\\Users\\Alejandro Jodra\\Desktop\\R") #nos permite cambiar le directorio de trabajo

mycars <- read.csv("cars.csv")
view(mycars)

#¿Cómo pensais que es la mejor manera de indicar 
#directorios de trabajo y organizar los archivos?

####1.4. Creacion vectores y operaciones basicas

##Quién puede responder a estas preguntas (a responder en la practica)
#- ¿Cuáles son las tres propiedades de un vector, 
#  más allá de su contenido?
#- ¿Cuáles son los cuatro tipos más comunes de vectores?
#- ¿Qué son los atributos? ¿Cómo los cnsigues y defines?
#- ¿Cómo se diferencian las listas de los vectores? ¿Y una matriz de un data.frame?
#- ¿Puedes tener una lista que es una matriz? ¿Y un data.frame que contenga como una columna una matriz?

nombre <- "paloma"
nombre
print(nombre)
class(nombre)

# - ¿Cuáles son las tres propiedades de un vector, 
# más allá de su contenido?
# Si puedes definelas y exploralas para el vector nombre

# ¿Cuál es la diferencia entre un vector y una lista?
b <- 2
b

# ¿Cuál es la diferencia entre el vector nombre y b?
str(b)        #mejor manera de comprender la estructura de una variable
print(b)      #imprime variable
class(b)      #imprime tipo de variable
cat(name,b)   #imprimir variables de diferentes tipos y concatenadas

#- ¿Cuáles son los cuatro tipos más comunes de vectores?
# Para un determinado vector puedes verlo con typeof()
# Y tambien chequear si es de un determinado tipo con
# la función “is”: is.character(), is.double(), is.integer(), is.logical()

#que tipo de vector da si hacemos lo siguiente
a <- c(1,2)
a <- c("como","estas")
a <- c("como",2)

##Operaciones aritmeticas

#Se pueden hace operaciones basicas con los objetos numericos: suma, resta, division
resultado <- (a+b)/2
number <- 5/4

#para otras operaciones matematicas existen funciones: log(), sqrt
log(10)
log(10/2)

#buscar en la ayuda de R o internet es importante! Hay miles de codigos ejemplo
?sqrt
sqrt(2)
exp(2)
2.718^2
2^2

#Si no se pone un numbre no se guarda el resultado
(a+b)/2

#Se pueden hace operaciones basicas con los objetos numericos: suma, resta, division
resultado <- (a+b)/2
number <- 5/4

#para otras operaciones matematicas existen funciones: log(), mean(), min()
log(10)
log(10/2)

####generar un vector, operar y selecionar elementos

#Para generar un vector usamos la funcion concatenar: c
vector1 <- c(5,10,23,44,65)
class (vector1)
str (vector1)
length (vector1)

#generar sequencias con vectores
vector2 <- c(6:10)
vector2 <- rep(6,10)
vector2 <- rep(6,length(vector1))
rep(1:3,c(1,4,5)) 
vector2 <- seq(6,10)
seq(9,1,-2)
seq(9,1,length=7)

#tipos de vectores: numericos, logicos, caracteres
vector1 <- c(5,10,23,44,65)
vector2 <- c(T,F,T)
vector3 <- c("red","blue","yellow","green")

vector1 > 3
vector1 [vector1 > 3]
vector2 <- c(6:10)

#selecciona las posiciones en el vector
vector2[1]#posicion 1
#posicion 4
#posicion 1,2

#resuelve tu mismo:
#crea un vector "y" con 100 posiciones y distribución normal
# de media 3 y desviación estándar 2
#selecciona la posicion 2,3,4,5, 10, 25, 150, generando un nuevo vector z
#inspecciona los valores de y y z

##valores NA: not available
x<-c(1,2,3,NA,4,5) 
x
is.na(x)
x[x>2] 
x<-x[!is.na(x)] 

#resuelve tu mismo:
#suma el vector x y el vector z
#¿Cuál es el resultado? ¿hay algo que te llame la atención?

####1.4. Tipos de objetos


##generar una matrix y selecionar elementos
X<-matrix(c(1,0,0,0,1,0,0,0,1), nrow=3)
?matrix

class(X)
attributes(X)

A<-matrix(nrow=3, ncol=3)
rep(0,6)

#convertimos un vector a una matriz con la funcion matrix()
vector<-c(1,2,3,4,4,3,2,1)
V <- matrix(vector, byrow = T, nrow = 2)
V

#convertimos un vector a una matriz con la funcion dim()
dim(vector) <- c(4,2)

#definir los nombres de la matriz: colnames, rownames
vector.names <- c("name1","name2")
colnames(vector) <- vector.names
vector

##generar un data.frame y selecionar elementos: generalizacion matrices
#para hacer un data.frame usamos la funcion data.frame
mydataframe <- data.frame (vector1, vector2, vector1)

#vemos el tipo de objeto y la estructura
class(mydataframe)
str(mydataframe)

names(mydataframe)
row.names(mydataframe)

dim(mydataframe)
nrow(mydataframe)
ncol(mydataframe)

#seleccionamos la fila 2,3  y la primera columna
mydataframe[c(2,3), 1]

#elimina la columna 3

#union de columnas o filas al dataframe
cbind (mydataframe, vector2)
rbind (mydataframe, nuevo=c(1:3))

#cambiamos los nombres del data frame
colnames(mydataframe)
colnames(mydataframe) <- c("c1","c2","c3","c4")
mydataframe$factor <- c("c1","c2","c3","c4","c4")

mydataframe[mydataframe$factor=="c4",]

mydataframe <- data.frame (vector1, vector2)
names (mydataframe)

##convertir de matrices a data.frames
mymatrix <- matrix(c(1:25), nrow = 5,ncol = 5)
class(mymatrix)
str(mymatrix)

colnames(mymatrix) <- c(letters [1:5])
names(mymatrix)

rownames(mymatrix)

dim(mymatrix)
nrow(mymatrix)
ncol(mymatrix)

mymatrix[1,4]
mymatrix[6,3]

nombres <- c("Temp", "Prec", "alt")
names(mydataframe)<- nombres

####operadores logicos
mydataframe[mydataframe$Prec <= 8, ]  #Seleccionamos todas las filas donde la precip
                                        #es menor o igual a 8
mydataframe[mydataframe$alt == 3, ]    #Seleccionamos todas las filas donde la altitud
                                        #es igual a 3
mydataframe$Temp > 3  #Seleccionamos todas las filas donde la Temperatura es mayor 
                    #que 3

#convertir matrix en dataframe
m_dataframe <- as.data.frame(mymatrix)
class(m_dataframe)

#convertir dataframe en matrix 
d_matrix <- as.matrix (mydataframe)
names(d_matrix) # no funciona porque es una matrix
colnames(d_matrix)