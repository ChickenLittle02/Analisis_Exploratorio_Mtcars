# Cargar las librerías necesarias
library(ggplot2)

# Convertir las variables 'am' (transmisión) y 'vs' (motor) en factores para la representación gráfica
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automática", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels = c(0, 1), labels = c("Motor V", "Motor recto"))

# Crear un dataframe con la frecuencia de cada combinación de tipo de transmisión y tipo de motor
data_mtcars <- as.data.frame(table(mtcars$am, mtcars$vs))
colnames(data_mtcars) <- c("Tipo de Transmisión (am)", "Tipo de Motor (vs)", "Frecuencia")

# Crear el gráfico de barras de la transmisión y el tipo de motor
grafico_mtcars <- ggplot(data_mtcars, aes(x = `Tipo de Transmisión (am)`, y = Frecuencia, fill = `Tipo de Motor (vs)`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Cantidad de Coches por Transmisión y Tipo de Motor",
    x = "Tipo de Transmisión",
    y = "Cantidad de Coches",
    fill = "Tipo de Motor"
  ) +
  theme_minimal()

# Mostrar el gráfico
print(grafico_mtcars)

# Guardar el gráfico como una imagen PNG
ggsave("mtcars_transmision_motor.png", plot = grafico_mtcars, width = 8, height = 6)

# Guardar los datos usados para crear el gráfico en un archivo CSV
write.csv(data_mtcars, "mtcars_transmision_motor.csv", row.names = FALSE)

# Cargar las librerías necesarias
library(ggplot2)

# Convertir las variables 'vs' (motor) y 'gear' (número de marchas) en factores para la representación gráfica
mtcars$vs <- factor(mtcars$vs, levels = c(0, 1), labels = c("Motor V", "Motor recto"))
mtcars$gear <- factor(mtcars$gear, levels = c(3, 4, 5), labels = c("3 marchas", "4 marchas", "5 marchas"))

# Verificar que las conversiones de factores sean correctas
print(table(mtcars$vs, mtcars$gear))

# Crear un dataframe con la frecuencia de cada combinación de tipo de motor y número de marchas
data_mtcars_vs_gear <- as.data.frame(table(mtcars$vs, mtcars$gear))
colnames(data_mtcars_vs_gear) <- c("Tipo de Motor (vs)", "Número de Marchas (gear)", "Frecuencia")

# Verificar que los datos tengan sentido
print(data_mtcars_vs_gear)

# Crear el gráfico de barras del tipo de motor y el número de marchas
grafico_vs_gear <- ggplot(data_mtcars_vs_gear, aes(x = `Número de Marchas (gear)`, y = Frecuencia, fill = `Tipo de Motor (vs)`)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Cantidad de Coches por Tipo de Motor y Número de Marchas",
    x = "Número de Marchas",
    y = "Cantidad de Coches",
    fill = "Tipo de Motor"
  ) +
  theme_minimal()

# Mostrar el gráfico
print(grafico_vs_gear)

# Guardar el gráfico como una imagen PNG
ggsave("mtcars_motor_marchas.png", plot = grafico_vs_gear, width = 8, height = 6)

# Guardar los datos usados para crear el gráfico en un archivo CSV
write.csv(data_mtcars_vs_gear, "mtcars_motor_marchas.csv", row.names = FALSE)
