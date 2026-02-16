# Cargar libreria
library(sqldf)

# Leer archivo filtrado local (ya contiene solo las fechas 2007-02-01 y 2007-02-02)
datos_tarea <- read.csv("data/household_power_consumption_filter.txt",
              sep = ";", 
              header = TRUE,
              stringsAsFactors = FALSE)

# Convertir la columna Date a formato Date
datos_tarea$Date <- as.Date(datos_tarea$Date, format = "%d/%m/%Y")

# Convertir la columna Time a formato POSIXct (solo hora)
datos_tarea$Time <- strptime(datos_tarea$Time, format = "%H:%M:%S")

# Crear campo datetime combinando Date y Time
datos_tarea$datetime <- as.POSIXct(paste(datos_tarea$Date, format(datos_tarea$Time, "%H:%M:%S")))

# Setear el tiempo local en inglés para que los días de la semana se muestren en inglés
Sys.setlocale("LC_TIME", "English") 

# Guardar gráfico como PNG
png("figure/plot3.png", width = 480, height = 480)
plot(datos_tarea$datetime, datos_tarea$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")
lines(datos_tarea$datetime, datos_tarea$Sub_metering_2, col = "red")
lines(datos_tarea$datetime, datos_tarea$Sub_metering_3, col = "blue")
axis.POSIXct(1, at = seq(min(datos_tarea$datetime), max(datos_tarea$datetime) + 86400, by = "day"), format = "%a")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()

