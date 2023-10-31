#-------Mini Project 5-----------

# ---DATASET IS CLASSIFICATION Bankloan DATA SET & TARGET VARIABLE IS 'DEFAULT'
bl = read.csv("U:/AVINASH/EDX/Verzeo_ML/bankloan.csv")

library(caTools)
split = sample.split(bl$default,SplitRatio = 0.7)
train <- subset(bl, split == T)
test <- subset(bl, split == F)

# A) ------ Logistic Regression -----------
model <- glm(default~., data=train, family = binomial)
summary(model)
predictTrain <- predict(model, newdata = test)
library("gmodels")
CrossTable(test$default, predictTrain >= 0.5, prop.chisq = F, prop.c = F, prop.r = F, dnn = c("actual default","predicted default"))

# B) ---------- K Means --------------------
bcluster<-kmeans(bl[,3:5],4,nstart = 20)

# C) ------ PREDICT and COnfusion Matrix
prd<-predict(model,type="response")
table(train$default,prd>0.5)

# D)------BAGGING AND COMPARE THE RESULT WITH LOGISTIC REGRESSION-----

library(adabag)
library(ada)
library(ipred)
fitb<-bagging(default~.,data = train)
summary(fitb)
