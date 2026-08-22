---
subject: ML Concepts
topic: dimensionality reduction
---

#flashcards/ml/dimensionality-reduction

Why is PCA useful for dimensionality reduction?
?
1-3 variables are easy to plot, but 4+ would require an impossible higher-dimensional space. PCA simplifies high-dimensional data into a 2D or 3D plot so you can still spot clusters or similar points.

---

What is the first step of PCA (with the SVD approach), and what is its formula?
?
Center the data to the origin: compute the mean of each variable j, μⱼ = (1/n)Σxᵢⱼ, then subtract it from every value: xᵢⱼ = xᵢⱼ − μⱼ.

---

How does PCA find PC1 and PC2 geometrically?
?
PCA finds the best-fit line through the centered data by maximizing the distance c from the origin (equivalent to minimizing the perpendicular distance b, since a²=b²+c²). The slope of this best-fit line is PC1; PC2 is the line perpendicular to it.

---

What are loading scores in PCA?
?
The components of the eigenvector for a principal component. E.g. if PC1's eigenvector is [1/√2, 1/√2] (slope of 1), those component values are the loading scores — they indicate how much each original variable contributes to that PC.

---

How are the eigenvalue and singular value for a principal component computed?
?
Eigenvalue for PC1 = (1/(n−1)) Σ(distance to PC2)². Singular value for PC1 = √(Σ(distance to PC1)²).

---

How is the variance explained by each PC computed, and what does a scree plot show?
?
Variance of PC1 = (1/(n−1))Σ(distance to PC1)²; variance of PC2 = (1/(n−1))Σ(distance to PC2)². A scree plot is a bar chart showing how much total variation each PC explains, used to decide how many PCs to keep.

---

How do you compute PCA using the covariance matrix instead of SVD, and what is the covariance matrix's formula?
?
After centering the data to (0,0), compute the covariance matrix Σ = [[Var(X), Cov(X,Y)], [Cov(X,Y), Var(Y)]], where each covariance term is the sum of the product of coordinates. This matrix is always symmetric.

---

What does the sign of Cov(X,Y) indicate about the relationship between X and Y?
?
Cov < 0: X and Y move in opposite directions (negative relationship). Cov ≈ 0: no linear relationship. Cov > 0: X and Y move in the same direction (positive relationship).

---

Geometrically, what transformation does the covariance matrix represent, and how do you find PC1 from it?
?
The covariance matrix is a linear transformation that always stretches space across two eigenvectors (turning a circle into an ellipse). Solving for the eigenvalues tells you which axis has the higher variance — PC1 is the eigenvector with the maximum eigenvalue.

---

How do you choose how many principal components to keep?
?
Choose the 2-3 eigenvectors with the highest eigenvalues to represent the data in 2D or 3D.
