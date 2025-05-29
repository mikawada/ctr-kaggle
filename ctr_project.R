## Data Loading and Cleaning

library(xgboost)
data <- read.csv('analysis_data.csv')

numeric_cols <- colnames(data)[sapply(data, function(x) class(x)) %in% c('numeric', 'integer')]
numeric_cols <- numeric_cols[!(numeric_cols %in% c("id", "CTR"))]
X <- as.matrix(data[, numeric_cols])
y <- data$CTR

dtrain <- xgb.DMatrix(data = X, label = y)

## Hyperparameter Tuning

params <- list(
objective = "reg:squarederror", 
eta = 0.01,              
max_depth = 4,          
subsample = 0.7,         
colsample_bytree = 0.8,  
lambda = 1,              
alpha = 0.5              
)

## Cross-Validation and Final Model Training

set.seed(1031)
cv_model <- xgb.cv(
params = params, 
data = dtrain, 
nrounds = 1000,      
nfold = 5,            
early_stopping_rounds = 100,  
verbose = 1
)

best_nrounds <- cv_model$best_iteration
cat("Best number of rounds: ", best_nrounds, "\n")
xgb_model <- xgb.train(params, dtrain, nrounds = best_nrounds)

## Prediction

scoring_data <- read.csv('scoring_data.csv')
X_new <- as.matrix(scoring_data[, numeric_cols])
dtest <- xgb.DMatrix(data = X_new)
pred <- predict(xgb_model, dtest)

stopifnot(!any(is.na(pred)))
submission_file <- data.frame(id = scoring_data$id, CTR = pred)
write.csv(submission_file, 'submission_29.csv', row.names = FALSE)