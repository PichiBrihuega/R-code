# install.packages("tidyverse")
library(tidyverse) #ver conflictos por funciones que se llaman igual

#### 0| ejemplo r base vs. pipa ####
names(mtcars)

head(mtcars, n = 2)
mtcars %>%
  head(n = 2)

#### 1| readr (read rectangular data) ####
cars_df <- read.table("cars.csv", sep = ";",
                      header = TRUE)

#check the data
glimpse(cars_df)
head(cars_df)
tail(cars_df)
summary(cars_df)
names(cars_df)

#### 2| dplyr (data manipulation) ####
# [Roland Krasser](https://cran.r-project.org/web/packages/explore/vignettes/explore_mtcars.html)
# Los datos fueron extraidos de 1974 Motor Trend US magazine, 
# contienen consumo de gaslina y 19 asoectis del diseño del automovil
# para 32 automoviles.

# Nuestro objetivo: seleccionar la mejor marca (no real)
# 1. Seleccionamos variables de interés
# 2. Filtramos los coches con un numero de cilindos mayor de 4
# 3. Los colocamos en orden descendiente
# 4. Mostramos los resultados
names(cars_cyl)  
cars_cyl <- cars_df %>% 
  select(-c(disp, hp, drat)) %>% 
  filter(cyl > 4) %>% 
  arrange(desc(cyl)) %>% 
  glimpse()

# or
cars_cyl_2 <- cars_df %>% 
  select(X1, cyl, mpg, everything()) %>% # reordenar
  arrange(cyl) %>% # lo ordeno en orden ascendente
  filter(X1 == "Mazda RX4") %>% # filtro con caracteres
  glimpse()

#5. Creo una nueva variable que relacione el número de cilindos con el combustible
cars_cyl_mpg <- cars_cyl %>% 
  mutate(mpg_cyl = mpg * cyl) #con mutate creo una nueva variable
names(cars_cyl_mpg)
#6. Pero estoy interesada en la marca, no en el modelo
# llamo brand a la nueva variable y con word le digo que me de la primera palabra
cars_brand <- cars_cyl_mpg %>% 
  mutate(brand = stringr::word(type, 1)) %>% 
  summarise(mpg_cyl = mean(mpg_cyl)) #ten cuidado con NA's: na.rm = TRUE

#7. Pero esto no es lo que queria porque era la media global
cars_brand_best <- cars_cyl_mpg %>%
  mutate(brand = stringr::word(type, 1)) %>%
  group_by(brand) %>% # combined group_by: brand, gear
  summarise(mpg_cyl = mean(mpg_cyl)) %>% 
  arrange(desc(mpg_cyl)) %>% #lo ordeno de manera descendente
  glimpse()

#8. Pontiac es la mejor

#9. Ahora seleccionamos las tres primeras filas para darles las medallas de oro, plata y bronce
rank_med <- tibble(ranking = c("1 position", "2 position",
                               "3 position"), medals = c("gold", "silver", "bronze"))

cars_brand_best %>% 
  slice(1:3) %>% #seleccionamos las tres primeras filas (slice es para filas)
  mutate(ranking = c("1 position", "2 position",
                     "3 position")) %>% 
  left_join(rank_med)

#### 3| tibble (data manipulation) ####
vignette("tibble") #https://r4ds.had.co.nz/tibbles.html
#+ They do less than data.frames
#+ They complain more than data.frames


#### 4| tidyr (tidy data)#### 
# tidy data 3 characteristics: 1. Every column is variable
# 2. Every row is an observation, 3. Every cell is a single measurement
#[Check out this post by Julie Lowndes and Allison Horst]
#(https://www.openscapes.org/blog/2020/10/12/tidy-data/) 

#### 5| purrr (functional programming)#### 

#### 6| stringr (string manipulation)#### 
#A cohesive set of functions designed to make working 
#with strings as easy as possible


#### 7| forcats (solve problems with factors)

#### 8| ggplot (data visualisation)#### 
#ggplot2 is a system for declaratively creating graphics, 
#based on The Grammar of Graphics. You provide the data, tell ggplot2 how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.

