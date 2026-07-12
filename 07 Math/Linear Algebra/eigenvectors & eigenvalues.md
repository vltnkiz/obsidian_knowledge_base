
---

## 1. Core Geometric Intuition
* **The General Rule:** When a matrix transforms 2D or 3D space, it shifts and moves vectors. Most vectors get knocked completely off their **span** (the line passing through the vector's tail at the origin and its tip). 
* **The Special Exception:** Some special vectors remain entirely on their own span after the transformation. The matrix does not rotate them; it merely stretches, squishes, or flips them like a scalar.

### Definitions:
* [[eigenvector]]: A non-zero vector $\vec{v}$ that remains on the same line (span) after a linear transformation is applied.
* [[eigenvalue]] ($\\lambda$): The scaling factor by which the eigenvector stretches, squishes, or reverses direction.

### Physical & Geometric Examples:
* **3D Rotation Axis:** If you find the eigenvector for a 3D rotation, its eigenvalue will be $1$ (since lengths don't change), and this vector defines the physical **axis of rotation**. It's much easier to define a 3D rotation by an axis and an angle than by a full $3 \times 3$ matrix.
* **Negative Eigenvalues:** An eigenvalue can be negative (e.g., $-1/2$). This means the eigenvector reverses direction (flips) and is cut in half, but it still lies along the same directional line/span.

---

## 2. The Algebraic Framework & Computation

Symbolically, the definition of an eigenvector is:
$$A \vec{v} = \lambda \vec{v}$$

Where $A$ is the transformation matrix, $\vec{v}$ is the eigenvector, and $\lambda$ is the eigenvalue.

### The Derivation:
To solve this equation, we cannot directly subtract the scalar $\lambda$ from the matrix $A$. We must rewrite the scalar multiplication into a matrix-vector format by multiplying $\lambda$ by the **Identity Matrix ($I$)**:
$$A \vec{v} = (\lambda I) \vec{v}$$

Subtracting the right side gives:
$$(A - \lambda I) \vec{v} = \vec{0}$$

### Finding Non-Zero Solutions
We want to find a **non-zero** vector $\vec{v}$ that satisfies this equation. The only way a modified matrix $(A - \lambda I)$ can squish a non-zero vector down to the zero vector is if that transformation collapses space into a lower dimension.

A collapse in dimension means the **determinant** of the matrix must equal zero:
$$\det(A - \lambda I) = 0$$

### The Core Procedure:
1. **Find Eigenvalues ($\\lambda$):** Solve the characteristic equation $\det(A - \lambda I) = 0$. This yields a polynomial whose roots are the eigenvalues.
2. **Find Eigenvectors ($\vec{v}$):** Plug a solved $\lambda$ back into the matrix $(A - \lambda I)$ and solve the resulting system of linear equations $(A - \lambda I)\vec{v} = \vec{0}$ to find the vectors that get collapsed to zero.

---

## 3. Special Cases to Keep in Mind

* **Rotations in 2D:** A $90^\circ$ rotation has **no real eigenvectors** because every single vector is knocked off its span. Solving $\det(A - \lambda I) = 0$ for a rotation leads to imaginary roots (like $\lambda = \pm i$).
* **Shears:** A horizontal shear matrix $\begin{bmatrix} 1 & 1 \\ 0 & 1 \end{bmatrix}$ fixes $\hat{i}$ on the x-axis, meaning the x-axis is an entire line of eigenvectors with $\lambda = 1$. However, it has *only* that single line of eigenvectors; no other lines remain on their span.
* **Uniform Scaling:** A matrix that scales everything uniformly by 2 has only one eigenvalue ($\lambda = 2$), but **every single vector** in the plane is an eigenvector.

---

## 4. The Eigenbasis and Diagonalization

If a transformation has enough eigenvectors to span the entire space, you can choose a set of eigenvectors to serve as your new coordinate system's basis vectors. This is called an **Eigenbasis**.

### Why an Eigenbasis Matters: Diagonal Matrices
If you perform a change of basis using an Eigenbasis, the resulting matrix will be a **Diagonal Matrix** (zeros everywhere except the diagonal entries):
$$D = \begin{bmatrix} \lambda_1 & 0 \\ 0 & \lambda_2 \end{bmatrix}$$

The diagonal entries are exactly the eigenvalues of those eigenvectors.

### The Power of Diagonalization:
Computing high powers of a standard matrix (e.g., $A^{100}$) by hand is an absolute nightmare. However, computing the power of a diagonal matrix is trivial because it only scales the respective basis vectors repeatedly:
$$D^{100} = \begin{bmatrix} \lambda_1^{100} & 0 \\ 0 & \lambda_2^{100} \end{bmatrix}$$

Using the similarity transformation concept from Chapter 13 ($P^{-1}AP$), you can easily:
1. Translate a standard vector into the Eigenbasis ($P^{-1}$).
2. Perform the complex exponentiation effortlessly ($D^{100}$).
3. Translate the final result back to your standard coordinate system ($P$).
