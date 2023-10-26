# -*- coding: utf-8 -*-
"""
Created on Sun May 27 23:37:13 2018

@author: Avinash
"""
#----------------------- PART A-----------------------
import pandas as pd
import numpy as np

from xlrd import open_workbook

mtcars = pd.read_csv("file:///U:/AVINASH/EDX/Verzeo_ML/mtcars.csv")
mtcars = pd.DataFrame(mtcars)
writer = pd.ExcelWriter('mtcars.xlsx')
mtcars.to_excel(writer,'Sheet1')

from sklearn import linear_model
bl = pd.read_csv("file:///U:/AVINASH/EDX/Verzeo_ML/bankloan.csv")
bl = pd.DataFrame(bl)
bl
x =  bl.ix[:,:]
y =  bl.ix[:,6]
# Conduct Multiple Linear Regression
from sklearn.cross_validation import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = .4)

len(x_train)
len(y_train)
#  Regression Equation
from sklearn.linear_model import LinearRegression
LR = LinearRegression()
LR.fit(x_train, y_train)

#  Predict the dependent variable for test dataset
y_predict = LR.predict(x_test)
len(y_predict)
len(y_test)
# f) Create confusion matrix
from sklearn.metrics import confusion_matrix
cnf_mtx = confusion_matrix(y_test, y_predict)
cnf_mtx



#------------------------- PART B -----------------------


# a) Head, Tail, Describe, Shape, Dtypes, Column names

mtcars.head()
mtcars.tail()

mtcars.describe()
mtcars.shape
mtcars.dtypes
list(mtcars.columns.values)

# b) Histogram, Box plot, Density Curve of Losses

import matplotlib.pyplot as plt
mtcars.hist("mpg") 
plt.hist(mtcars.mpg, bins = 'auto')
mtcars.boxplot("mpg")
#__mtcars.density("mpg")

# c) Value_counts of Number of Vehicles, mpg,hp,drat
len(mtcars.model.unique())
len(mtcars.mpg.unique())
len(mtcars.hp.unique())
len(mtcars.drat.unique())

# d) Cross Tabulation of Number of drat and hp
pd.crosstab(mtcars.drat, mtcars.hp, margins = True)

# e) Cross Tabulation of cyl and vs
pd.crosstab(mtcars.cyl, mtcars.vs, margins = True)

# f) Create y & x
from sklearn import linear_model
mtc = mtcars.drop(["model"],1)
mtc
x =  mtc.ix[:,(1,2,3)]
y =  mtc.ix[:,0]
# g) Conduct Multiple Linear Regression
from sklearn.cross_validation import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.4)


len(x_train)
len(y_train)
# f) Regression Equation
from sklearn.linear_model import LinearRegression
LR = LinearRegression()
LR.fit(x_train, y_train)

# g) Predict the dependent variable for test dataset
y_predict = LR.predict(x_test)
len(y_predict)
len(y_test)
# f) Create confusion matrix
from sklearn.metrics import confusion_matrix
cnf_mtx = confusion_matrix(y_test, y_predict)
cnf_mtx


















