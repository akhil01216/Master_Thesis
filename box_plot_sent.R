


Sent_points <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Results/New_results_1709/points_sent/Sent_pred_pints_values.shp")
plot(Veris_points)

summary(Sent_points$RASTERVALU)

boxplot(Sent_points[Sent_points$Patch_id_1 == 19,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 12,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 20,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 13,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 21,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 39,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 40,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 49,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 50,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 51,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 58,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 59,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 60,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 65,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 66,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 68,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 73,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 74,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 76,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 81,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 89,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 90,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 95,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 96,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 102,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 105,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 110,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 114,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 115,]$RASTERVALU,
        Sent_points[Sent_points$Patch_id_1 == 119,]$RASTERVALU,
        xlab="patch ID",ylab="SOC%",main="Boxplot of patches SOC% prediction using Sentinel 2A",
        cex.lab = 1,
        cex.axis = 1,
        cex.main = 1.5,
        cex.sub = 1,
        las = 2,
        names = c("19", "12", "20", "13", "21","39", "40", "49", "50", "51","58", "59", "60", "65", "66","68", "73", "74", "76",
                  "81","89", "90", "95", "96", "102","105", "110", "114", "115", "119"))

 

#------------------------Veris MSP3 Histogram -----------------------------------------#

Veris_points <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Results/New_results_1709/points_veris/Veris_pred_values_in_points.shp")
plot(Veris_points)


summary(Veris_points$RASTERVALU)

boxplot(Veris_points[Veris_points$Patch_id_1 == 19,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 12,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 20,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 13,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 21,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 39,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 40,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 49,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 50,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 51,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 58,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 59,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 60,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 65,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 66,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 68,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 73,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 74,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 76,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 81,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 89,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 90,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 95,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 96,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 102,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 105,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 110,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 114,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 115,]$RASTERVALU,
        Veris_points[Veris_points$Patch_id_1 == 119,]$RASTERVALU,
        xlab="patch ID",ylab="SOC%",main="Boxplot of patches SOC% prediction using Veris MSP3",
        cex.lab = 1,
        cex.axis = 1,
        cex.main = 1.5,
        cex.sub = 1,
        las = 2,
        names = c("19", "12", "20", "13", "21","39", "40", "49", "50", "51","58", "59", "60", "65", "66","68", "73", "74", "76",
                  "81","89", "90", "95", "96", "102","105", "110", "114", "115", "119"))

#-------------------Soil sampling boxplot -------------------


Soil_samples <- readOGR("D:/FIT/IV Sem/Master thesis/Data/Modelling/Results/New_results_1709/points_sampling3/soil_sampling_3_points.shp")
head(Soil_samples)


boxplot(Soil_samples[Soil_samples$Patch_id_1 == 19,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 12,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 20,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 13,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 21,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 39,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 40,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 49,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 50,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 51,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 58,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 59,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 60,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 65,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 66,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 68,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 73,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 74,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 76,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 81,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 89,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 90,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 95,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 96,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 102,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 105,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 110,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 114,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 115,]$SOC,
        Soil_samples[Soil_samples$Patch_id_1 == 119,]$SOC,
        xlab="patch ID",ylab="SOC%",main="Boxplot of patches SOC% using soil sampling 3",
        cex.lab = 1,
        cex.axis = 1,
        cex.main = 1.5,
        cex.sub = 1,
        las = 2,
        names = c("19", "12", "20", "13", "21","39", "40", "49", "50", "51","58", "59", "60", "65", "66","68", "73", "74", "76",
                  "81","89", "90", "95", "96", "102","105", "110", "114", "115", "119"))
