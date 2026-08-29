---
subject: Finance
topic: backtesting
---

#flashcards/finance/backtesting

What problem does Combinatorial Purged CV (CPCV) solve, compared to a single backtest path?
?
It tests strategies without overfitting to, or relying on, a single backtest path — instead of one performance number, it produces a distribution of performance across many backtest paths.

---

How does CPCV partition data and generate splits?
?
T observations are split into N groups (G₁...G_N). k of the N groups are chosen as testing groups, and all C(N,k) combinations are generated — each combination is one split, trained on the N−k remaining groups (using purge + embargo) and tested on the k testing groups.

---

How many complete backtest paths (φ) does CPCV recombine from its N-choose-k splits, and why more than one?
?
φ(N,k) = (k/N) × C(N,k). A single split only tests k groups, so multiple splits must be recombined to cover all N groups into a complete backtest path — this yields φ(N,k) such paths instead of the single path a normal walk-forward backtest gives.

---

What is the training ratio θ in CPCV, and what constraint on k keeps it at or above 50%?
?
θ = (N−k)/N = 1 − k/N is the fraction of groups used for training. Bounding k ≤ N/2 ensures θ ≥ 1 − N/2/N = 50%, so at least half the data is used for training in each split.

---

Why does averaging performance across CPCV's φ backtest paths reduce the risk of false discoveries versus picking the best of many single-path backtests?
?
The variance of the mean performance across paths is σ²(μ) = φ⁻¹σ₁²(1 + (φ−1)ρ̄). Since paths are only weakly correlated (ρ̄ < 1), this is well below a single path's variance σ₁². Via Extreme Value Theory, E[max performance] scales with σ(μ), so a smaller σ(μ) means less chance that the "best" strategy variation looks good purely by luck.

---

What two weaknesses in validating time-series models does Combinatorial Symmetric CV (CSCV) / Probability of Backtest Overfitting (PBO) address?
?
Standard k-fold CV: random sampling places correlated/redundant events in both training and testing, causing information leakage under serial dependence. Walk-forward validation: prevents leakage but lacks random sampling and relies on a single testing path.

---

What is the general procedure for estimating PBO?
?
1. Form a T×N performance matrix M (T observations × N model configs). 2. Split M into an even number S of disjoint equal-size submatrices. 3. Generate all combinations of these submatrices in groups of size S/2, forming a training set J and testing set J̄ for each combination. 4. For each combination, find the model with the best in-sample performance, n* = argmax(Rₙ). 5. Find that model's relative rank ω̄c out-of-sample. 6. Convert to a logit and aggregate across all combinations to estimate PBO.

---

How is the logit λc computed for a combination c, and how is it interpreted?
?
λc = log(ω̄c / (1 − ω̄c)), where ω̄c is the in-sample-best model's relative out-of-sample rank (in [0,1]). A high logit means the out-of-sample performance is in line with the in-sample performance (low overfitting).

---

How is PBO estimated from the distribution of logits across all combinations?
?
PBO = the proportion of combinations whose logit λc is negative — i.e. the fraction of splits where the model that looked best in-sample actually underperforms (falls below the median) out-of-sample.
