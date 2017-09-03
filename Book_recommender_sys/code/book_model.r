############### Prepare Recommendation Model and Predict ##################

###### Create 'User Based collaborative filtering' model 

ubcf_recommender <- Recommender(book_matrix[1:1000], method="UBCF",
                                param = list(normalize = "Z-score", method = "Cosine"))  

ubcf_recommender

# Predict list of product which can be recommended to given users

recommendations <- 
  recommenderlab::predict(ubcf_recommender, book_matrix[1001:1050], n=5)

# show recommendation in form of the list

recom <- as(recommendations, "list")

recom

############### Testing of the recommender algorithm ##################

# Evaluation scheme - Split data in train, test

eval_scheme <- evaluationScheme(book_matrix[1:1000],
                                method="split",train=0.8, given=1)

eval_scheme

# Evaluation scheme with 1 items given
# Method: ‘split’ with 1 run(s).
# Training set proportion: 0.800
# Good ratings: NA
# Data set: 1000 x 204680 rating matrix of class ‘realRatingMatrix’ with 7083 ratings.

# Train model using UBCF

book_training <- Recommender(getData(eval_scheme, "train"), "UBCF")

book_training
  
# Recommender of type ‘UBCF’ for ‘realRatingMatrix’ 
# learned using 800 users.
  
# UBCF Predictions on Test data

test_rating1 <- predict(book_training, getData(eval_scheme,"known"), type = "ratings")

test_rating1

error1 <- calcPredictionAccuracy(test_rating1, getData(eval_scheme, "unknown"))

error1

