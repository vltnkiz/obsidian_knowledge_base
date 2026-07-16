#flashcards/data-analysis/fractional-differentiation

Why is there a core dilemma between stationarity and memory when preparing financial features for machine learning?
?
Machine learning algorithms require stationary data for consistency in their predictions, but standard methods to achieve this completely eliminate historical content (memory). Prices ($d=0$) have full memory but are non-stationary, while standard returns ($d=1$) are stationary but completely memoryless. 

---

How does Fractional Differentiation solve the Stationarity vs. Memory trade-off?
?
It finds the optimal "sweet spot" ($d^*$), which is the minimum coefficient of differentiation required to make a non-stationary series stationary. By using a fractional order of differentiation ($0 < d < 1$), it achieves stationarity while preserving the maximum amount of historical memory possible.

---

What mathematical expansion must be used to calculate differentiation weights when $d$ is a fraction, and why?
?
When $d$ is a fraction, the expansion becomes an infinite series that does not naturally terminate. Therefore, the **Binomial Theorem** must be introduced to expand the backshift operator expression:
$$(1-B)^d = 1 - dB + \frac{d(d-1)}{2!}B^2 - \frac{d(d-1)(d-2)}{3!}B^3 + \dots$$

---

How do the calculated weights ($\omega_k$) behave differently when $d = 1$ versus when $d$ is a fraction (e.g., $d = 0.4$)?
?
* **When $d = 1$:** The formula stops after the second term because the $(d-1)$ term evaluates to $0$.
* **When $d$ is a fraction:** The weights decay asymptotically toward zero. They get closer and closer but never actually reach it, creating an infinite memory window.

---

What is the Fixed-Width Fracdiff (FFD) method, and what specific flaw in the expanding window method does it fix?
?
The expanding window method introduces a massive downward drift into the data. FFD solves this by **truncating negligible weights**. Instead of letting the window grow indefinitely, it sets a threshold ($\tau$) for the weight modulus ($|\omega_k|$) and drops all smaller weights beyond that index, maintaining a fixed history width.

---

What does a threshold value of $d^* < 1$ reveal about most standard financial series during an Augmented Dickey-Fuller (ADF) test?
?
An ADF test checks for stationarity against a threshold (like the 95% confidence level). For most financial series (such as currencies where $d \approx 0.3 \text{ to } 0.4$), the optimal frontier $d^*$ is less than $1$. This proves that you do not need to take full integer differences ($d=1$)—and destroy all memory—to make the series stationary.