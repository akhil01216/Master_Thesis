

library("raster")
library("rgdal")
library("RStoolbox") 
library("ggplot2")
library("readtext")
library("methods")
library("jpeg")
library("XML")
library("psych")
library("corrplot")


setwd("D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104")

#introducing downloaded data

S2A_0104 <- "D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output"


#reading the metadata files

MD_0104 <-xmlParse(file = "D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/L1C_T33UVU_A024944_20200401T102432/S2A_MSIL1C_20200401T102021_N0209_R065_T33UVU_20200401T123732.SAFE/MTD_MSIL1C.xml")

MD_0104 <- readMeta("D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/L1C_T33UVU_A024944_20200401T102432/S2A_MSIL1C_20200401T102021_N0209_R065_T33UVU_20200401T123732.SAFE/MTD_MSIL1C.xml",raw = TRUE)


#printing the metadata

MD_0104

#import SOC shape file

SOC_1611 <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Ground_samples_161120/SOC_only.shp")

plot(SOC_1611)
summary(SOC_1611)


#introducing data after pre-processing


B1 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B01.tif')
B2 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B02.tif')
B3  <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B03.tif')
B4  <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B04.tif')
B5  <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B05.tif')
B6 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B06.tif')
B7 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B07.tif')
B8  <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B08.tif')
B9 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B09.tif')
B10 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B10.tif')
B11 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B11.tif')
B12 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104/Preprocessing_output/RT_T33UVU_20200401T102021_B12.tif')

Sentinel0604 <- raster('D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel2B/Sent_RCS.tif')



#croping according to the aoi
AOI <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Dr.Grahmann/Shape files/Basic Structure/AOI_32633.shp")

plot(AOI)
B1_crop <- crop(B1, AOI)
B2_crop <- crop(B2, AOI)
B3_crop <- crop(B3, AOI)
B4_crop <- crop(B4, AOI)
B5_crop <- crop(B5, AOI)
B6_crop <- crop(B6, AOI)
B7_crop <- crop(B7, AOI)
B8_crop <- crop(B8, AOI)
B9_crop <- crop(B9, AOI)
B10_crop <- crop(B10, AOI)
B11_crop <- crop(B11, AOI)
B12_crop <- crop(B12, AOI)

Sen_crop <- crop(Sentinel0604, AOI)
plot(Sen_crop)
writeRaster(Sen_crop, "Sentinel0604_RGB.tif" )



B1 <- mask(B1_crop, AOI)
B2_blue <- mask(B2_crop, AOI)
B3_green <- mask(B3_crop, AOI)
B4_red   <- mask(B4_crop, AOI)
B5_REdge <- mask(B5_crop, AOI)
B6 <- mask(B6_crop, AOI)
B7 <- mask(B7_crop, AOI)
B8_NIR   <- mask(B8_crop, AOI)
B9 <- mask(B9_crop, AOI)
B10 <- mask(B10_crop, AOI)
B11_SWIR <- mask(B11_crop, AOI)
B12 <- mask(B12_crop, AOI)

getwd()
setwd("D:/FIT/IV Sem/Master thesis/Data/Modelling/Sentinel0104")
getwd()

writeRaster(B1, "B1.tif")
writeRaster(B2_blue, "B2.tif")
writeRaster(B4_red, "B4.tif")
writeRaster(B3_green, "B3.tif")
writeRaster(B5_REdge, "B5.tif")
writeRaster(B8_NIR, "B8.tif")

writeRaster(B6, "B6.tif")
writeRaster(B7, "B7.tif")
writeRaster(B9, "B9.tif")
writeRaster(B10, "B10.tif")
writeRaster(B11, "B11.tif")
writeRaster(B12, "B12.tif")

B2_blue
B3_green
B4_red
B5_REdge
B8_NIR
B11_SWIR


plot(B2_blue)
plot(B3_green)
plot(B4_red)  
plot(B5_REdge)
plot(B8_NIR)
plot(B11_SWIR)
plot(B1)
plot(B2)
plot(B6)


#NDVI

NDVI_0104 <- (B8_NIR - B4_red)/(B8_NIR + B4_red)

NDVI_0104
ggR(NDVI_0104)
plot(NDVI_0104)

writeRaster(NDVI_0104, "NDVI.tif")

#Colour Index (CI)

CI_0104 <- (B4_red - B3_green) / (B4_red + B3_green)

CI_0104
ggR(CI_0104)
plot(CI_0104)

writeRaster(CI_0104, "CI.tif")


#Infrared Percentage Vegetation Index(IPVI)

IPVI_0104 <- 1/2 * (NDVI_0104 + 1)

IPVI_0104
ggR(IPVI_0104)
plot(IPVI_0104)

writeRaster(IPVI_0104, "IPVI.tif")


#Normalized Difference Red Edge (NDRE) ERROR found due to resolution b8-b5 / b8+b5

NDRE_0104 <- (B8_NIR - B5_REdge) / (B8_NIR + B5_REdge)

NDRE_0104
ggR(NDRE_0104)
plot(NDRE_0104)

writeRaster(NDRE_0104, "NDRE.tif")


#Soil Adjusted Vegetation Index (SAVI)

SAVI_0104 <- ((B8_NIR - B4_red) * (1 + 0.5)) / (B8_NIR - B4_red + 0.5)

SAVI_0104
ggR(SAVI_0104)
plot(SAVI_0104)

writeRaster(SAVI_0104, "SAVI.tif")


#Green Normalized Difference vegetation Index (GNDVI)

GNDVI_0104 <- (B8_NIR - B3_green) / (B8_NIR + B3_green)

GNDVI_0104
ggR(GNDVI_0104)
plot(GNDVI_0104)

writeRaster(GNDVI_0104, "GNDVI.tif")


#Difference vegetation index (DVI)

DVI_0104 <- (B8_NIR - B4_red)

DVI_0104
ggR(DVI_0104)
plot(DVI_0104)


writeRaster(DVI_0104, "DVI.tif")


#Brightness Index (BI)

BI_0104 <- (sqrt((B4_red*B4_red)+(B3_green*B3_green)))/2

BI_0104
ggR(BI_0104)
plot(BI_0104)

writeRaster(BI_0104, "BI.tif")

#Vegetation (V)

VI_0104 <- B8_NIR/B4_red

VI_0104
ggR(VI_0104)
plot(VI_0104)

writeRaster(VI_0104, "VI.tif")

summary(VI_0104)

#Bare Soil Indes (BSI)

BSI_0104 <- ((B4_red+B11_SWIR)-(B8_NIR+B2_blue))/((B4_red+B11_SWIR)+(B8_NIR+B2_blue))

BSI_0104
ggR(BSI_0104)
plot(BSI_0104)

writeRaster(BSI_0104, "BSI.tif")


#layer stacking

S_indices = c("VI.tif", "BI.tif", "DVI.tif", "GNDVI.tif", "SAVI.tif", "NDRE.tif", "IPVI.tif", "CI.tif", "NDVI.tif", "BSI.tif",
              "B2.tif", "B3.tif", "B4.tif", "B5.tif", "B6.tif", "B7.tif", "B8.tif", "B11.tif", "B12.tif") 
raster_stack = stack(S_indices)

raster_stack

summary(raster_stack)

plot(raster_stack)


#Extract raster value by points

rasValue <- extract(raster_stack, SOC_1611)

summary(rasValue)


#Extract raster value by points indices 

Sent_Data <- extract(raster_stack, SOC_1611, sp = 1, method = "simple")
summary(Sent_Data)


#Combine raster values with point and save as a CSV file

#combinePointValue <- cbind(SOC_1611,rasValue)

#summary(combinePointValue)
#plot(combinePointValue)

writeOGR(combinePointValue, dsn = '.', layer = 'SOC_with_SIndices_bands', driver = "ESRI Shapefile")

#inroducing the new CSV file

#Sent_Data <- read.csv("Sentinel_Indices_bands_SOC.csv", header = TRUE, sep = ",")


#Correlation matrices

Sent_Data.cor = cor(Sent_Data)
corrplot(Sent_Data.cor,  type = 'upper', order = 'hclust', method = 'circle', order ='AOE',)

###############MODELLING#####################

library(devtools)
library(ithir)
library(raster)
library(rgdal)
library(sp)
library(randomForest)


str(Sent_Data)

set.seed(131)
training <- sample(nrow(Sent_Data), 0.7 * nrow(Sent_Data))

# fit the model
Sent_RF_Exp <- randomForest(SOC ~ VI + BI + DVI + GNDVI + SAVI + NDRE + IPVI + CI + NDVI + BSI + B2 + 
                              B3 + B4 + B5 + B6 + B7 + B8 + B11 + B12, data = Sent_Data[training,],
                            importance = TRUE, nodesize = 7, maxnodes = 30, ntree = 120, mtry = 19)

#print(Sent_RF_Exp)

#varImpPlot(Sent_RF_Exp)
#importance(Sent_RF_Exp)


# Internal validation
RF.pred.C.Sent <- predict(Sent_RF_Exp, newdata = Sent_Data[training, ])
goof(observed = Sent_Data$SOC[training], predicted = RF.pred.C.Sent)

# External validation
RF.pred.V.Sent <- predict(Sent_RF_Exp, newdata = Sent_Data[-training, ])
goof(observed = Sent_Data$SOC[-training], predicted = RF.pred.V.Sent)


map.RF.Sentinel <- predict(raster_stack, Sent_RF_Exp, "SOC_from_sentinel_veriables.tif",
                     format = "GTiff", datatype = "FLT4S", overwrite = TRUE)       

plot(map.RF.Sentinel)                     
summary(V_Data)                     

#import SOC shape file

SOC_1611 <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Ground_samples_161120/SOC_only.shp")
plot(SOC_1611) 

#Extract raster value by points

Ext_Sentinel_pred <- extract(map.RF.Sentinel, SOC_1611)
summary(Ext_Sentinel_pred)
plot(Ext_Sentinel_pred)

#Combine raster values with point and save as a CSV file

combinePointValue_Sent <- cbind(SOC_1611,Ext_Sentinel_pred)

summary(combinePointValue_Sent)
plot(combinePointValue_Sent)
names(combinePointValue_Sent)



writeOGR(combinePointValue_Sent, dsn = '.', layer = 'Sentinel_SOC_extracted_prediction', driver = "ESRI Shapefile")



