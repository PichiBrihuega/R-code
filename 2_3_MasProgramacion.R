####Manejo y visualizaci�n de datos en R####

####4. M�s programaci�n####
####4.1.condicionales####

#Igualdad y desigualdad
TRUE == TRUE
TRUE != TRUE

"coche"=="moto"
"coche"!="moto"

3 == 2
3 != 2

#--Menor y mayor
3 > 2
2 > 3

"coche" > "moto"
"coche" < "moto"

TRUE > FALSE

##-----operadores l�gicos con vectores
price<-c(1:15)
price > 10
threshold<-rep(10,15)
threshold == price


TRUE & TRUE
TRUE | FALSE
TRUE & FALSE
TRUE | FALSE
FALSE & FALSE
FALSE |FALSE


y <- 19
y < 30 & y > 20
y < 30 | y > 20

#Operador ! o NO
!TRUE
!FALSE
!is.numeric("hola")

##-----SENTENCIA IF
x<-1
if(x==1){"se cumple la condici�n"}
x<-2
if(x==1){"se cumple la condici�n"}

##-----SENTENCIA IF... ELSE
x<-1
x<-2 
if(x==1){"se cumple la condici�n"} else{"no se cumple"} 

##-----SENTENCIA IFELSE
x<-1
ifelse(x==1,"se cumple la condici�n","no se cumple")

####4.2- WHILE####

precio<-1 
while(precio<=7){ 
  print("precio bajo") } 

while(precio<=7){ 
  print("precio bajo") + 
    precio <- precio + 1 
} 

while(precio<=7){ 
  print(paste("precio bajo" + precio))
  precio <- precio + 1 
} 

####3- FOR####
precios <- c(1, 1.2, 1.3, 1.5, 1.2, 1.7, 1.4) 
for(i in 1:length(precios)){ 
  print(p[i])
} 

precios <- list(1, 1.2, 1.3, 1.5, 1.2, 1.7, 1.4) 
for(i in 1:length(precios)){ 
  print(p[[i]])
} 

ciudades <- list("Madrid", "Paris",
                 "Londres", "Tokio",
                 "Rio de Janeiro")

for(c in ciudades) {
  print(ciudades)
}

for(i in 1:length(ciudades)) {
  if(ciudades[i]==6){
    break
  }
  print(paste(ciudades[i], "est� en la posici�n",
              i, "en el vector ciudades"))
}

#which() devuelve la posici�n de los valores que cumplan con la condici�n 
x <- c(1,2,3,4,5,NA,NA,NA,9)
which(x>1) 
which(is.na(x))

####Escribir funciones en R####
suma2numeros <- function(a, b) {a + b}
suma2numeros(a = 1423, b = 77)

selcol<- function(a){
  print(a[,1:3])}
