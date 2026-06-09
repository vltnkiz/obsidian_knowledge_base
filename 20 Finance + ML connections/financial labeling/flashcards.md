#flashcards/financial-labeling

What is the Fixed-Time Horizon method of labeling, and what are its poor statistical properties?
?
It uses a triple classification system ($y \in \{-1, 0, 1\}$) based on whether an asset's price moves beyond a fixed threshold ($T$) at a pre-defined time interval. Because it relies heavily on time bars, it exhibits undesirable properties like heavy tails and heteroscedasticity.

---

How does the Triple-Barrier method dynamically track price paths instead of waiting for a timer to expire?
?
It wraps the price path inside a dynamic "box" bounded by three concurrent barriers:
1. An **upper horizontal barrier** for profit-taking (set as a multiple of volatility).
2. A **lower horizontal barrier** for stop-loss (set based on volatility).
3. A **vertical barrier** for maximum time-expiration.

---

What target labels ($y$) are assigned when a price path interacts with each barrier in the Triple-Barrier method?
?
- **Upper barrier hit:** $y = 1$ (successful long trade)
- **Lower barrier hit:** $y = -1$ (stop-loss triggered)
- **Vertical barrier hit:** $y = 0$, or alternatively, the mathematical sign of the returns over that tracking window.

---

Why must horizontal barriers remain strictly symmetric when first training a primary model to learn strategy entry points?
?
A model cannot establish independent profit-taking or stop-loss limits without knowing whether it is executing a long or short position. Since the primary model does not know the trading side yet, symmetric boundaries are structurally required.

---

What is Meta-Labeling, and how does it separate trade execution into primary and secondary models?
?
Meta-Labeling is the process of training a secondary machine learning model to filter the binary outcome accuracy of a primary model. 
- The **Primary Model** serves as the *idea generator* (determining the trade **SIDE**: long vs. short).
- The **Secondary Model** serves as the *risk manager / size controller* (determining the trade **SIZE**: take the bet vs. pass).

---

What are three distinct advantages of using Meta-Labeling in a quantitative trading pipeline?
?
1. **Restores asymmetric barriers:** Allows custom risk-to-reward parameters (e.g., profit-take at $3\times$ volatility and stop-loss at $1\times$ volatility).
2. **Simplifies complex classification:** Converts a messy three-class target problem into a clean binary classification problem ($y \in \{0, 1\}$: profitable vs. not profitable).
3. **Determines bet size:** Machine learning ensembles (like XGBoost) output raw probabilities that can be direct inputs for sizing capital allocation.

---

In a Meta-Labeling pipeline, what statistical evaluation metrics should the primary and secondary models individually prioritize?
?
- The **Primary model** must prioritize **recall** to capture as many valid directional market opportunities as possible.
- The **Secondary model** must prioritize **precision** to maximize how many of those selected opportunities actually turn out to be profitable.