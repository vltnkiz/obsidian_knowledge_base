#flashcards/xgboost 

What is the full objective function that XGBoost minimizes at a given iteration, and what does each of its three components represent?
?
$\mathcal{L} = \sum_{i=1}^{n} L(y_i, \hat{y}_i) + \gamma T + \frac{1}{2}\lambda \sum_{j=1}^{T} w_j^2$
- **$\sum L(y_i, \hat{y}_i)$**: The loss function (training error/data fit).
- **$\gamma T$**: Tree complexity penalty (controls number of terminal leaves, $T$).
- **$\frac{1}{2}\lambda \sum w_j^2$**: $L_2$ regularization on leaf weights (shrinks $O_{\text{value}}$ to prevent overfitting).

---

What are the objective loss functions ($L$) used by XGBoost for **Regression** vs. **Binary Classification**?
?
- **Regression (Squared Error):** $L(y_i, \hat{y}_i) = \frac{1}{2}(y_i - \hat{y}_i)^2$
- **Classification (Log Loss):** $L(y_i, \hat{y}_i) = -[y_i \log(\hat{y}_i) + (1 - y_i)\log(1 - \hat{y}_i)]$

---

Why does XGBoost use a second-order Taylor approximation on its loss function, and what are the definitions of $g_i$ and $h_i$?
?
It allows XGBoost to easily optimize **any custom loss function**, provided it is twice differentiable.
- **$g_i$ (Gradient):** First derivative of the loss function $\frac{\partial L}{\partial \hat{y}_i}$
- **$h_i$ (Hessian):** Second derivative of the loss function $\frac{\partial^2 L}{\partial \hat{y}_i^2}$

---

Write the formula for the optimal weight/output value ($O_{\text{value}}$ or $w_j^*$) of a single leaf node.
?
$O_{\text{value}} = \frac{-\sum_{i \in I} g_i}{\sum_{i \in I} h_i + \lambda}$ (Where $I$ is the set of data points mapping to that specific leaf).

---

What is the formula for the **Similarity Score** of a node, and how does it relate to the Taylor expansion optimization?
?
$\text{Score} = \frac{\left(\sum g_i\right)^2}{\sum h_i + \lambda}$
Derived by plugging the optimal $O_{\text{value}}$ back into the simplified Taylor-approximated objective function to measure how much quality a node adds.

---

Conceptually, what does a large **Hessian ($h_i$)** imply about the loss function, and why does a larger Hessian reduce the Similarity Score?
?
A large Hessian means the loss function has high **curvature** (the gradient changes rapidly). This indicates a high level of uncertainty if we make a large move. The denominator $\sum h_i + \lambda$ acts as a penalty, shrinking the score and ensuring the model takes smaller, more conservative updates.

---

Conceptually, what does it mean when the sum of gradients $|\sum g_i|$ inside a node is very large?
?
It means the gradients strongly **agree in direction** (e.g., they are mostly all positive or mostly all negative). The model is consistently making errors in the same direction for all samples in that node, justifying a massive correction (hence, a much higher Similarity Score).

---

Write the formula used to calculate the **Total Gain** of a potential tree split, and explain the role of $\gamma$.
?
$\text{Gain} = \frac{1}{2} \left( \text{Score}_L + \text{Score}_R - \text{Score}_P \right) - \gamma$
- **$\text{Score}_L$ / $\text{Score}_R$**: Similarity scores of the Left and Right child nodes.
- **$\text{Score}_P$**: Similarity score of the Parent node.
- **$\gamma$**: The cost of adding a new leaf. If the gain from splitting doesn't exceed $\gamma$, the split is rejected (pruned).

---
#flashcards/xgboost-parameters

What does `learning_rate` control in XGBoost, and what is the trade-off of making it lower?
?
It controls the step size per tree. A lower `learning_rate` requires more trees (`n_estimators`), but makes the overall model more robust.

---

What does `max_depth` define, and what happens if it is set too high?
?
It defines the maximum depth of each individual tree. A higher `max_depth` results in more complex trees, which increases the risk of overfitting.

---

What is `subsample` and what is its primary benefit?
?
It controls row sampling (the fraction of training observations randomly sampled for each tree). It adds randomness to the training process, which reduces overfitting.

---

What does `colsample_bytree` control?
?
It controls feature (column) sampling per tree. It applies the same randomness concept as `subsample`, but selection happens on features/columns instead of rows.

---

What does the parameter `n_estimators` represent?
?
It specifies the total number of trees to be built in the boosting ensemble.

---

What is `min_child_weight` and what constraint does it place on tree building?
?
It dictates the minimum number of samples (or minimum sum of instance Hessian weights) required to remain in a leaf node.