# -*- coding: utf-8 -*-
"""
Created on Fri Jun  1 12:50:09 2018

@author: Avinash
"""
# A)
import pandas as pd
grades = pd.read_csv("U:\AVINASH\EDX\Verzeo_ML\grades.csv")
grades.head()
# a) t-test 
import scipy
scipy.stats.ttest_ind(grades.quiz1,grades.quiz2)

# b) ANOVA
import statsmodels.api as sm
from statsmodels.formula.api import ols
mod = ols('quiz1~quiz2', data = grades).fit()
aov_table = sm.stats.anova_lm(mod, type = 2)
print(aov_table)

# c) CHI Squared test
pd.crosstab(grades.quiz1, grades.quiz2, margins = True)
arr = pd.crosstab(grades.quiz1, grades.quiz2, margins = True)
scipy.stats.chi2_contingency(arr)

# B)
#call the decision tree
from sklearn.tree import DecisionTreeClassifier 
dtree = DecisionTreeClassifier()
grades
ethnicity = pd.DataFrame(grades,columns = grades.ethnicity)
final = grades.final
from sklearn.cross_validation import train_test_split
x_train, x_test, y_train, y_test = train_test_split(ethnicity, final, test_size = .4)
x_train
from sklearn.tree import DecisionTreeClassifier 
dtree = DecisionTreeClassifier()
dtree.fit(x_train,y_train)
