library(recommenderlab)

# The Book ratings dataset contains 3 columns - userid, ISBN and rating fields. 
# They are separated by a semicolon and contains around 5lakh records


book_ratings <- read.csv("C:\\Users\\Bala\\Documents\\books\\BX-Book-Ratings.csv", sep = ";")


dim(book_ratings)

#[1] 493813      3


head(book_ratings)

# User.ID   ISBN        Book.Rating
# 276725 034545104X           0
# 276726 0155061224           5
# 276727 0446520802           0


# To check if the dataset has any NA values

anyNA(book_ratings)

# FALSE
# The dataset does not contain any NA values


#Book_ratings is a data frame. to proceed further, we have to convert it into a realRatingMatrix as below. 

book_matrix <- as(book_ratings, "realRatingMatrix")

book_matrix


# 44778 x 204680 rating matrix of class 'realRatingMatrix' with 493813 ratings.


######################## Exploring Data ###########################

#view transformed data

image(book_matrix[1:100,])


# Extract a sample from ratings matrix

sample_ratings <-sample(book_matrix,1000)


# Get the mean product ratings as given by first few users

#For each userid , the mean ratings are fetched here

rowMeans(sample_ratings[1:10,])


# Get distribution of item ratings

# For a sample of 1000 ratings, here is the histogram
# For this sample we can see the users have ratings from 5 to 10. there are not much tasks from 1 to 4

hist(getRatings(sample_ratings), breaks=100,xlab = "Product Ratings",
     main = " Histogram of Book Ratings")


# Get distribution of normalized item ratings

hist(getRatings(normalize(sample_ratings)),breaks=100, 
     xlab = "Normalized Book Ratings", main = " Histogram of Normalized Book Ratings")


# Number of items rated per user

hist(rowCounts(sample_ratings),breaks=50,xlab = 
       "Number of Products", main = " Histogram of Rated Products Distribution")

# The plots can be viewed in the Observations folder
