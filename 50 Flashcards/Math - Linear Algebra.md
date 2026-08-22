---
subject: Math
topic: Linear Algebra
---

#flashcards/math/linear-algebra

What are the two geometric properties that strictly define a **linear transformation**?
?
1. The **origin must remain fixed** in place ($T(\vec{0}) = \vec{0}$).
2. **All lines must remain straight** — grid lines stay parallel and evenly spaced without bending or curving.

---

What do the **columns of a matrix** represent geometrically?
?
The columns of a matrix are the **landing sites of the basis vectors** after a transformation. Column 1 is where $\hat{i}$ lands, and Column 2 is where $\hat{j}$ lands. Multiplying by a vector simply computes the corresponding linear combination of those columns.

---

What does the **determinant** of a matrix measure geometrically?
?
The determinant measures the **factor by which a transformation scales areas** (in 2D) or **volumes** (in 3D). For example, if $\det(A) = 6$, any region of space gets scaled to 6 times its original size after the transformation.

---

What does a determinant of **zero** tell you about the transformation?
?
A zero determinant means the transformation **collapses space into a lower dimension** — a 2D space is squished onto a line or a point, and a 3D space is squished onto a plane, line, or point. It also implies the columns of the matrix are **linearly dependent**.

---

What does a **negative determinant** indicate about a linear transformation?
?
A negative determinant means the transformation **inverts the orientation of space** (like flipping a sheet of paper to its backside). The absolute value still gives the true area/volume scaling factor.

---

What is the formula for the determinant of a $2 \times 2$ matrix $\begin{bmatrix} a & b \\ c & d \end{bmatrix}$?
?
$$\det(A) = ad - bc$$
The term $ad$ represents the base rectangular scaling, while $bc$ accounts for the diagonal skewing from the off-diagonal entries.

---

What is the **multiplicative property** of determinants?
?
$$\det(M_1 \cdot M_2) = \det(M_1) \cdot \det(M_2)$$
Geometrically: applying two transformations in sequence scales space by the **product** of their individual scaling factors.

---

What is an **eigenvector**, and what makes it special under a linear transformation?
?
An eigenvector is a non-zero vector $\vec{v}$ that **remains on its own span** (the line through the origin and its tip) after a transformation is applied. The matrix does not rotate it — it only stretches, squishes, or flips it.

---

What is an **eigenvalue**, and how does it relate to its eigenvector?
?
An eigenvalue $\lambda$ is the **scalar scaling factor** by which the corresponding eigenvector is stretched or squished. A negative eigenvalue means the vector also reverses direction. The relationship is: $A\vec{v} = \lambda\vec{v}$.

---

What is the **characteristic equation**, and why must the determinant equal zero?
?
Starting from $A\vec{v} = \lambda\vec{v}$, we rearrange to $(A - \lambda I)\vec{v} = \vec{0}$. For a non-zero $\vec{v}$ to satisfy this, the matrix $(A - \lambda I)$ must collapse space to a lower dimension, which requires:
$$\det(A - \lambda I) = 0$$
The roots of this polynomial are the eigenvalues.

---

How do you find **eigenvectors** once you have the eigenvalues?
?
Substitute each solved eigenvalue $\lambda$ back into $(A - \lambda I)$ and solve the linear system $(A - \lambda I)\vec{v} = \vec{0}$. The null space of that matrix gives the corresponding eigenvectors.

---

Why does a **pure 2D rotation** have no real eigenvectors?
?
A $90°$ rotation knocks every single vector off its span. Solving $\det(A - \lambda I) = 0$ for a rotation matrix yields **imaginary roots** (e.g., $\lambda = \pm i$), so there are no real eigenvectors.

---

What is an **eigenbasis**, and what special form does its matrix take?
?
An eigenbasis is a set of eigenvectors chosen as the coordinate system's basis vectors. When a change of basis is performed using an eigenbasis, the resulting matrix is a **diagonal matrix** with the eigenvalues along the diagonal:
$$D = \begin{bmatrix} \lambda_1 & 0 \\ 0 & \lambda_2 \end{bmatrix}$$

---

Why is diagonalization useful for computing **high matrix powers** (e.g., $A^{100}$)?
?
Computing $A^{100}$ directly is extremely expensive, but for a diagonal matrix it is trivial — you simply raise each diagonal entry to the power:
$$D^{100} = \begin{bmatrix} \lambda_1^{100} & 0 \\ 0 & \lambda_2^{100} \end{bmatrix}$$
You then use the similarity transformation $P^{-1}AP = D$ to translate back and forth between coordinate systems.

---

What does the **change of basis matrix** $P$ do, and what do its columns contain?
?
The change of basis matrix $P$ translates a vector written in an alternate coordinate system (e.g., Jennifer's) **into our standard coordinates**. Its **columns are the alternate basis vectors expressed in our coordinate system**.

---

How do you translate a vector from **our coordinates into an alternate coordinate system**?
?
You multiply by the **inverse** of the change of basis matrix:
$$\vec{v}_{\text{other}} = P^{-1} \vec{v}_{\text{ours}}$$

---

What does the **similarity transformation** $A = P^{-1}MP$ represent?
?
It represents the same physical transformation $M$ as seen from a different coordinate system. Reading right to left:
1. $P$ — translate the input vector into our standard language.
2. $M$ — apply the transformation in our system.
3. $P^{-1}$ — translate the result back into the alternate coordinate language.
