---
subject: ML Concepts
topic: gradient boosting
---

#flashcards/ml/gradient-boosting

What is a residual vector in the context of Gradient Boosting?
?
The difference between the actual target and the model's current prediction (y−Fm−1​(x)). It provides the direction and magnitude needed to correct the prediction.
<!--SR:!2026-06-05,3,250-->


When optimizing for L2​ loss, what does each new model (Δm​(x)) train on (the L2 gradient)?
?
It trains directly on the raw residuals: (y − (Fm−1​(x)).
<!--SR:!2026-06-05,3,250-->

What is the main risk/drawback of training a Gradient Boosting model using L2​ loss?
?
It is highly sensitive to outliers. Because it trains directly on the raw residual magnitude, Δm​(x) can end up chasing outliers.
<!--SR:!2026-06-05,3,250-->

If you want to optimize for L1​ loss (MAE), how do you alter the target for Δm​(x) (the L1 gradient)?
?
You train Δm​(x) using the sign of the residuals: sign(y−Fm−1​(x))
<!--SR:!2026-06-05,3,250-->

What statistical metric is a Gradient Boosting model trying to predict when optimizing for L1​ loss?
?
The median residual.
<!--SR:!2026-06-05,3,250-->

What is L2​ loss, and what is its formula?
?
L2​ loss (also known as Mean Squared Error / MSE) measures the average of the squared differences between actual values and predicted values.
    Formula: L2​=(y−y^​)2
<!--SR:!2026-06-05,3,250-->

What is L1​ loss, and what is its formula?
?
L1​ loss (also known as Mean Absolute Error / MAE) measures the average of the absolute differences between actual values and predicted values.
    Formula: L1​=∣y−y^​∣
<!--SR:!2026-06-05,3,250-->

By mathematical definition, what direction does a gradient (∇L) point, and why do we use the negative gradient (−∇L) in machine learning?
?
The Gradient (∇L) always points in the direction of steepest ascent (the fastest way to increase the loss function). This is because derivatives naturally measure how a function grows.
The Negative Gradient (−∇L) flips that direction to point straight down (steepest descent). We use it because our goal in machine learning is to minimize error and find the bottom of the loss valley.

---

In Era Boosting, why can two models with the same overall returns carry very different risk?
?
Because performance stationarity matters, not just total return: a model whose win/loss sequence lacks autocorrelation (more memoryless, no long drawdown "burns") is more stationary and therefore lower-risk than one with long streaks of losses, even if both hit the same accuracy.

---

What is a likely root cause of non-stationary model performance, and what technique is it parallel to?
?
Non-stationary features — features that work well in specific regimes and then cycle into losses in the next regime. This parallels feature neutralization, where over-reliance on certain features is deliberately reduced.

---

What is the "smart Sharpe ratio" and why introduce it over the plain Sharpe ratio?
?
Smart Sharpe = mean returns / (std of returns × autocorrelation penalty), versus plain Sharpe = mean returns / std of returns. Plain Sharpe penalizes variance of returns but treats scattered losses the same as one big clump of losses; smart Sharpe also penalizes low autocorrelation (return clumping), so two models can have equal Sharpe but different smart Sharpe.

---

How does the Era Boosting algorithm implementation work?
?
At each iteration, train only on the eras with the worst correlations (score each era, e.g. via Spearman correlation between predictions and target, take the worst-scoring proportion), grow the ensemble by adding new trees fit on just those worst eras, and repeat. This forces new trees to specifically address the eras/clumps causing losses.