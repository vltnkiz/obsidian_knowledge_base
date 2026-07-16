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