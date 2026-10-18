# Carregar o pacote
library(ggplot2)

# Ler os dados do ficheiro txt
dados <- read.delim(
  "Petroleum&OtherLiquidFuels.txt",
  sep = "\t",
  header = TRUE,
  dec = ","
)

# Converter a coluna Date para formato data
dados$Date <- as.Date(dados$Date)

# Selecionar apenas as variáveis necessárias
dados_grafico <- data.frame(
  Date = dados$Date,
  LADiesel = dados$LADiesel,
  LAGasoline = dados$LAGasoline,
  MEAN = dados$MEAN
)

# Converter para formato longo
dados_long <- data.frame(
  Date = rep(dados_grafico$Date, 3),
  
  Value = c(
    dados_grafico$LADiesel,
    dados_grafico$LAGasoline,
    dados_grafico$MEAN
  ),
  
  Series = c(
    rep("LADiesel", nrow(dados_grafico)),
    rep("LAGasoline", nrow(dados_grafico)),
    rep("MEAN", nrow(dados_grafico))
  )
)

# Criar o gráfico
grafico <- ggplot(dados_long, aes(x = Date, y = Value, color = Series)) +
  geom_line(linewidth = 0.7) +
  labs(
    title = "YoY Variation of Fuel Prices",
    x = "Date",
    y = "YoY variation (%)",
    color = "Series"
  ) +
  theme_minimal()

# Mostrar o gráfico
print(grafico)