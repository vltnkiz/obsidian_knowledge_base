---
subject: ML Concepts
topic: explainability
---

#flashcards/ml/explainability

How are partial plots constructed
?
After a model is fit, alter the value for one variable, fixing other variables. Then plot the average predicted outcome. (see graph)
<!--SR:!2026-06-03,2,250-->

How is permutation importance computed
?
After a model if fit, randomly shuffles one column and observe drop in model accuracy. This is the permutation importance.
<!--SR:!2026-06-03,2,250-->

What are the pros of the method
?
Model agnostic. Tied to model performance.
<!--SR:!2026-06-03,2,252-->

What are the cons
?
Correlated features.
<!--SR:!2026-06-13,12,272-->

---

What is Mean Decrease Accuracy (MDA), and how does it differ from permutation importance in general?
?
MDA is essentially permutation importance evaluated out-of-sample (OOS) rather than in-sample: shuffle one feature's column, re-score the model on held-out data, and the accuracy drop is that feature's importance.

---

What are the steps to compute MDA?
?
1. Train and score the model to get a baseline performance (e.g. accuracy = 85%). 2. Shuffle one feature's column to break its link with the target. 3. Re-score the model (e.g. accuracy = 60%). 4. Importance = baseline − new score (e.g. 25%).

---

What critical considerations apply to MDA?
?
Model agnostic; flexible metric choice (F1, negative log-loss, etc.); still suffers the substitution/collinearity effect like MDI; can yield zero or even negative importance for a feature; needs purged and embargoed CV in time-series data or scores become optimistically biased from leakage.

---

What is Mean Decrease Impurity (MDI), and at what three levels is it computed?
?
MDI measures how much a feature reduces impurity when splitting on it. Node level: each split's impurity decrease is attributed to the splitting feature. Tree level: decreases are summed across the whole tree. Forest level: summed/averaged across all trees in the ensemble.

---

What is the masking effect in MDI, and how is it fixed?
?
If one feature is slightly better than a correlated second feature, the tree always picks the better one, masking the second feature's usefulness. Fix: set max_features=1 so each node only considers one randomly selected feature.

---

What are the other critical considerations for MDI?
?
In-sample bias (computed only on training data); algorithm-specific — relies on tree splits, so it can't be used for SVMs, logistic regression, or neural networks; normalized so all importances sum to 1; suffers the substitution effect (collinear features split importance, making each look less important); biased toward high-cardinality features since trees find split points more easily for them.

---

What is Single Feature Importance (SFI), and how does it differ from MDA/MDI?
?
SFI is an out-of-sample method that evaluates each feature in complete isolation: it trains a separate model using only that one feature and measures how well it predicts the target, rather than measuring the effect of removing/shuffling a feature from a full model.

---

What are the critical considerations for SFI?
?
Model agnostic; flexible performance metric; immune to the substitution/collinearity effect (since features are tested one at a time); gives realistic (OOS) importance; but loses joint effects and hierarchical importance between features.
