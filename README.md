# Ad CTR Predictive Modeling – Kaggle Competition

## Description
This project was completed as part of a Kaggle competition focused on predicting the Click-Through Rate (CTR) of display advertisements. I explored various supervised learning models and tuned hyperparameters to improve accuracy. My best-performing model was an XGBoost regressor, which achieved a final RMSE of 0.06360, ranking top 25% on the leaderboard after 30 submissions.

## Tools and Technologies Used
- Language: R
- Libraries: xgboost, ranger, caret, randomForest, gbm
- Modeling Techniques: Decision trees, random forests, bagging, boosting, SVMs
- Evaluation Metric: RMSE (Root Mean Squared Error)

## Key Procedures
### 1. Data Preprocessing
- Filtered numeric columns only (excluding titles or string-based features)
- Created feature matrix X and target vector y for CTR prediction
- Addressed missing values and syntax issues during early cleaning

### 2. Model Experimentation
- Compared models including random forests, bagging, boosting, and SVMs
- Found XGBoost to perform best based on cross-validated RMSE

### 3. XGBoost Optimization
- Tuned hyperparameters including eta = 0.01, max_depth = 4, subsample = 0.7, colsample_bytree = 0.8, lambda = 1, alpha = 0.5
- Performed 5-fold cross-validation with early stopping at 100 rounds

### 4. Model Evaluation
- Final XGBoost RMSE: 0.06360
- Improved leaderboard ranking by 96 positions during the competition

## Model Comparison (Sample)
<p> <img src="comparison.png" alt="Dashboard Preview" width="800"/> </p>

## Challenges
- Handling missing and non-numeric data during preprocessing
- Avoiding overfitting while tuning model complexity
- Balancing bias and variance through parameter tuning and validation
- Managing submission format and syntax issues within the Kaggle environment

## Future Considerations
- Explore deeper feature engineering and transformation techniques
- Learn advanced ensemble methods to combine multiple models effectively
- Analyze how hyperparameter tuning affects model interpretation and generalizability

## Conclusion
Through this competition, I gained hands-on experience in feature selection, model comparison, and hyperparameter tuning. I learned how subtle adjustments to parameters and cross-validation strategies can significantly affect prediction accuracy, and I saw the importance of balancing accuracy with generalization.
