---
subject: ML Concepts
topic: regularization
---

#flashcards/ml/regularization

What is the optimization objective (cost function) for Lasso Regression (L1​ regularization)?
?
min​∑(yi​−y^​i​)2+λ*∑​∣βj​∣
_(It minimizes the sum of squared residuals plus λ times the sum of the absolute values of the coefficients)._

What is a major structural advantage that L1​ regularization (Lasso) has over L2​ regularization (Ridge) regarding feature selection?
?
L1​ can eliminate useless variables entirely by shrinking their coefficients βj​ all the way to 0.

Why does L2​ regularization (Ridge) prefer to penalize large coefficients over small ones? 
?
Because it squares the coefficients.
- A large coefficient (β1​=0.8) becomes β12​=0.64 (a large penalty contribution).
- A small coefficient (β2​=0.1) becomes β22​=0.01 (a negligible penalty contribution).

Why doesn't L1​ regularization (Lasso) favor penalizing large coefficients as drastically as L2​ does?
?
Because it uses the absolute value (∣βj​∣). The penalty scales linearly rather than quadratically.
- β1​=0.8→∣β1​∣=0.8
- β2​=0.1→∣β2​∣=0.1 The penalty for the small variable stays significant relative to its size, allowing it to be driven completely to 0.

What is the main trade-off/goal when introducing Ridge Regression (L2​ regularization)?
?
To introduce a small amount of bias during training in order to get a significant reduction in variance during testing.

In terms of model behavior, how can you intuitively define "Regularization"?
?
Desensitization. It makes the model less sensitive to variations or extremes in the training data.

Why is standard Linear Regression (minimizing Least Squares Error) problematic when you only have a few data points (e.g., two points)?
?
The minimum sum of squared errors will be 0, resulting in a perfect line but a severe overfit that won't generalize well to new data.

What is the optimization objective (cost function) for Ridge Regression in a simple linear model?
?
min(∑squared residuals+λ×slope2)
(Where λ×slope2 is the penalty term)

As you increase the regularization penalty λ toward infinity, what happens to the slope of the regression line?
?
The slope gets closer and closer to 0 (horizontal), making the predicted variable completely desensitized to the input feature.