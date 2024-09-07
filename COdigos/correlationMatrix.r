# Cargar los paquetes
library(ggplot2)
library(reshape2)
library(gridExtra)

# Calcular la matriz de correlación
correlation_matrix <- cor(mtcars)

# Guardar la matriz de correlación en un archivo CSV
write.csv(correlation_matrix, "correlation_matrix_mtcars.csv")

# Convertir la matriz de correlación a formato largo para ggplot2
melted_correlation_matrix <- melt(correlation_matrix)

# Crear el gráfico de calor (heatmap)
heatmap_plot <- ggplot(data = melted_correlation_matrix, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1, 1), space = "Lab", 
                       name="Correlación") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1)) +
  labs(title = "Heatmap de la Matriz de Correlación - mtcars",
       x = "Variables",
       y = "Variables") +
  coord_fixed()

# Guardar el gráfico de calor como imagen
ggsave("heatmap_correlation_mtcars.png", plot = heatmap_plot, width = 8, height = 6)
