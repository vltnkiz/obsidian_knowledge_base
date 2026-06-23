## DataFrame & Series

```python
import pandas as pd

# Series
s = pd.Series([10, 20, 30], index=["a", "b", "c"])

# DataFrame from dict
df = pd.DataFrame({
    "name":  ["Alice", "Bob", "Charlie"],
    "age":   [25, 30, 35],
    "score": [88, 92, 79]
})

# DataFrame from list of dicts
df = pd.DataFrame([
    {"name": "Alice", "age": 25},
    {"name": "Bob",   "age": 30}
])
```

---
## Indexing

```python
df["name"]            # column → Series
df[["name", "age"]]   # columns → DataFrame

df.loc[0]             # row by label
df.loc[0, "name"]     # row + column by label

df.iloc[0]            # row by position
df.iloc[0, 1]         # row + column by position

df.iloc[0:3]          # slice rows by position
```

---
## Masking

```python
df[df["age"] > 28]                              # single condition
df[(df["age"] > 28) & (df["score"] >= 80)]     # multiple conditions
df[df["name"].isin(["Alice", "Charlie"])]       # isin filter
```

---
## `where` / `map` / `apply`

```python
# where — keep value if condition is True, else replace
df["score"] = df["score"].where(df["score"] >= 80, other=0)

# map — element-wise transform on a Series
df["name"] = df["name"].map(str.lower)
df["grade"] = df["score"].map({88: "B", 92: "A", 79: "C"})

# apply — apply a function along rows or columns
df["score_scaled"] = df["score"].apply(lambda x: x / 100)
df["summary"] = df.apply(lambda row: f"{row['name']} ({row['age']})", axis=1)
```

---
## Joins

```python
orders = pd.DataFrame({"user_id": [1, 2, 3], "amount": [50, 30, 70]})
users  = pd.DataFrame({"user_id": [1, 2, 4], "name": ["Alice", "Bob", "Dan"]})

pd.merge(orders, users, on="user_id", how="inner")   # only matching rows
pd.merge(orders, users, on="user_id", how="left")    # all orders, fill missing
pd.merge(orders, users, on="user_id", how="outer")   # all rows from both

# Concatenate
pd.concat([df1, df2], ignore_index=True)             # stack rows
pd.concat([df1, df2], axis=1)                        # stack columns
```

---
## Group By

```python
df = pd.DataFrame({
    "dept":   ["HR", "IT", "HR", "IT", "IT"],
    "salary": [50, 90, 60, 80, 95]
})

df.groupby("dept")["salary"].mean()     # mean salary per dept
df.groupby("dept")["salary"].sum()      # total salary per dept
df.groupby("dept").agg(
    avg_salary=("salary", "mean"),
    headcount=("salary", "count")
)                                        # multiple aggregations
```