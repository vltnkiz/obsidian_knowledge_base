#flashcards/data-analysis/sample-weights

Why are traditional series of labels not IID (Independent and Identically Distributed) in financial machine learning?
?
Because financial machine learning labels usually depend on a function of price movements occurring over overlapping time horizons between a trade's entry and its stop window. Since multiple labels depend concurrently on shared return windows, the resulting series violates the IID assumption.

---

How is Instantaneous Concurrency ($C_t$) calculated, and how does it determine Instantaneous Uniqueness ($u_{t,i}$)?
?
Instantaneous Concurrency ($C_t$) is the sum of all active overlapping labels at a specific time $t$:  
$C_t = \sum_{i=1}^{T} 1_{t,i}$  
Instantaneous Uniqueness ($u_{t,i}$) is then calculated as the inverse of concurrency for that active label:  
$u_{t,i} = \frac{1_{t,i}}{C_t}$

---

Why does standard uniform bootstrapping break down and destroy the performance of bagging classifiers on overlapping financial data?
?
In standard bootstrapping with replacement, the probability of never selecting a given item is $\lim_{I\to\infty}(1-\frac{1}{I})^I = e^{-1} \approx 36.8\%$. However, with overlapping features, there are only $K$ unique information chunks ($K \ll I$). This causes the selection probability to shift to $\approx e^{-I/K}$. Because $I/K$ is large, the algorithm heavily oversamples the exact same redundant data points, destroying tree diversity.

---

What is Sequential Bootstrapping, and how does it restrict the repetition of redundant data points?
?
Sequential Bootstrapping is a technique that alters the draw distribution by using dynamic probabilities instead of a uniform distribution. Before each step, it evaluates the instantaneous uniqueness of every sample if it were to be added to the existing timeline of drawn samples. If a sample overlaps heavily with already selected data, its drawing probability is restricted, forcing the selection of structurally unique information.

---

How does Return Attribution solve the problem where a 10% market move is given the same training weight as a 0.5% market move?
?
It weights samples by their raw absolute returns adjusted by uniqueness. If a label window covers an asset return $R_i$, it computes the sample weight as $w_i = |R_i|$, scaled so that the sum of all weights matches the total number of observations ($I$). This ensures the model learns more aggressively from high-impact price movements.

---

What is the Time Decay factor ($d$) in financial data labeling, and how does information redundancy affect its speed?
?
Because markets are adaptive systems, older data becomes less reflective of current market regimes. We multiply return weights by a decay factor ($0 < d < 1$) where $d=1$ indicates recent data. In this framework, "time" only ticks forward when unique information arrives; if market observations are highly redundant, the time decay calculation automatically slows down.

---

Why do rare events like a 1% market crash break standard classifier training, and how does the `class_weight='balanced'` setting fix this?
?
If a dataset contains 99% normal days and 1% crash days, a naive model can achieve 99% accuracy by simply predicting "normal" every time. Setting `class_weight='balanced'` penalizes the loss function inversely proportional to class frequencies. It calculates a class weight $W_i = \frac{\text{Total Samples}}{\text{Number of Classes} \times \text{Count of Class } i}$, forcing the model to heavily penalize errors on minority classes.