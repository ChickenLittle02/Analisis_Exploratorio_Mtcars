# Gráfico de dispersión para mpg vs wt con línea de regresión
png("mpg_vs_wt.png")
plot(mtcars$wt, mtcars$mpg,
     xlab = "Peso del vehículo (wt)",
     ylab = "Millas por galón (mpg)",
     main = "Relación entre MPG y Peso del Vehículo",
     pch = 19, col = "blue")
abline(lm(mpg ~ wt, data = mtcars), col = "darkblue", lwd = 2)  # Línea de regresión
dev.off()

# Gráfico de dispersión para mpg vs cyl con línea de regresión
png("mpg_vs_cyl.png")
plot(mtcars$cyl, mtcars$mpg,
     xlab = "Número de cilindros (cyl)",
     ylab = "Millas por galón (mpg)",
     main = "Relación entre MPG y Número de Cilindros",
     pch = 19, col = "green")
abline(lm(mpg ~ cyl, data = mtcars), col = "darkgreen", lwd = 2)  # Línea de regresión
dev.off()

# Gráfico de dispersión para hp vs disp con línea de regresión
png("hp_vs_disp.png")
plot(mtcars$disp, mtcars$hp,
     xlab = "Desplazamiento del motor (disp)",
     ylab = "Potencia (hp)",
     main = "Relación entre Potencia y Desplazamiento del Motor",
     pch = 19, col = "red")
abline(lm(hp ~ disp, data = mtcars), col = "darkred", lwd = 2)  # Línea de regresión
dev.off()
