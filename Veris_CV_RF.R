#load libraries
library(rpart)
library(randomForest)
library(rfUtilities)
library(raster)
library(rgdal)


#TESTING 25082022

library(tidyverse)
library(caret)

#Setting work directory
setwd("D:/FIT/IV Sem/Master thesis/Data/Modelling/Random_forest")


#importing shape files
SOC_1611 <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Ground_samples_161120/SOC_only.shp")
summary(SOC_1611)

#importing raster data(covariates)
V_variables = c("IR.tif", "Red.tif","pH.tif","Shallow_EC.tif","Deep_EC.tif") 
Stack_V = stack(V_variables)
plot(Stack_V)

#Extract raster value by points indices 

V_Data <- extract(Stack_V, SOC_1611, sp = 1, method = "simple")
V_Data <- as.data.frame(V_Data)
plot(V_Data)
str(V_Data)
summary(V_Data)

#partitioning data into training and testing
set.seed(123)
inTrain <- createDataPartition(V_Data$SOC, p = 0.8, list = FALSE)
training <- V_Data[inTrain, ]
test <- V_Data[-inTrain, ]

#evaluate variable importance
varImp(rf_fit)
importance(rf_fit$finalModel)

#fit regression model
set.seed(123)
system.time(rf_fit <- train(SOC ~ Red + pH + Shallow_EC + Deep_EC, data = training, method = 'rf', importance = TRUE,
                            ntree = 100,  trControl = trainControl(method = 'cv', number = 10)))
rf_fit
plot(rf_fit)
print(rf_fit)

#test


# Print the best hyperparameters
print(model$bestTune)


#evaluate model performance on the test data
ranger_RMSE <- sqrt(mean((test$SOC - predict(rf_fit, test))^2))
ranger_RMSE



Veris_Pr_CV <- predict(Stack_V, rf_fit, "Veris_pred_02.tif",
                     format = "GTiff", datatype = "FLT4S", overwrite = TRUE)       

plot(Veris_Pr_CV)  


#Extract raster value by points ERROR

Ext_Veris_pred <- extract(Veris_Pr_CV, SOC_1611)


#Combine prediction and actual values

combinePointValue <- cbind(SOC_1611,Ext_Veris_pred)
plot(combinePointValue)

#Setting Df and changing column nmaes

Pred_Act_Veris <- as.data.frame(combinePointValue)
names(Pred_Act_Veris) <- c('Actual', 'x', 'y', 'Predicted')
names(Pred_Act_Veris)

write.csv(Pred_Act_Veris, "D:/FIT/IV Sem/Master thesis/Data/Modelling/Random_forest/Pred_Act_Veris.csv")



#test plot
ggplot(Pred_Act_Veris,                                     # Draw plot using ggplot2 package
       aes(x = Actual,
           y = Predicted,
       )) +
  geom_point() +
  geom_smooth(method ="lm", se = F) +
  labs( x = "Observed SOC%", y = "Predicted SOC%")+
  geom_text(aes( x=0.65, y=1.3 ,label="RMSE : 0.11 \n R² : 0.68")) +
  ggtitle("Veris MSP3 Prediction Vs Observed SOC %")




writeOGR(Pred_Act_Veris, dsn = '.', layer = 'Veris_SOC_Actual_Pred', driver = "ESRI Shapefile")


#import predicted SOC shape file

SOC_Pred_Veris <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Random_forest/Veris_SOC_extracted_prediction.shp")
summary(SOC_Pred_Veris)

#find out equation

lm(combinePointValue$SOC~combinePointValue$c.0.84284895658493..0.804490447044373..0.860086262226105..0.857171654701233..)


##----------------------boxplot-------------------##


Veris_pred <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Results/New_results_1709/Veris_patches_prediction.tif')
plot(Veris_pred)

patches <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Dr.Grahmann/Shape files/Basic Structure/patches_30.shp")
plot(patches)

extract(Veris_pred, patches, fun=NULL, na.rm=FALSE, exact=FALSE, weights=FALSE,  
        normalizeWeights=TRUE, cellnumbers=FALSE, small=TRUE, df=FALSE, layer, nl, 
        factors=FALSE, sp=FALSE, ...)





