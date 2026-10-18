set.seed(1702)
n <- 114
cauchypop <- rcauchy(n, location = 2.6, scale = 2)
cauchypopor <- cauchypop[order(cauchypop)]
quantisprobid <- seq(1,n,1)/(n+1)
qcauchypop <- qcauchy(quantisprobid,location = 2.6, scale = 2)
qnormalpop <- qnorm(quantisprobid,mean = 2.5, sd = sqrt(1.6))
probdata <- data.frame(cauchypopor, qcauchypop, qnormalpop)
View(probdata)
library(tidyverse)
ggplot(probdata, aes(x = cauchypopor))+
  geom_point(aes(y = qcauchypop, color = "v.a. Cauchy Dist"))+
  geom_point(aes(y = qnormalpop, color = "v.a. Normal Dist"))+
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", linewidth = 0.8)+
  scale_color_manual(values = c("v.a. Cauchy Dist" = "blue", "v.a. Normal Dist" = "red"))+
  labs(x = "Valores gerados ordenados", y = "Quantis", color = NULL)