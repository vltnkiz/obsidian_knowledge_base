#flashcards/financial-data

What are Time Bars, and what is their primary drawback when sampling financial markets?
?
Time Bars sample the market at fixed time intervals (e.g., 1-minute bars). They waste data samples during quiet periods and under-sample when the market is highly active.

---

What are Tick Bars, and how do they extract information differently than Time Bars?
?
Tick Bars sample data every time a fixed number of transactions (ticks) occurs, regardless of time. This allows them to sample more frequently during high-activity periods and less frequently during low-activity periods, aligning the data density with actual market activity.
<!--SR:!2026-06-24,3,250-->

---

What are Volume Bars, and what specific problem do they solve?
?
Volume Bars sample data every time a pre-defined number of units/shares are traded. They prevent sampling distortion caused by a single transaction executing an exceptionally massive order, ensuring the data blocks reflect a consistent amount of traded asset volume.

---

What are Dollar Bars, and why are they often preferred over Tick or Volume Bars in long-term analysis?
?
Dollar Bars sample data every time a fixed amount of fiat currency value (e.g., $1,000,000) is exchanged. They adjust naturally to significant asset price changes, whereas Tick and Volume bars can become heavily distorted if an asset's price doubles or drops significantly over time.

---

How are Tick Imbalance Bars (TIBs) constructed, and what does the variable $\theta_t$ measure?
?
TIBs sample data based on transaction imbalances. The tick direction is signed as $b_t \in \{1, -1\}$ (depending on whether the price increases or decreases), and the cumulative tick imbalance is measured by:  
$\theta_t = \sum_{t=1}^{\tau} b_t$

---

How does the closing frequency of a Tick Imbalance Bar (TIB) differ during informed trading vs. noise trading?
?
- **Informed / One-sided trading:** Imbalance accumulation grows fast, causing the bars to close quickly.  
- **Balanced / Noise trading:** Imbalance cancels out, causing the bars to stay open longer.

---

What distinguishes Volume Imbalance Bars (VIBs) and Dollar Imbalance Bars (DIBs) from basic Tick Imbalance Bars?
?
Instead of treating every transaction equally, VIBs and DIBs weight the cumulative imbalance ($\theta_\tau$) by the size of the trade. They multiply the tick sign ($b_t$) by the volume ($v_t$) or dollar value traded to measure directional bias in market size.

---

What is the main limitation of training machine learning models on uniform random sampling in financial markets?
?
Most random bars contain no interesting market activity. The model trains on a mixed signal containing mostly noise, resulting in low accuracy because it learns to predict noise.

---

How does Event-Driven Sampling (Selective Sampling) optimize model training compared to random sampling?
?
It samples data points only when specific catalytic conditions exist. This ensures the machine learning model trains exclusively during periods where the features are informative, yielding higher accuracy by capturing the actual signal.

---

What is a CUSUM Filter, and how does it function when applied to asset prices?
?
It is a quality control filter that detects cumulative deviations of an observation from its expected value up to a specified threshold. Applied to stock prices, it enables selective sampling by identifying turning points or structural shifts.

---

Write out the mathematical formulas for the Upward ($S_t^+$) and Downward ($S_t^-$) Symmetric CUSUM filters.
?
- **Upward CUSUM:** $S_t^+ = \max\{0, S_{t-1}^+ + y_t - h\}$  
- **Downward CUSUM:** $S_t^- = \min\{0, S_{t-1}^- + y_t + h\}$  
*(Where $y_t$ is the current shift/deviation, $h$ is the threshold, and the function resets to zero whenever the cumulative surprise shifts signs)*.