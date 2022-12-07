setwd("G:/giscourse/project/datatoMakemodel/")
data <- read.csv('dataset_toMakemodel.csv' , header = TRUE)

train_data <- data[ which(data$Year!= 2019), ]
test_data <- data[which(data$Year== 2019),]

test_input_var<- c("ndvi","gndvi","evi","Area_planted_Acr_f")
test_input <- test_data[test_input_var]

test_out_var <- c('yield_total_Bu')
test_out <- test_data[test_out_var]
rownames(test_out) <- NULL 
corn_model<- lm(yield_total_Bu~ ndvi+gndvi+evi+Area_planted_Acr_f, data = train_data)
summary(corn_model)

reg_pred = predict(corn_model, newdata = test_input)
plot(residuals(corn_model))
hist(residuals(corn_model))

m = mean(test_out$yield_total_Bu)
rss <- sum((reg_pred - test_out) ^ 2)  
tss <- sum((test_out - m) ^ 2)
rsq <- 1 - rss/tss
#[1] 0.25

l = 1:length(reg_pred)
l2 = length(test_out$yield_total_Bu)
plot(l, reg_pred, col = "blue", pch = 19)
points(l, test_out$yield_total_Bu, col = "red", pch = 19)
legend(x = "top", legend=c("Actual Yield", "Predicted Yield"), 
       fill = c("blue","red"))


mean(abs((test_out$yield_total_Bu - reg_pred)/test_out$yield_total_Bu)) * 100


plot(reg_pred,                                # Draw plot using Base R
     test_out$yield_total_Bu,
     xlab = "Predicted Yield",
     ylab = "Observed Yield")
abline(a = 0,                                        # Add straight line
       b = 1,
       col = "red",
       lwd = 2)
input_var<- c("ndvi","gndvi","evi","Area_planted_Acr_f","yield_total_Bu" )
inp = data[input_var]

cor(inp, use="complete.obs", method="pearson")

install.packages("e1071")
library(e1071)
svm_model <- svm(yield_total_Bu~ ndvi+gndvi+evi+Area_planted_Acr_f, data = train_data )
predicted_svm = predict(svm_model, newdata = test_input)

points(test_out$yield_total_Bu, predicted_svm, col = "green", pch=10)

##Tuning the SVM model

tuneResult<- tune(svm, yield_total_Bu~ ndvi+gndvi+evi+Area_planted_Acr_f, data = train_data,
                      ranges = list(epsilon = seq(0,1,0.1), cost = 2^(2:9))
)
print(tuneResult)
# Draw the tuning graph
plot(tuneResult)


##new SVR model

tunedModel <- tuneResult$best.model
tunedModelY <- predict(tunedModel, test_input )

error <- test_out$yield_total_Bu - tunedModelY

# this value can be different on your computer
# because the tune method  randomly shuffles the data
tunedModelRMSE <- rmse(error)  # 2.219642

points(test_out$yield_total_Bu, tunedModelY, col = "blue", pch=10)


m = mean(test_out$yield_total_Bu)
rss <- sum((predicted_svm - test_out) ^ 2)  
tss <- sum((test_out$yield_total_Bu - m) ^ 2)
rsq_svm <- 1 - rss/tss


rss <- sum((tunedModelY - test_out$yield_total_Bu) ^ 2)  
tss <- sum((test_out$yield_total_Bu - m) ^ 2)
rsq_svm_tuned <- 1 - rss/tss

MAPE_reg = mean(abs((test_out$yield_total_Bu - reg_pred)/test_out$yield_total_Bu)) * 100
MAPE_SVM = mean(abs((test_out$yield_total_Bu - predicted_svm)/test_out$yield_total_Bu)) * 100

MAPE_tuned = mean(abs((test_out$yield_total_Bu - tunedModelY)/test_out$yield_total_Bu)) * 100
ann_pred <- read.csv('ann_pred.csv' , header = TRUE)

rss <- sum((ann_pred$anns - test_out$yield_total_Bu) ^ 2)  
tss <- sum((test_out$yield_total_Bu - m) ^ 2)
rsq_ann <- 1 - rss/tss


MAPE_ANN = mean(abs((test_out$yield_total_Bu - ann_pred$anns)/test_out$yield_total_Bu)) * 100
points(test_out$yield_total_Bu, ann_pred$anns, col = "orange", pch=10)

legend(x = "topleft", legend=c("Actual Yield", "Regression Predicted", "SVM Predicted", "Tuned_SVM Predicted", "ANN Predicted"), 
       fill = c("red","black", "green","blue","orange"))


plot(l, predicted_svm, col = "blue", pch = 19)
points(l, test_out$yield_total_Bu, col = "red", pch = 19)
legend(x = "top", legend=c("Actual Yield", "Predicted Yield"), 
       fill = c("blue","red"))
plot(l, tunedModelY, col = "blue", pch = 19)
points(l, test_out$yield_total_Bu, col = "red", pch = 19)
legend(x = "top", legend=c("Actual Yield", "Predicted Yield"), 
       fill = c("blue","red"))

plot(l, ann_pred$anns, col = "blue", pch = 19)
points(l, test_out$yield_total_Bu, col = "red", pch = 19)
legend(x = "top", legend=c("Actual Yield", "Predicted Yield"), 
       fill = c("blue","red"))
