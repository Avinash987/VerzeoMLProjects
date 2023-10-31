# Mini Project 1 - Exploratory Data Analysis with mtcars Dataset

This mini project involves performing an exploratory data analysis on the `mtcars` dataset, which is readily available in R. The code provided demonstrates various data analysis and visualization techniques to gain insights into the dataset.

## Data Overview
- The code starts by displaying the first 6 and last 6 observations of the `mtcars` dataset using `head` and `tail`.
- It uses `dim` to show the number of observations and variables in the dataset.

## Data Summary
- The `descr` and `summary` functions are used to provide a summary of the dataset.

## Data Visualization
- Histograms and boxplots are created for specific variables (`mpg` and `wt`) to visualize their distributions.
- Barplots are generated to explore the relationships between variables (`am` and `gear`, `gear` and `carb`).

## Frequency Analysis
- The `freq` function is used to calculate the frequency of observations for specific variables (`am`, `gear`, and `carb`).

## Cross-Tabulation
- The `CrossTable` function from the `gmodels` library is employed to create cross-tabulations of variables (`am` vs. `gear`, `gear` vs. `carb`).

## Covariance and Correlation
- The `cov` and `cor` functions are used to calculate the covariance and correlation matrices of the dataset.

## Sorting Data
- Data is sorted and ordered using the `by` function, which provides insights into how variables relate to each other.

## Dependencies
- The code uses standard R functions and libraries such as `descr` and `gmodels` for statistical analysis and visualization. Ensure that these packages are installed.

## Usage
- The code can be executed in an R environment, and it provides a step-by-step walkthrough of the exploratory data analysis of the `mtcars` dataset.

This mini project is meant to showcase basic data analysis techniques and is a useful starting point for those looking to explore a dataset using R.

For any questions or further details, please refer to the code and comments provided in the script.
