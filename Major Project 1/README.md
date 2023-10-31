# Twitter Sentiment Analysis

This project focuses on sentiment analysis of Twitter data using R programming. The code provided below takes you through the entire process of loading, preprocessing, and analyzing Twitter data to classify tweets into different sentiment categories.

## Data Preparation
- The code starts by reading a CSV file named `tweets.csv` and examining its structure.
- It converts the text data to lowercase, removes numbers, stopwords, and punctuation.
- Stemming is applied to further clean the text data.
- Unwanted white spaces are eliminated.

## Creating Document-Term Sparse Matrix
- The project creates a Document-Term Matrix (DTM) to represent the text data.
- It splits the data into training and test sets.

## Sentiment Analysis
- The sentiment of tweets is classified into two categories: Normal and Abnormal (Hate tweets).
- Word clouds are generated to visualize frequently appearing words in both categories.
- A Naive Bayes classifier is trained to predict the sentiment of tweets.

## Evaluation and Model Improvement
- Model performance is evaluated using a confusion matrix.
- Model improvement is attempted by adjusting Laplace smoothing.

## Dependencies
- The code uses various R packages, including `tm`, `SnowballC`, `caTools`, `wordcloud`, `NLP`, `e1071`, and `gmodels`. Make sure to install these packages if not already installed.

## Usage
- The code can be run in an R environment after loading the necessary libraries and providing the `tweets.csv` dataset.

## Project Showcase
This project is intended to demonstrate the process of sentiment analysis on Twitter data using R. The code provided serves as a guide for performing similar sentiment analysis tasks.

For any questions or further details, please refer to the code and comments provided in the script.
