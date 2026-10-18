library(ggplot2)

dados <- read.csv("clima.csv", header = TRUE, stringsAsFactors = FALSE)

dados[[1]] <- as.POSIXct(dados[[1]], format = "%Y-%m-%d %H:%M:%S" , tz = "UTC")

dados_agosto <- subset(dados,
                       format(dados[[1]], "%Y") == "2010" &
                         format(dados[[1]], "%m") == "08")

dados_agosto[[5]] <- as.numeric(dados_agosto[[5]])

dados_agosto$Dia <- as.POSIXct(as.Date(dados_agosto[[1]]) , tz = "UTC")

mediana_diaria <- aggregate(dados_agosto[[5]] ~ dados_agosto$Dia, FUN = median)

colnames(mediana_diaria) <- c("Dia", "Pressao")

grafico <- ggplot(dados_agosto, aes(x = dados_agosto[[1]], y = dados_agosto[[5]])) +
  geom_line(color = "steelblue", alpha = 0.5) +
  geom_line(data = mediana_diaria, aes(x = Dia, y = Pressao),
            color = "darkred", size = 1.2) +
  labs(title = "Variacao Horaria da Pressao em Agosto de 2010",
       subtitle = "Inclui linha da mediana diaria da pressao",
       x = "Data e Hora",
       y = "Pressao (hPa)",
       caption = "Fonte: clima.csv") +
  theme_minimal()

print(grafico)