
#------------------------------ Twitter Sentiment Analysis -----------------------------------------

#read csv file tweets.csv as tweets_raw
tweets_raw = read.csv("file:///U:/AVINASH/EDX/Verzeo_ML/tweets.csv",stringsAsFactors = FALSE)
# examine the structure of the tweets data
str(tweets_raw)
head(tweets_raw)
# examine the "label" variable and vizualizing it
tweets_raw$label<-factor(tweets_raw$label)
library(descr)
str(tweets_raw$label)
table(tweets_raw$label)
freq(tweets_raw$label)

# build a corpus using the text mining (tm) package
library(tm)
#coverting text to corpus.
tweets_corpus<-VCorpus(VectorSource(tweets_raw$tweet))
#A  corpus is fully kept in memory and thus
#all changes only affect the corresponding R object.
# examining  the corpus
print(tweets_corpus)
inspect(tweets_corpus[1:3])
as.character(tweets_corpus[[1]])
lapply(tweets_corpus[1:3],as.character)

# clean up the corpus using tm_map()
#converting all upper case letters(if exist) to lower
tweets_corpus_clean<-tm_map(tweets_corpus,content_transformer(tolower))

# removing numbers
tweets_corpus_clean<-tm_map(tweets_corpus_clean,removeNumbers)

# removing stopwords
tweets_corpus_clean<-tm_map(tweets_corpus_clean,removeWords,stopwords())

# removing punctuation
tweets_corpus_clean<-tm_map(tweets_corpus_clean,removePunctuation)

lapply(tweets_corpus[1:3], as.character)

library(SnowballC)

tweets_corpus_clean<-tm_map(tweets_corpus_clean,stemDocument)

as.character(tweets_corpus[[1]])
as.character(tweets_corpus_clean[[1]])

# eliminating unwanted white space
tweets_corpus_clean<-tm_map(tweets_corpus_clean,stripWhitespace)

# examine final clean  corpus
lapply(tweets_corpus[1:3],as.character)
lapply(tweets_corpus_clean[1:3],as.character)

# Creating document - term sparse matrix
tweets_dtm<-DocumentTermMatrix(Corpus(VectorSource(tweets_corpus_clean)))
class(tweets_dtm)
as.character(tweets_dtm[[1]])

# Creating training and test data set
library(caTools)
set.seed(1)

split<-sample.split(tweets_dtm, SplitRatio = 0.75)
tweets_dtm_train<-subset(tweets_dtm, split == TRUE)
tweets_dtm_test<-subset(tweets_dtm, split == FALSE)

# Create training and test data sets for label
tweets_train_labels<-tweets_raw[1:21308,]$label
tweets_test_labels<-tweets_raw[21309:31962,]$label

# Check that the proportion of hate tweets
prop.table(table(tweets_train_labels))
prop.table(table(tweets_test_labels))

# word cloud visualization
library(wordcloud)
library(NLP)
wordcloud(tweets_corpus, min.freq = 100, random.order = FALSE)

# subset the training data into Normal and Abnormal groups
Normal_tweets <- subset(tweets_raw, label == 0)
Hate_tweets  <- subset(tweets_raw, label == 1)

# vizualization
wordcloud(Normal_tweets$tweet, max.words = 100, scale = c(3, 0.5))
wordcloud(Hate_tweets$tweet, max.words = 100, scale = c(3, 0.5))

tweets_dtm2<-DocumentTermMatrix(tweets_corpus, control = list(tolower = T, removeNumbers = T, stopwords = T, ramovePunctuation = T, stemming = T))
class(tweets_dtm2)
# splitting
tweets_dtm_train <- tweets_dtm2[1:21308,]
tweets_dtm_test<-tweets_dtm2[21309:31962,]

#Remove Sparse terms
tweets_dtm_freq_train <- removeSparseTerms(tweets_dtm_train, 0.999)
tweets_dtm_freq_train

# save frequently-appearing terms to a character vector
findFreqTerms(tweets_dtm_train,5)
tweets_freq_word<-findFreqTerms(tweets_dtm_train,25)
str(tweets_freq_word)

# create DTMs with only the frequent terms
tweets_dtm_freq_train <- tweets_dtm_train[ , tweets_freq_word]
tweets_dtm_freq_test <- tweets_dtm_test[ , tweets_freq_word]

# convert counts to a factor
convert_counts <- function(x)
{
  x <- ifelse(x > 0, "Yes", "No")
}

# apply() convert_counts() to columns of train/test data
# Takes time...
tweets_train <- apply(tweets_dtm_freq_train, MARGIN = 2, convert_counts)
tweets_test  <- apply(tweets_dtm_freq_test, MARGIN = 2, convert_counts)

# Training a model on the data ----
library(e1071)
tweets_classifier <- naiveBayes(tweets_train, tweets_train_labels)

#Evaluating model performance ---- 
# Takes long time
tweets_test_pred <- predict(tweets_classifier, tweets_test)

library(gmodels)
CrossTable(tweets_test_pred, tweets_test_labels,
           prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE,
           dnn = c('predicted', 'actual'))

# Improving model performance ----
tweets_classifier2 <- naiveBayes(tweets_train, tweets_train_labels, laplace = 1)
# Prediction takes long time for better accuracy
tweets_test_pred2 <- predict(tweets_classifier2, tweets_test)
CrossTable(tweets_test_pred2, tweets_test_labels,
           prop.chisq = F, prop.t = F, prop.r = F,
           dnn = c('predicted', 'actual'))

