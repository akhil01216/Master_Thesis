library(rgdal)
library(pastecs)
library(e1071)
#TESTING 25082022

library(tidyverse)
library(caret)
setwd("D:/FIT/IV Sem/Master thesis/Data/Modelling/Random_forest")

SOC_1611 <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Ground_samples_161120/SOC_only.shp")
SOC_1611

hist(SOC_1611$SOC, main = "", xlab = "SOC%")

boxplot(SOC_1611$SOC, horizontal = TRUE)
stripchart(SOC_1611$SOC, method = "jitter", pch = 19, add = TRUE, col = "grey",)

hist(SOC_1611$SOC, prob = TRUE,
     col = "white",
     main = "", xlab = "SOC%")

#Add a new plot
par(new =TRUE)

#Boxplot
boxplot(SOC_1611$SOC,horizontal = TRUE, axes = FALSE,
        col = rgb(0, 0.8, 1, alpha = 0.5))
box()


x <- stat.desc(SOC_1611$SOC)
plot(x)
skewness(SOC_1611$SOC)
kurtosis(SOC_1611$SOC)

#test2402203
ggplot(SOC_1611$SOC, aes(x = x)) + 
  geom_histogram(aes(y = ..density..),
                 colour = 1, fill = "white") +
  geom_density(lwd = 1, colour = 4,
               fill = 4, alpha = 0.25)


y <- boxplot(SOC_1611$SOC, horizontal=TRUE, axes=FALSE, add=TRUE, axis(side=1, at=seq(min(x),max(x),length.out=5), labels=TRUE))
plot(y)
