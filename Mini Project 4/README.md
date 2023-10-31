# Mini Project 4 - Classification and Clustering in R

This R script is part of Mini Project 5 and deals with classification and clustering tasks using the `bankloan` dataset.

## Data Loading and Splitting
- The script starts by reading the `bankloan` dataset from a CSV file.
- The data is then split into training and test sets using the `sample.split` function from the `caTools` library.

## Part A - Logistic Regression
- In this section, logistic regression is applied to predict the "default" variable.
- The script fits a logistic regression model, summarizes it, and makes predictions.
- A confusion matrix is created and visualized using the `CrossTable` function from the `gmodels` library.

## Part B - K-Means Clustering
- K-Means clustering is performed on a subset of columns from the dataset.
- The script uses the `kmeans` function to cluster the data into 4 clusters.

## Part C - Predictions and Confusion Matrix
- Predictions are made for the logistic regression model, and a confusion matrix is generated.

## Part D - Bagging and Comparison with Logistic Regression
- The script employs bagging as an ensemble method for classification.
- Libraries such as `adabag`, `ada`, and `ipred` are loaded to facilitate bagging.
- A bagging model is created and summarized.

## Dependencies
- The script utilizes various R libraries, including `caTools`, `gmodels`, `adabag`, `ada`, and `ipred`. Ensure that these libraries are installed in your R environment.

## Usage
- The script can be executed in an R environment. It demonstrates classification using logistic regression and ensemble methods like bagging. It also includes K-Means clustering.

For any questions or further details, please refer to the code and comments provided in the script.
