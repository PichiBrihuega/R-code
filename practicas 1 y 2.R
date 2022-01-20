#Creacion de variables
a <- 3 #Por defecto reconoce la variable como numerica
class(a) #Aquí se puede comprobar
a <- as.numeric(2) #Se puede nombrar de forma explicita por si la variable la reconociera de otra forma
a <- as.integer(2) #Por ejemplo definirlo de forma explicita viene bien para los enteros
#De igual forma para todos los tipos de variables hay una forma que R reconoce por defecto y le asigna un tipo de variable
#o se puede defini de forma exlpicita
char <- "cadena"
char <- as.character(a) #Cambia el valor de a que es un entero a una nueva variable char que sera una cadena de texto
v <- c("hombre", "mujer", "mujer", "mujer", "hombre", "mujer")
fact <- as.factor(v)
fact2 <- factor(v)
tamaño <- c("Alto", "Bajo", "Bajo", "Medio", "Bajo", "Medio", "Alto")
factor_tamaño <- factor(tamaño, ordered = TRUE, levels = c("Bajo", "Medio", "Alto")) 
#Este último es un ejemplo para que pueda verse que los valores pueden ordenarse



1+1
a <- 1+1 #Esta opcion no seria correcta porque a daria un valor numerico, no entero y la suma de netero debe dar un valor entero
a <- as.integer(1)+as.integer(1) ; a <- as.integer(1+1) #Cualquiera de estas dos es correcta
b <- 2 ; c <- 3 ; a <- b + c
a <- paste("cadena","de","caracteres",sep =" ")



v1 <- c(6311,6564,6598,6629,6699,621,65,677) ; print(v1)
v2 <- c(1,2,3,4,5,6,7,8,9)
v3 <- c(1,1,2,2,3,3,4,4,5,5)
v4 <- c(1,2,2,3,3,3,4,4,4,4,5,5,5,5,5)
v5 <- c(1,2,3,4,1,2,3,4,1,2,3,4)
v6 <- c(2,2,2,3,3,3,1,1,1,5,5,5,5,5,5,5,6,7,7,7)
lista <- list(v1,v2,v3,v4,v5,v6) ; media <- c() ; minimo <- c() ; rango <- c() ; desviacion_estandar <- c()
for (i in lista) {
  media <- c(media,mean(i)) 
  minimo <- c(minimo,min(i)) 
  rango <- c(rango,IQR(i)) 
  desviacion_estandar <- c(desviacion_estandar,sd(i))
}
print(rango)
datos <- data.frame(
  "media" = media , "minimo" = minimo , "rango" = rango , "desviacion_estandar" = desviacion_estandar
)
datos


n <- 20 ; m <- 10
matriz1 <- matrix(rnorm(n*m,0,1),nrow = n, ncol = m)
matriz1[5,3]
matriz1[5,]
matriz1[,2]
matriz1[,1:5]
