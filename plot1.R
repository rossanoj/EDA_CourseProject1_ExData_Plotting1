# Cargar libreria
library(sqldf)

# Leer archivo filtrado local (ya contiene solo las fechas 2007-02-01 y 2007-02-02)
datos_tarea <- read.csv("data/household_power_consumption_filter.txt",
              sep = ";", 
              header = TRUE,
              stringsAsFactors = FALSE)

# Guardar gráfico como PNG
png("figure/plot1.png", width = 480, height = 480)
hist(datos_tarea$Global_active_power,
     main = "Histograma de Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     breaks = 20)
dev.off()

