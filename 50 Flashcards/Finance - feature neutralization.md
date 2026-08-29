---
subject: Finance
topic: feature neutralization
---

#flashcards/finance/feature-neutralization

What does feature exposure measure, and why isn't a model's overall correlation with the target enough on its own?
?
Feature exposure measures how a model's reliance is distributed across its features — spread across many features (robust) vs. concentrated on a few (fragile). Overall correlation with the target only tells you how good the predictions are, not how the model got there.

---

What empirical evidence supports using feature exposure as a robustness diagnostic?
?
Across 80+ models, low in-sample max feature exposure (measured via Spearman rank correlation) reliably predicted higher out-of-sample performance — i.e. low exposure, measured before seeing new data, predicted robustness to non-stationarity (regime change).

---

How can a model's predictions be decomposed with respect to one feature, and how do feature exposure and feature neutralization relate to that decomposition?
?
prediction = fitted + residual, where "fitted" is the straight-line part of the prediction explained by that feature and "residual" is what's left over. Feature exposure measures the fitted part; feature neutralization throws away some of it.

---

How is the "fitted" part computed via linear regression, for one feature and for many features?
?
fitted = β × feature, where β is the best-fit slope. With a single feature, β = cov(X,Y) / var(X). With many features, the fitted values are computed using the matrix pseudo-inverse.

---

What is the feature neutralization formula, and what does the "proportion" knob control?
?
neutralized = prediction − proportion × fitted. The proportion knob (0 to 1) sets how much of the feature-explained (fitted) part to strip out of the prediction.
