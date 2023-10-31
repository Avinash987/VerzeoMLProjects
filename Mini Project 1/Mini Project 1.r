#------------------------------ MINI PROJECT  1  ---------------------------------
#mtcars is directly available from R Studio need not read it as csv file
# heead displays the first 6  observations
head(mtcars)
# tail displays the last 6  observations
tail(mtcars)
# dim displays the number of observations and variables in the given data set
dim(mtcars)
# import package descr
library(descr)
# descr(describe) gives the summary of given object
descr(mtcars)
# summary is function that produces summaries of results of various model fitting functions
summary(mtcars)
# plot histogram for mpg variable in mtcars dataset
plot(mtcars$mpg, type = "h")
# boxplot for mpg variable in mtcars dataset
boxplot(mtcars$mp)
# plot histogram for wtvariable in mtcars dataset
plot(mtcars$wt, type = "h")
# boxplot for wt variable in mtcars dataset
boxplot(mtcars$wt)
# freq() gives the frequency of the observations of variable am in mtcars
freq(mtcars$am)
# freq() gives the frequency of the observations of variable gear in mtcars
freq(mtcars$gear)
# freq() gives the frequency of the observations of variable carb in mtcars
freq(mtcars$carb)
# import gmodels for CrossTable
library(gmodels)
# CrossTable() of am over gear mtcars  
CrossTable(mtcars$am,mtcars$gear, prop.chisq = FALSE)
# CrossTable() of gear over carb mtcars 
CrossTable(mtcars$gear,mtcars$carb, prop.chisq = FALSE)
# covariance of mtcars
cov(mtcars)
# corellation of mtcars
cor(mtcars)
# barplot for am to gear in mtcars dataset
barplot(mtcars$am,mtcars$gear)
# barplot for gear to carb in mtcars dataset
barplot(mtcars$gear,mtcars$carb)
# order mpg by am
by(mtcars$am,mtcars$mpg,order)
# order mpg by gear
by(mtcars$gear,mtcars$mpg,order)
# order wt by am
by(mtcars$am,mtcars$wt,order)
# order wt by carb
by(mtcars$carb,mtcars$wt,order)
