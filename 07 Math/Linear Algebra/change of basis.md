
---

## 1. The Language of Coordinate Systems
* **Standard Coordinates:** When we specify a vector with coordinates like $\begin{bmatrix} 3 \\ 2 \end{bmatrix}$, we are implicitly scaling standard basis vectors:
  $$\begin{bmatrix} 3 \\ 2 \end{bmatrix} = 3\hat{i} + 2\hat{j}$$
  * $\hat{i}$ is a unit vector of length 1 pointing right.
  * $\hat{j}$ is a unit vector of length 1 pointing up.
* **Alternate Coordinates:** Different observers can use different basis vectors to describe the exact same physical space. 
  * Suppose a friend, Jennifer, uses basis vectors $\vec{b}_1$ and $\vec{b}_2$.
  * In our system, her basis vectors might look like $\vec{b}_1 = \begin{bmatrix} 2 \\ 1 \end{bmatrix}$ and $\vec{b}_2 = \begin{bmatrix} -1 \\ 1 \end{bmatrix}$.
  * In *her* system, however, they are simply her unit vectors, defined natively as $\begin{bmatrix} 1 \\ 0 \end{bmatrix}$ and $\begin{bmatrix} 0 \\ 1 \end{bmatrix}$.
* **The Grid Construct:** The grid lines we draw are not intrinsic to space; they are merely visual tools dependent entirely on our choice of basis vectors. Both systems share the same origin $\begin{bmatrix} 0 \\ 0 \end{bmatrix}$, but have differently oriented grid lines and spacing.

---

## 2. Translating Vectors Between Languages

### From Jennifer's Language to Our Language
If Jennifer describes a vector as $\begin{bmatrix} -1 \\ 2 \end{bmatrix}$, she means:
$$\vec{v} = -1\vec{b}_1 + 2\vec{b}_2$$

To express this in our coordinates, we substitute our definitions for her basis vectors:
$$\vec{v} = -1\begin{bmatrix} 2 \\ 1 \end{bmatrix} + 2\begin{bmatrix} -1 \\ 1 \end{bmatrix} = \begin{bmatrix} -4 \\ 1 \end{bmatrix}$$

This is equivalent to **Matrix-Vector Multiplication**, where the columns of the matrix are Jennifer's basis vectors written in our standard system:
$$\begin{bmatrix} 2 & -1 \\ 1 & 1 \end{bmatrix} \begin{bmatrix} -1 \\ 2 \end{bmatrix} = \begin{bmatrix} -4 \\ 1 \end{bmatrix}$$

* **Geometric Meaning:** Geometrically, this **Change of Basis Matrix** transforms our standard grid into Jennifer's grid. 
* **Numerical Paradox:** Numerically, it does the reverse: it takes a vector written in *her* coordinates and translates it into *our* coordinates. It transforms our standard-coordinate "misconception" of what her numbers mean into the actual spatial vector she intended.

### From Our Language to Jennifer's Language
To translate a vector from our coordinates (e.g., $\begin{bmatrix} 3 \\ 2 \end{bmatrix}$) into Jennifer's system, we must undo the conversion by using the **Inverse Change of Basis Matrix**:
$$P^{-1} \vec{v}_{our} = \vec{v}_{jennifer}$$

Using the inverse matrix for this system yields her native coordinates: $\begin{bmatrix} 5/3 \\ 1/3 \end{bmatrix}$.

---

## 3. Translating Transformations Between Languages
We describe a linear transformation (like a $90^\circ$ counterclockwise rotation) by tracking where our basis vectors land. If Jennifer wants to apply that same physical transformation using her coordinate system, she needs a matrix that tracks where *her* basis vectors land, described in *her* language.

To find this, we perform a three-step matrix composition, reading from right to left:

1. **Translate to Our Language:** Take Jennifer's vector input and multiply by the change of basis matrix $P$ to see what it looks like in our coordinates.
2. **Apply Transformation:** Multiply by our standard transformation matrix $M$ to compute where it lands in our coordinates.
3. **Translate Back to Jennifer's Language:** Multiply by the inverse change of basis matrix $P^{-1}$ to shift the output back into her coordinate language.

### The Similarity Transformation Formula
The final matrix representing the transformation as Jennifer sees it is written as:
$$A = P^{-1} M P$$

* $P$ shifts the perspective from Jennifer's language to ours.
* $M$ executes the transformation in our native system.
* $P^{-1}$ shifts the perspective back to Jennifer's system.

### Mathematical Empathy
Whenever you see an expression in the form $P^{-1} M P$, it represents a **mathematical empathy**: the inner matrix $M$ is a transformation as *you* see it, the outer matrices represent the shift in perspective, and the complete product is that exact same physical transformation as *someone else* sees it.
