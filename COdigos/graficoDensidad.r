# Cargar el conjunto de datos mtcars
data(mtcars)

# Crear una lista de nombres de las variables en mtcars
variables <- names(mtcars)

# Iterar sobre cada variable y generar su histograma con las curvas de densidad
for (var in variables) {
  # Extraer la variable actual
  variable <- mtcars[[var]]
  
  # Especificar el archivo de salida para guardar la imagen
  png(filename = paste0("histograma_", var, ".png"), width = 800, height = 600)
  
  # Crear el histograma
  hist(variable, 
       main = paste("Histograma de", var), 
       xlab = var, 
       ylab = "Frecuencia", 
       col = "lightblue", 
       border = "black", 
       probability = TRUE)
  
  # Generar la secuencia de valores para las curvas de densidad
  x <- seq(min(variable), max(variable), length = 100)
  
  # Curva de densidad normal
  y_normal <- dnorm(x, mean = mean(variable), sd = sd(variable))
  lines(x, y_normal, col = "red", lwd = 2)
  
  # Curva de densidad exponencial
  y_exp <- dexp(x, rate = 1/mean(variable))
  lines(x, y_exp, col = "blue", lwd = 2)
  
  # Curva de densidad uniforme
  y_unif <- dunif(x, min = min(variable), max = max(variable))
  lines(x, y_unif, col = "green", lwd = 2)
  
  # Curva de densidad chi-cuadrado
  df <- 2  # Grados de libertad para la distribución chi-cuadrado
  y_chi <- dchisq(x, df = df)
  lines(x, y_chi, col = "purple", lwd = 2)
  
  # Agregar una leyenda
  legend("topright", legend = c("Normal", "Exponencial", "Uniforme", "Chi-cuadrado"),
         col = c("red", "blue", "green", "purple"), lwd = 2)
  
  # Cerrar el dispositivo gráfico para guardar la imagen
  dev.off()
}
