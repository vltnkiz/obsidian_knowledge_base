---
subject: ML Concepts
topic: lightgbm
---

#flashcards/ml/lightgbm

What does GOSS stand for, and what core problem does it solve in tree boosting?
?
GOSS stands for **Gradient-based One-Side Sampling**. It solves the slowness of uniform sampling (using 100% of data points) by focusing on instances with larger gradients, which maximize information gain.

---

Describe the step-by-step process of the **GOSS** algorithm.
?
1. Sort all training instances by the absolute value of their gradients: $|g_i|$.
2. Keep the top $a\%$ of instances (those with large gradients).
3. Randomly sample $b\%$ from the remaining instances (those with small gradients).
4. Multiply/amplify the small gradients by a factor of $\frac{1-a}{b}$ to preserve the original data distribution when calculating information gain.

---

What does EFB stand for, and what real-world data challenge does it address?
?
EFB stands for **Exclusive Feature Bundling**. It addresses the issue of sparse, high-dimensional datasets (thousands of features that are mostly zero) by merging mutually exclusive features into a single bundle without losing information.

---

How does EFB use **Graph Coloring** to determine which features can be bundled together?
?
It builds a graph where **features are vertices** and **conflicts** (features that are simultaneously non-zero) are **edges**. Finding the minimum number of bundles reduces to the NP-hard graph-coloring problem, which LightGBM solves using a fast, greedy approach to group features that rarely share non-zero values.

---

In the **Histogram-based algorithm**, how does "Binning" work and why does it speed up tree building?
?
Continuous feature values are mapped into discrete bins (e.g., values $[23.4, 153.2]$ become bin indexes $[0, 2]$). It eliminates the need to pre-sort raw continuous feature values at every split point, dramatically reducing computation time.

---

How do the time complexities of calculating a split differ between a pre-sorted algorithm and a **Histogram-based algorithm**?
?
- **Histogram Building:** Calculating gradients per bin takes $O(\text{\#data})$ time.
- **Split Evaluation:** Finding the optimal split point over the constructed bins drops to $O(\text{\#bins})$. Because $\text{\#bins} \ll \text{\#data}$, evaluating split candidates becomes negligible.

---
#flashcards/ml/lightgbm-parameters

What does `num_leaves` control in LightGBM, and what is its default value?
?
It sets the maximum number of leaves allowed in a single tree. Default = 31. *(Note: This is the main parameter controlling tree complexity in LightGBM's leaf-wise growth).*

---

What does `min_data_in_leaf` do, and what is its default value?
?
It specifies the minimum number of data samples required to form a leaf node. Default = 20. It is a crucial parameter used to prevent overfitting.

---

What does `feature_fraction` control, and how does it operate if set to 0.8?
?
It tells LightGBM to randomly select a subset of features for building each tree. If set to 0.8, LightGBM randomly selects 80% of the total features. Default = 1.

---

What is `bagging_fraction`, and what secondary parameter must be configured for it to work?
?
It defines the fraction of data rows to be randomly sampled per tree (similar to feature fraction, but for rows). For it to be active, `bagging_freq` must be set to a non-zero value ($\neq 0$). Default = 1.

---

What does `bagging_freq` control, and what do settings of 0 vs. $k$ mean?
?
It defines the frequency of data bagging iterations. 
- $0$: Bagging is disabled.
- $k$: Perform bagging every $k$ boosting iterations/operations. Default = 0.

---

What do `learning_rate` and `num_iterations` represent, and what are their default values?
?
- **`learning_rate`:** The shrinkage rate applied to each tree update. Default = 0.1.
- **`num_iterations` (or `n_estimators`):** The total number of boosting rounds/trees built. Default = 100.

---

What parameters control L1 and L2 regularization in LightGBM, and what are their default settings?
?
- **`lambda_l1`:** Controls $L_1$ regularization. Default = 0.
- **`lambda_l2`:** Controls $L_2$ regularization. Default = 0.