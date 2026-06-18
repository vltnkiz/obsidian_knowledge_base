## Array Creation

```python
arr = np.array([1, 2, 3, 4, 5])
arr = np.linspace(1, 10, 10)    # 10 evenly spaced values from 1 to 10
arr = np.arange(12)             # [0, 1, 2, ..., 11]

matrix = np.array([[1,2,3], [4,5,6], [7,8,9]])
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
## Stats

#### min  / max
```python
matrix = np.array([[1,2,3], [4,5,6], [7,8,9]])
np.max(arr)             # max of full array (9)
np.min(arr)             # min of full array (1)
np.max(arr, axis = 0)   # max by col ([3, 6, 9])
```
#### mean  / standard deviation
```python
scores = np.array([85, 90, 78, 92, 88, 74])
np.mean(scores)    # average
np.std(scores)     # standard deviation
```