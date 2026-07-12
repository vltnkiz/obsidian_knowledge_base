
---
## 1. What is a Transformation?
* **A Transformation is a Function:** It takes in an input vector and spits out an output vector.
* **Visualizing with Movement:** Instead of thinking of static vectors as arrows, it is highly intuitive to visualize a transformation as **movement**. 
* **Points, Not Arrows:** To prevent space from becoming too crowded with arrows, imagine each vector as a single point (its tip). A transformation is then visualized as watching every point in space shift to a new location.

---

## 2. The Geometric Definition of "Linear"
A transformation is strictly considered [[linear transformation]] if it satisfies two visual properties:
1. **The origin must remain fixed** in place ($T(\vec{0}) = \vec{0}$).
2. **All lines must remain straight** without bending or curving.

> 💡 **The Grid Rule:** Essentially, a linear transformation is a way of morphing space such that **grid lines remain parallel and evenly spaced**.

---

## 3. The Power of Basis Vectors ($\hat{i}$ and $\hat{j}$)
* You do not need to watch the entire transformation to know where every vector lands. You only need to track where the standard basis vectors—**$\hat{i}$ (1,0) and $\hat{j}$ (0,1)**—land.
* **Preserving Combinations:** Because grid lines remain parallel and evenly spaced, any vector that starts as a specific linear combination of $\hat{i}$ and $\hat{j}$ will end up as the *exact same* linear combination of the transformed $\hat{i}$ and $\hat{j}$.
* **Example:** If a vector $\vec{v} = -1\hat{i} + 2\hat{j}$, and after a transformation $\hat{i}$ lands at $(1, -2)$ and $\hat{j}$ lands at $(3, 0)$, you can deduce $\vec{v}$'s destination mathematically:
  $$-1\begin{bmatrix} 1 \\ -2 \end{bmatrix} + 2\begin{bmatrix} 3 \\ 0 \end{bmatrix} = egin{bmatrix} 5 \\ 2 \end{bmatrix}$$

---

## 4. What a Matrix Actually Is
* **A Package of Destinations:** A 2x2 matrix is simply a conceptual package holding the four numbers that describe a 2D linear transformation.
* **The Column Rule:** **The columns of a matrix are the landing sites of your basis vectors.** * **Column 1:** Where $\hat{i}$ lands.
  * **Column 2:** Where $\hat{j}$ lands.
* **Matrix-Vector Multiplication:** When you multiply a matrix by a vector $\begin{bmatrix} x \\ y \end{bmatrix}$, you are just calculating a linear combination: scaling the first column by $x$, scaling the second column by $y$, and adding them together.
  $$\begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = x\begin{bmatrix} a \\ c \end{bmatrix} + y\begin{bmatrix} b \\ d \end{bmatrix}$$

---

## 5. Notable Examples
* **90° Counterclockwise Rotation:** $\hat{i}$ moves to $(0,1)$ and $\hat{j}$ moves to $(-1,0)$. This transformation is represented by the matrix:
  $$\begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}$$
* **Shear:** $\hat{i}$ stays fixed at $(1,0)$ while $\hat{j}$ shifts diagonally to $(1,1)$. This yields the matrix:
  $$\begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$$
* **Linear Dependence (Squishing Space):** If the columns of a matrix are linearly dependent (one is a scalar multiple of the other), it means the transformation squishes the entire 2D space down onto a single 1D line.

---

## Core Takeaway
**Every time you see a matrix, do not just see a static box of numbers; visualize it as a dynamic transformation altering the fabric of space.** Once you internalize this, deeper linear algebra concepts like matrix multiplication, determinants, change of basis, and eigenvalues become entirely intuitive.
