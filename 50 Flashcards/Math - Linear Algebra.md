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

---

What is the **column space** $C(A)$, and which space does it live in?
?
$C(A)$ is the set of all vectors $b$ that are reachable by $A\vec{x}$ — i.e. **where $b$ lives in $A\vec{x} = \vec{b}$**. For an $m \times n$ matrix, $C(A)$ is a subspace of $\mathbb{R}^m$ with dimension $\text{rank}(A)$. It is spanned by the columns of $A$.

---

What is the **null space** $N(A)$, and which space does it live in?
?
$N(A)$ is the set of all vectors $x$ that solve $A\vec{x} = \vec{0}$. For an $m \times n$ matrix, $N(A)$ is a subspace of $\mathbb{R}^n$ with dimension $n - \text{rank}(A)$.

---

What is the **rank** of a matrix, in terms of elimination?
?
The rank equals the **number of pivot columns** — the pivots left after running Gaussian elimination to row echelon form. For example, $\begin{bmatrix} 1 & 2 & 3 \ 2 & 4 & 6 \ 3 & 4 & 7 \end{bmatrix}$ reduces to a form with two pivots, so its rank is 2.

---

State the **rank–nullity theorem** as it falls out of the column/null space dimensions.
?
For an $m \times n$ matrix:
$$\text{rank}(A) + \dim N(A) = n$$
The $r$ independent directions are used up by the column space; the remaining $n - r$ input directions collapse to zero and form the null space.

---

What two conditions must a set of vectors satisfy to be a **basis** for a space?
?
The vectors must be:
1. **Linearly independent**, and
2. **Span the space** (every vector in the space is some linear combination of them).

---

How do you test whether a set of vectors is **linearly independent** using the null space?
?
A set of vectors is independent if and only if its null space contains only the zero vector:
$$N(A) = \{\vec{0}\}$$
Any non-zero solution to $A\vec{x} = \vec{0}$ would be a non-trivial linear combination producing zero, i.e. a dependency.

---

What is the difference between the **ambient space** and the **dimension** of a subspace?
?
The **ambient space** is how many entries a vector has (which $\mathbb{R}^n$ it is written in); the **dimension** is how many **independent directions** it actually has. This is why we say "$C(A)$ is an $r$-dimensional subspace of $\mathbb{R}^m$" — the subspace can have far fewer independent directions than the space it sits inside.

---

How do you compute a determinant via **elimination**?
?
Eliminate $A$ to the upper-triangular $U$, counting the row swaps:
$$\det A = (-1)^{\text{row swaps}} \times (\text{product of the pivots of } U)$$

---

What are the first two **defining properties** of the determinant?
?
1. $\det I = 1$ (the identity doesn't scale space).
2. A **row swap flips the sign** of the determinant.

---

What are the two **linearity properties** of the determinant (3a and 3b)?
?
The determinant is linear in each row separately:
- **3a.** Scaling one row by $t$ scales $\det$ by $t$.
- **3b.** Adding two rows that differ in one position splits the determinant into a sum:
$$\begin{vmatrix} a+a' & b+b' \ c & d \end{vmatrix} = \begin{vmatrix} a & b \ c & d \end{vmatrix} + \begin{vmatrix} a' & b' \ c & d \end{vmatrix}$$

---

Which matrices are guaranteed to have $\det A = 0$ from the basic properties?
?
Any matrix with **two equal rows** or a **zero row**. Swapping equal rows must flip the sign yet leave the matrix unchanged, so $\det = -\det$, hence $0$.

---

List the conditions that are **equivalent to $\det A = 0$** (singularity).
?
$A$ is singular, $\text{rank} < n$, the columns are linearly dependent, $A^{-1}$ doesn't exist, and $N(A)$ contains a non-zero vector. In elimination terms, **at least one pivot must be $0$**.

---

Why does **subtracting a multiple of one row from another** leave the determinant unchanged?
?
By property 3b the determinant splits into $\det A$ plus a determinant with a row that is a multiple of another row. By 3a and 4, that second term is $t \cdot 0 = 0$, so only $\det A$ remains. This is why the elimination step never changes $\det$.

---

What is the determinant of a **triangular matrix**?
?
The **product of the diagonal entries**: $\det = p_1 p_2 \cdots p_n$. Elimination clears the off-diagonal entries without changing $\det$, leaving $p_1 \cdots p_n \cdot \det I = p_1 \cdots p_n$.

---

How do you find the **inverse** with Gauss-Jordan elimination?
?
Augment $A$ with the identity and row-reduce until the left side becomes $I$:
$$[\,A \mid I\,] \to [\,I \mid A^{-1}\,]$$

---

Why is the determinant a **poor test for near-singularity**, and what should you use instead?
?
$\det(tA) = t^n \det(A)$, so the determinant scales with the size of the matrix. Even a perfectly well-behaved matrix with a small $t$ has a determinant close to $0$. Use the **condition number** instead:
$$\text{cond}(A) = \frac{\sigma_{\max}}{\sigma_{\min}}$$
$\text{cond} = 1$ is perfectly conditioned, a very large cond means numerically near-singular, and a singular matrix has $\text{cond} = \infty$.

---

What is the **dot product** of vectors $a$ and $b$, and what is the **norm** of $x$?
?
$$a^T b = \sum_i a_i b_i \qquad \|x\| = \sqrt{x^T x}$$

---

When are two vectors **orthogonal**?
?
When their dot product is zero: $a^T b = 0$.

---

What does $A\vec{x} = \vec{0}$ say about $\vec{x}$ geometrically?
?
$\vec{x}$ is **perpendicular to every row of $A$**: (row 1) $\cdot\, \vec{x} = 0$, (row 2) $\cdot\, \vec{x} = 0$, and so on.

---

What is the **Gram matrix**, and what are its two key properties?
?
The Gram matrix is $A^T A$, the matrix of all dot products between columns of $A$.
1. It is always **symmetric**: $G_{ij} = G_{ji}$.
2. $A^T A$ is **invertible exactly when $A$ has independent columns**.

---

How do you compute the **covariance matrix** from a data matrix?
?
1. **Demean** each column to get $\tilde{R}$.
2. Compute $\Sigma = \dfrac{\tilde{R}^T \tilde{R}}{T-1}$, where $T$ is the number of observations.

It is the Gram matrix of the demeaned columns, scaled by $1/(T-1)$.

---

How do you read the entries of the **covariance matrix** $\Sigma$?
?
The diagonal entries $\Sigma_{ii}$ are the **variances** of each variable; the off-diagonal entries $\Sigma_{ij}$ are the **covariances** between variables $i$ and $j$.

---

How is **correlation** expressed with dot products?
?
Correlation is the dot product of the demeaned vectors, normalized by their lengths (the cosine of the angle between them):
$$\rho = \frac{\tilde{a}^T \tilde{b}}{\|\tilde{a}\|\,\|\tilde{b}\|} \in [-1, 1]$$

---

What is the **portfolio variance** for weights $w$ and covariance matrix $\Sigma$, and what limits the rank of $\Sigma$?
?
$$\sigma_p^2 = w^T \Sigma w$$
With $T$ observations of $N$ assets, $\text{rank}(\Sigma) \le \min(T-1, N)$. If $T-1 < N$, $\Sigma$ is singular and cannot be inverted.

---

What are the **four fundamental subspaces**, and which pairs are orthogonal?
?
For an $m \times n$ matrix of rank $r$:
- $\text{Row}(A) \perp N(A)$ in $\mathbb{R}^n$, with dimensions $r + (n - r) = n$.
- $C(A) \perp N(A^T)$ in $\mathbb{R}^m$, with dimensions $r + (m - r) = m$.

---

How does **orthogonality to $N(A^T)$** tell you whether $A\vec{x} = \vec{b}$ is solvable?
?
If $\vec{b} \perp N(A^T)$, then $\vec{b}$ lies in $C(A)$, which is equivalent to $A\vec{x} = \vec{b}$ being solvable.

---

How do you **project $\vec{b}$ onto a line** along $\vec{a}$ (in dimension 2)?
?
- Solve: $\hat{x} = \dfrac{a^T b}{a^T a}$
- Point: $p = a\hat{x}$
- Matrix: $P = \dfrac{a a^T}{a^T a}$
- Check: $a^T e = 0$, where $e = b - p$

---

How do you **project $\vec{b}$ onto $C(A)$**?
?
- Solve: $A^T A \hat{x} = A^T b$
- Point: $p = A\hat{x}$
- Matrix: $P = A(A^T A)^{-1} A^T$
- Check: $A^T e = 0$, where $e = b - p$

---

How does **Pythagoras** apply to a projection $b = p + e$?
?
The projection $p$ and the error $e$ are orthogonal, so
$$\|b\|^2 = \|e\|^2 + \|p\|^2$$

---

What are the three **finance links** to projection?
?
- **Demeaning** is a projection onto the ones vector $\mathbf{1}$ (the residual is the demeaned data).
- $\beta = \dfrac{a^T b}{a^T a}$ on demeaned returns is the projection coefficient.
- $R^2 = \dfrac{\|p\|^2}{\|b\|^2}$ measures how much of $b$ the projection $p$ explains.

---

What is the **least-squares problem**, and why is its solution a projection?
?
When $b \notin C(A)$, $A\vec{x} = \vec{b}$ has no solution, so minimize $\|A\vec{x} - \vec{b}\|^2$. The minimum is reached when the error is orthogonal to $C(A)$:
$$A^T(A\hat{x} - b) = 0 \iff A^T A \hat{x} = A^T b$$
with $p = A\hat{x}$ and $e = b - p$.

---

What is the **recipe for solving least squares** numerically?
?
1. Form $A^T A$ and $A^T b$.
2. Solve $A^T A \hat{x} = A^T b$ **by elimination** for $\hat{x}$; don't form $(A^T A)^{-1}$.
3. Compute $p = A\hat{x}$ and check $A^T e = 0$.

---

What is the **shortcut** for projecting $b$ when $\dim N(A^T) = m - r = 1$?
?
$N(A^T)$ is a single line along some $y$, so compute the error directly and subtract:
1. $e = \dfrac{y^T b}{y^T y}\, y$ and $p = b - e$
2. Check $y^T p = 0$.

---

Which **NumPy** calls solve least squares, and what is the numerical pitfall?
?
`np.linalg.lstsq(A, b, rcond=None)` or `np.linalg.solve(A.T @ A, A.T @ b)`.
Forming $A^T A$ squares the condition number: $\text{cond}(A^T A) = \text{cond}(A)^2$, so a large cond means an unstable result. Prefer `lstsq`.
