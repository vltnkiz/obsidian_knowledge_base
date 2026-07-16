## Array Creation

```python
arr = np.array([1, 2, 3, 4, 5])
arr = np.linspace(1, 10, 10)    # 10 evenly spaced values from 1 to 10
arr = np.arange(12)             # [0, 1, 2, ..., 11]

matrix = np.array([[1,2,3], [4,5,6], [7,8,9]])

# Identity matrix (1s on diagonal, 0s elsewhere)
identity = np.eye(3)            # [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
identity = np.eye(3, 4)         # 3x4 matrix with 1s on diagonal
```

---

## Shape

```python
arr.shape       # (5,)
matrix.shape    # (3, 3)
```

---

## Reshape

```python
arr = np.arange(12)
matrix = arr.reshape(3, 4)
print(matrix)
```

---

## Flatten vs Ravel

```python
# flatten: returns a copy (leaves original unchanged if modified)
flat_arr = matrix.flatten()    # [0, 1, 2, ..., 11]

# ravel: returns a view (modifying it changes the original matrix)
row_arr = matrix.ravel()       # [0, 1, 2, ..., 11]
```

---

## Indexing, Slicing, Copy vs View

#### indexing & slicing

```python
# matrix[row_slice, col_slice]
sub_matrix = matrix[0:2, 1:3]  # rows 0-1, columns 1-2
```

#### fancy indexing

```python
arr = np.array([10, 20, 30, 40, 50])

# Integer array indexing - select elements at specific indices
indices = [0, 2, 4]
arr[indices]                    # [10, 30, 50]

# Multiple dimensions
matrix = np.arange(25).reshape(5, 5)
rows = [0, 2, 4]
cols = [1, 3, 4]
matrix[rows, cols]              # elements at (0,1), (2,3), (4,4)

# ⚠️ Fancy indexing always creates a COPY (unlike basic slicing)
fancy_arr = arr[[0, 1, 2]]
fancy_arr[0] = 999              # arr remains unchanged
```

#### copy vs view

```python
# Slicing creates a VIEW (modifying it alters the original array)
view_arr = arr[0:3]
view_arr[0] = 99               # changes arr[0] to 99 too!

# Fancy slicing create a COPY
copy_arr = arr[[0, 1]]
copy_arr[0] = 99               # arr remains unchanged

# .copy() creates a COPY (modifying it does NOT alter the original array)
copy_arr = arr[0:3].copy()
copy_arr[0] = -1               # arr remains unchanged
```

---

## Masking

```python
arr = np.array([5, 12, 3, 7, 21])
mask = arr > 10
print(arr[mask])    # [12 21]
```

---

## Replacement

```python
arr = np.array([1, -2, 3, -4, 5])
only_positive = np.where(arr < 0, 0, arr)
print(only_positive)    # [1 0 3 0 5]
```

---

## Stacking

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# vstack: stacks arrays vertically (row-wise)
v_stack = np.vstack((a, b))    # [[1, 2, 3], [4, 5, 6]]

# hstack: stacks arrays horizontally (column-wise)
h_stack = np.hstack((a, b))    # [1, 2, 3, 4, 5, 6]
```

---

## Dot Product

```python
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])

# Matrix multiplication / Dot product
result = np.dot(A, B)          # or A @ B
# [[19, 22], [43, 50]]
```

---

## Stats

#### min / max

```python
matrix = np.array([[1,2,3], [4,5,6], [7,8,9]])
np.max(matrix)             # max of full array (9)
np.min(matrix)             # min of full array (1)
np.max(matrix, axis = 0)   # max by col ([7, 8, 9])
```

#### mean / standard deviation

```python
scores = np.array([85, 90, 78, 92, 88, 74])
np.mean(scores)    # average
np.std(scores)     # standard deviation
```

---

## Sorting

```python
arr = np.array([3, 1, 4, 1, 5, 9, 2])

# np.sort: returns a sorted COPY (original unchanged)
sorted_arr = np.sort(arr)       # [1, 1, 2, 3, 4, 5, 9]

# arr.sort(): sorts IN-PLACE (modifies original)
arr.sort()                      # arr is now [1, 1, 2, 3, 4, 5, 9]

# Sort 2D arrays
matrix = np.array([[3, 1, 4], [1, 5, 9], [2, 6, 5]])
np.sort(matrix, axis=0)         # sort each column
np.sort(matrix, axis=1)         # sort each row
np.sort(matrix, axis=None)      # flatten then sort

# Get indices that would sort the array
arr = np.array([30, 10, 20])
indices = np.argsort(arr)       # [1, 2, 0]
arr[indices]                    # [10, 20, 30]
```

---

## ndim

```python
arr = np.array([1, 2, 3])
matrix = np.array([[1, 2], [3, 4]])
tensor = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])

arr.ndim       # 1
matrix.ndim    # 2
tensor.ndim    # 3
```

---

## np.arange vs Python range()

```python
# Python range(): returns an iterator of integers only
list(range(0, 1, 0.2))       # ❌ TypeError: float step not allowed

# np.arange(): returns an ndarray, supports floats
np.arange(0, 1, 0.2)         # [0.  0.2 0.4 0.6 0.8]
np.arange(5)                  # [0 1 2 3 4]
np.arange(1, 10, 2)           # [1 3 5 7 9]

# ⚠️ Prefer np.linspace() for float steps (avoids floating-point edge cases)
np.linspace(0, 1, 5)          # [0.   0.25 0.5  0.75 1.  ] — always includes endpoint
```

---

## Step Indexing (Chained Slices)

```python
matrix = np.arange(25).reshape(5, 5)
# matrix[1::2] → rows 1, 3       (start at row 1, step by 2)
# [::2]        → columns 0, 2, 4 (all rows, step by 2)
result = matrix[1::2, ::2]     # equivalent of matrix[1::2][::, ::2]

# Chained form
result = matrix[1::2][::, ::2] # same result — outer slice then inner slice
# Note: chaining creates intermediate arrays; prefer comma syntax for efficiency
```

---

## np.stack vs np.concatenate

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# np.stack: creates a NEW axis — increases ndim
np.stack((a, b), axis=0)       # [[1,2,3],[4,5,6]]  shape: (2, 3)
np.stack((a, b), axis=1)       # [[1,4],[2,5],[3,6]] shape: (3, 2)

# np.concatenate: joins along an EXISTING axis — keeps same ndim
np.concatenate((a, b), axis=0) # [1, 2, 3, 4, 5, 6] shape: (6,)

# With 2D arrays (same shape required for stack)
A = np.array([[1, 2], [3, 4]])
B = np.array([[5, 6], [7, 8]])
np.concatenate((A, B), axis=0) # shape: (4, 2) — more rows
np.concatenate((A, B), axis=1) # shape: (2, 4) — more cols
np.stack((A, B), axis=0)       # shape: (2, 2, 2) — new depth axis
```

---

## np.nan Rules

```python
# np.nan is a float — arithmetic with it always returns nan
np.nan + 5          # nan
np.nan * 0          # nan
np.nan == np.nan    # False  ← nan is never equal to itself!
np.nan is np.nan    # True   ← but it's the same object

# Check for nan with:
np.isnan(np.nan)    # True

# nan-safe aggregation functions
arr = np.array([1, 2, np.nan, 4])
np.sum(arr)         # nan
np.nansum(arr)      # 7.0  ← ignores nan
np.nanmean(arr)     # 2.333...
np.nanmax(arr)      # 4.0
```

---

## np.clip

```python
arr = np.array([1, 5, 10, 15, 20])

# Clamp all values to [min, max] range
np.clip(arr, 5, 15)    # [ 5  5 10 15 15]
                        # values below 5 → 5, above 15 → 15

# Use None to clip only one side
np.clip(arr, 5, None)  # [ 5  5 10 15 20]  — clip min only
np.clip(arr, None, 15) # [ 1  5 10 15 15]  — clip max only

# Common use: normalize scores, cap sensor readings, bound predictions
```

---

## np.linalg.inv

```python
A = np.array([[1, 2], [3, 4]])

# Compute the inverse of a square matrix (A⁻¹ such that A @ A⁻¹ = I)
A_inv = np.linalg.inv(A)
# [[-2.   1. ]
#  [ 1.5 -0.5]]

# Verify: A @ A_inv should give identity matrix
np.allclose(A @ A_inv, np.eye(2))    # True

# ⚠️ Singular (non-invertible) matrices raise LinAlgError
# ⚠️ For solving Ax = b, prefer np.linalg.solve(A, b) — more numerically stable
```