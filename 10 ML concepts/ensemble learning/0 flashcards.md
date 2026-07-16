#flashcards/ml/ensemble-learning

What is Bootstrapping, and how does it generate different subsets from a single dataset?
?
Bootstrapping is a statistical resampling technique where multiple sub-datasets are created by randomly sampling rows from the original dataset **with replacement**. This means a single observation can be selected multiple times in the same subset, while others might not be selected at all.
<!--SR:!2026-07-06,8,250-->

---

What is Bagging, and how does it combine bootstrapped datasets to improve a model?
?
Bagging (Bootstrap Aggregation) is an ensemble meta-algorithm where multiple independent base models (like decision trees) are trained parallelly on different bootstrapped subsets of the data. Their individual predictions are then aggregated—via **majority voting** for classification or **averaging** for regression—to reduce variance and prevent overfitting.
<!--SR:!2026-06-30,2,230-->