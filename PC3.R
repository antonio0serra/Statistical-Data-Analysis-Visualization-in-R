# Carregar o pacote
library(ggplot2)

# Ler o ficheiro CSV
dados <- read.csv("Jobs_and_Growth.csv", stringsAsFactors = FALSE)

# Selecionar apenas os dados pretendidos:
# - Indicador: Employment in the food industry
# - Países: Spain e Finland
dados_filtrados <- subset(
  dados,
  Sub.indicator.Name == "Employment in the food industry" &
    Member.State.Name %in% c("Spain", "Finland")
)

# Criar o gráfico de barras
grafico <- ggplot(dados_filtrados,
                  aes(x = factor(Time.Period),
                      y = Data,
                      fill = Member.State.Name)) +
  
  # Barras lado a lado
  geom_bar(stat = "identity", position = "dodge") +
  
  # Títulos e legendas
  labs(
    title = "Employment in the food industry",
    x = "Year",
    y = "Data",
    fill = "Country"
  ) +
  theme_minimal()

# Mostrar o gráfico
print(grafico)