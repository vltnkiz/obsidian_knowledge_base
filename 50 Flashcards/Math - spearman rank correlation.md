---
subject: Math
topic: spearman rank correlation
---

#flashcards/math/spearman-rank-correlation

What does Pearson correlation measure, and what's its key limitation?
?
It measures linear relationships between X and Y: Corr(X,Y) = Cov(X,Y) / (σ(X)σ(Y)), in [-1,1]. Limitation: if Y grows like X² (a nonlinear but perfectly predictable relationship), Pearson correlation will be less than 1 even though Y is perfectly determined by X.

---

How does Spearman correlation differ from Pearson correlation?
?
Spearman correlation computes Pearson correlation on the ranks of X and Y rather than their raw values. This lets it measure whether the prediction goes up whenever the feature does, regardless of whether the relationship is a line, a curve, or another monotonic shape.

---

If predictions are ranked 1,2,3,4 across four observations and a feature is ranked 4,3,2,1 for those same observations, what is the Spearman correlation?
?
-1 — a perfectly inverse monotonic relationship.
