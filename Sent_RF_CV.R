
library(rpart)
library(randomForest)
library(rfUtilities)
library(raster)
library(rgdal)
library(tidyverse)
library(caret)

setwd("D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104")

#import SOC shape file

SOC_1611 <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Ground_samples_161120/SOC_only.shp")

plot(SOC_1611)
summary(SOC_1611)


#layer stacking

S_indices = c("VI.tif", "BI.tif", "DVI.tif", "GNDVI.tif", "SAVI.tif", "NDRE.tif", "IPVI.tif", "CI.tif", "NDVI.tif", "BSI.tif",
              "B2.tif", "B3.tif", "B4.tif", "B5.tif", "B6.tif", "B7.tif", "B8.tif", "B11.tif", "B12.tif") 
raster_stack = stack(S_indices)

summary(raster_stack)

plot(raster_stack)

#Extract raster value by points indices 

Sent_Data <- extract(raster_stack, SOC_1611, sp = 1, method = "simple")
summary(Sent_Data)
Sent_Data <- as.data.frame(Sent_Data)


#partitioning data into training_Sent and test_Senting
set.seed(123)
inTrain_Sent <- createDataPartition(Sent_Data$SOC, p = 0.7, list = FALSE)
training_Sent <- Sent_Data[inTrain_Sent, ]
test_Sent <- Sent_Data[-inTrain_Sent, ]

#$randomForest 9package/method) in caret
names(Sent_Data)
#fit regression model
set.seed(123)
system.time(rf_fit_Sent <- train(SOC ~ VI + BI + DVI + GNDVI + SAVI + NDRE + IPVI + CI + NDVI + BSI + B2 + 
                                      B3 + B4 + B5 + B6 + B7 + B8 + B11 + B12, data = training_Sent, 
                                      method = 'rf', trControl = trainControl(method = 'cv', number = 10)))
rf_fit_Sent
plot(rf_fit_Sent)


#evaluate variable importance
varImp(rf_fit_Sent)


#evaluate model performance on the test_Sent data
ranger_RMSE <- sqrt(mean((test_Sent$SOC - predict(rf_fit_Sent, test_Sent))^2))
ranger_RMSE

Sent_Pred <- predict(raster_stack, rf_fit_Sent, "Sent_pred02.tif",
                       format = "GTiff", datatype = "FLT4S", overwrite = TRUE) 

plot(Sent_Pred)


#Extract raster value by points ERROR

Ext_Sent_pred <- extract(Sent_Pred, SOC_1611)


#Combine prediction and actual values

Pred_obser_sent <- cbind(SOC_1611,Ext_Sent_pred)
plot(Pred_obser_sent)

#Setting Df and changing column nmaes

Pred_obser_Senti <- as.data.frame(Pred_obser_sent)
names(Pred_obser_Senti) <- c('Observed', 'x', 'y', 'Predicted')
names(Pred_obser_Senti)

write.csv(Pred_Act_Veris, "D:/FIT/IV Sem/Master thesis/Data/Modelling/Random_forest/Pred_Act_Sent.csv")



ggplot(Pred_obser_Senti,                                     # Draw plot using ggplot2 package
       aes(x = Observed,
           y = Predicted,
       )) +
  geom_point() +
  geom_smooth(method ="lm", se = F) +
  labs( x = "Observed SOC%", y = "Predicted SOC%")+
  geom_text(aes( x=0.65, y=1.3 ,label="RMSE : 0.13 \n R² : 0.57")) +
  ggtitle("Sentinel-2A Prediction Vs Observed SOC %")



