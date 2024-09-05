#Calculo de la distribucion Chi-Cuadrado
 # Cargar el dataset mtcars
 data(mtcars)
 
 # Convertir las variables relevantes a factor para asegurar que son categóricas
 mtcars$vs <- factor(mtcars$vs)
 mtcars$am <- factor(mtcars$am)
 mtcars$gear <- factor(mtcars$gear)
 mtcars$carb <- factor(mtcars$carb)
 mtcars$cyl <- factor(mtcars$cyl)
 
 # Listado de las variables categóricas
 variables <- c("vs", "am", "gear", "carb", "cyl")
 
 # Iterar sobre los pares de variables para calcular la prueba de Chi-Cuadrado
 for(i in 1:length(variables)) {
     for(j in (i+1):length(variables)) {
         var1 <- variables[i]
         var2 <- variables[j]
         
         # Crear tabla de contingencia
         tabla_contingencia <- table(mtcars[[var1]], mtcars[[var2]])
        
         # Realizar la prueba de Chi-Cuadrado
         chi_test <- chisq.test(tabla_contingencia)
         
         # Imprimir los resultados
         cat("Variables:", var1, "y", var2, "\n")
         cat("X-squared =", chi_test$statistic, ", df =", chi_test$parameter, ", p-value =", chi_test$p.value, "\n")
         
         # Interpretación del valor p
         if (chi_test$p.value < 0.05) {
             cat("Conclusión: Hay una relación significativa entre", var1, "y", var2, "\n\n")
         } else {
             cat("Conclusión: No hay evidencia de una relación significativa entre", var1, "y", var2, "\n\n")
         }
     }
 }