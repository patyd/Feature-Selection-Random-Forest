dataset <- read.csv("BreastCancer.csv", sep = ';')
summary(dataset)

#---- Random Forest ----
library(randomForest)
set.seed(123)

# Run Random Forest with default parameters
rf <- randomForest(Diagnosis~.,
                   data= dataset)

# Choose the number of trees based on error
plot(rf)

# Choose the best mtry
t <- tuneRF(dataset[,-31], dataset[,31],
            stepFactor = 0.5,
            plot = TRUE,
            ntreeTry = 500,
            trace = TRUE,
            improve = 0.05)

# Run the random forest
rf <- randomForest(Diagnosis~.,
                   data= dataset,
                   ntree = 500,
                   mtry = 5,
                   importance = TRUE,
                   proximity = TRUE)

# Sumarize the results
importance(rf, type = 2)

# Plot the results
varImpPlot(rf, type = 2, main = "Feature Importance - RF")

#---- Recursive Feature Elimination - Random Forest ----
library(mlbench)
library(caret)
set.seed(7)

# Generate a control object using Random Forest as selected function
control <- rfeControl(functions=rfFuncs, method="cv", number=10)

# RFE algorithm
rfe_results <- rfe(dataset[,1:30], dataset[,31], sizes=c(1:30), rfeControl=control)

# Summarize the results
print(rfe_results)

# Chosen features
predictors(rfe_results)

# Plot the results
plot(rfe_results, type=c("o"), main = "Feature Importance - RFE - RF")


#----- Correlation Matrix ---
set.seed(7)

# Calculate correlation matrix
correlationMatrix <- cor(dataset[,-31], dataset[,-31] )

# Summarize the correlation matrix
print(correlationMatrix)

# Find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)

# Print indexes of highly correlated attributes
print(highlyCorrelated)
