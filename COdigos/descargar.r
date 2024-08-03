# Cargar la base de datos mtcars
data(mtcars)

# Guardar la base de datos mtcars en un archivo CSV
write.csv(mtcars, "mtcars.csv", row.names = TRUE)  # row.names = TRUE para incluir los nombres de las filas (que son los nombres de los coches)

# Mensajes de confirmación
print("El archivo mtcars.csv se ha guardado exitosamente.")