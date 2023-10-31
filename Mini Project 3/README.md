# Statistical Analysis and Decision Tree Classification

This Python script contains two parts: Part A and Part B, with a focus on statistical analysis and decision tree classification.

## Part A
### Data Loading
- The script starts by loading the `grades` dataset from a CSV file.

### Statistical Tests
- **a) t-test**: It performs an independent two-sample t-test on the "quiz1" and "quiz2" columns.
- **b) ANOVA**: The script conducts analysis of variance (ANOVA) to analyze the relationship between "quiz1" and "quiz2" using the `statsmodels` library.
- **c) CHI-Squared Test**: It computes a chi-squared test on the cross-tabulation of "quiz1" and "quiz2" using `scipy`.

## Part B
### Decision Tree Classification
- In this part, the script focuses on decision tree classification using the `DecisionTreeClassifier` from `sklearn`.

### Data Preprocessing
- It prepares the data for classification, specifically using the "ethnicity" as the independent variable and "final" as the dependent variable.

### Data Splitting
- The data is split into training and test sets using `train_test_split` from `sklearn`.

### Decision Tree Classifier
- A decision tree classifier is created and fitted to the training data.

## Dependencies
- The script relies on several Python libraries, including `pandas`, `scipy`, `statsmodels`, and `sklearn`. Ensure that these libraries are installed in your Python environment.

## Usage
- The script can be executed in a Python environment. It demonstrates statistical analysis, including t-tests, ANOVA, and chi-squared tests, as well as decision tree classification. It can be used as a reference for similar tasks.

For any questions or further details, please refer to the code and comments provided in the script.
