
#flashcards/lightgbm

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