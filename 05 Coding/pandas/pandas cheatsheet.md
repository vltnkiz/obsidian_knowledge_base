## Creating Data Structures

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

## Accessing Data (Indexing & Selection)

```python
# Column access
df["name"]            # column Series
df[["name", "age"]]   # columns DataFrame

# Row & element access by label
df.loc[0]             # row by label
df.loc[0, "name"]     # row + column by label

# Row & element access by position
df.iloc[0]            # row by position
df.iloc[0, 1]         # row + column by position
df.iloc[0:3]          # slice rows by position

# Filtering / Masking
df[df["age"] > 28]                             # single condition
df[(df["age"] > 28) & (df["score"] >= 80)]     # multiple conditions
df[df["name"].isin(["Alice", "Charlie"])]      # isin filter
```

---

## Transforming Values (where, map, apply)

```python
# where : keep value if condition is True, else replace
df["score"] = df["score"].where(df["score"] >= 80, other=0)

# map : element-wise transform on a Series
df["name"] = df["name"].map(str.lower)
df["grade"] = df["score"].map({88: "B", 92: "A", 79: "C"})

# apply : apply a function along rows or columns
df["score_scaled"] = df["score"].apply(lambda x: x / 100)
df["summary"] = df.apply(lambda row: f"{row['name']} ({row['age']})", axis=1)
```

---

## Data Type Conversion (astype, to_string)

```python
# astype to convert dtype of a Series or DataFrame column(s)
df = pd.DataFrame({"a": [1, 2, 3], "b": [4.0, 5.5, 6.2]})
df["a"] = df["a"].astype(float)     # int -> float
df = df.astype({"b": "int64"})     # change dtype using a dict

# to_string to render values as a string (useful for display or export)
df["a_str"] = df["a"].astype(str)  # explicit conversion to string dtype
df["b_text"] = df["b"].to_string(index=False)[:10]  # not typical for column-wise use

# Note: prefer astype for dtype changes; to_string returns a single string
# representing the entire Series/DataFrame (for printing), not a column of strings.
```

---

## Column Operations (Rename, Shape)

```python
# Renaming columns
df = df.rename(columns={"name": "full_name", "age": "years"})
df.columns = ["full_name", "years", "score"]                    # all at once
df = df.rename(columns=str.lower)                               # via function
df.rename(columns={"score": "points"}, inplace=True)            # in-place

# Shape / Dimensions
df = pd.DataFrame({"a": [1, 2, 3], "b": [4, 5, 6]})
df.shape        # (3, 2) -> (rows, columns)
df.shape[0]     # 3  -> number of rows
df.shape[1]     # 2  -> number of columns
len(df)         # same as df.shape[0]
len(df.columns) # same as df.shape[1]
```

---

## Combining Data (Join, Concatenate)

```python
orders = pd.DataFrame({"user_id": [1, 2, 3], "amount": [50, 30, 70]})
users  = pd.DataFrame({"user_id": [1, 2, 4], "name": ["Alice", "Bob", "Dan"]})

# Merge (SQL-like joins)
pd.merge(orders, users, on="user_id", how="inner")   # only matching rows
pd.merge(orders, users, on="user_id", how="left")    # all orders, fill missing
pd.merge(orders, users, on="user_id", how="outer")   # all rows from both

# Concatenate
pd.concat([df1, df2], ignore_index=True)             # stack rows
pd.concat([df1, df2], axis=1)                        # stack columns
```

---

## Grouping & Aggregation (groupby, agg, nth)

```python
df = pd.DataFrame({
    "dept":   ["HR", "IT", "HR", "IT", "IT"],
    "salary": [50, 90, 60, 80, 95]
})

# Basic groupby aggregations
df.groupby("dept")["salary"].mean()     # mean salary per dept
df.groupby("dept")["salary"].sum()      # total salary per dept

# Multiple aggregations
df.groupby("dept").agg(
    avg_salary=("salary", "mean"),
    headcount=("salary", "count")
)

# nth() picks the nth row (0-indexed) within each group
df.groupby("dept").nth(0)               # first row of each group
df.groupby("dept").nth(-1)              # last row of each group
df.groupby("dept").nth([0, -1])         # first and last row of each group
```

---

## Pivoting Data (pivot, pivot_table)

```python
df = pd.DataFrame({
    "date":     ["2024-01-01", "2024-01-01", "2024-01-02", "2024-01-02"],
    "product":  ["A", "B", "A", "B"],
    "sales":    [100, 150, 200, 180]
})

# pivot : reshape to wide format (one row per unique index value)
# requires unique combinations of index/columns values
df_wide = df.pivot(index="date", columns="product", values="sales")
# Result: rows=dates, columns=products, values=sales

# pivot_table : like pivot but can handle non-unique combinations via aggregation
df_wide = df.pivot_table(
    index="date",
    columns="product",
    values="sales",
    aggfunc="sum"  # aggregate function (sum, mean, count, etc.)
)

# Multiple aggregations in pivot_table
df_wide = df.pivot_table(
    index="date",
    columns="product",
    values="sales",
    aggfunc=["sum", "mean"]
)

# Multiple values columns
df_wide = df.pivot_table(
    index="date",
    columns="product",
    values=["sales", "quantity"],  # pivot multiple columns
    aggfunc="sum"
)

# margins : add row/column totals
df_wide = df.pivot_table(
    index="date",
    columns="product",
    values="sales",
    aggfunc="sum",
    margins=True  # adds "All" row and column with totals
)
```

---

## Detecting Duplicates (duplicated, drop_duplicates)

```python
df = pd.DataFrame({"name": ["Alice", "Bob", "Alice", "Dan"], "age": [25, 30, 25, 40]})

# boolean mask where rows are duplicates (first occurrence is False)
df["is_dup"] = df.duplicated(keep="first")

# drop duplicate rows
df_unique = df.drop_duplicates(keep="first")

# find duplicates considering subset of columns
df[ df.duplicated(subset=["name", "age"]) ]
```

---

## Time Series & Window Functions (shift, rolling)

```python
df = pd.DataFrame({"value": [10, 20, 30, 40, 50, 60]})

# shift : offset values by rows
df["value_prev"] = df["value"].shift(1)    # previous value
df["value_next"] = df["value"].shift(-1)   # next value
df["change"] = df["value"] - df["value"].shift(1)  # change from previous

# shift within groups
df["dept_prev"] = df.groupby("dept")["salary"].shift(1)

# rolling : compute statistics over sliding windows
df["rolling_mean"] = df["value"].rolling(window=3).mean()
df["rolling_sum"] = df["value"].rolling(window=3).sum()
df["rolling_max"] = df["value"].rolling(window=3).max()
df["rolling_min"] = df["value"].rolling(window=3).min()
df["rolling_std"] = df["value"].rolling(window=3).std()

# min_periods: minimum observations required (default = window size)
df["rolling_mean_2"] = df["value"].rolling(window=3, min_periods=1).mean()

# center the window
df["rolling_centered"] = df["value"].rolling(window=3, center=True).mean()

# rolling on grouped data
df["dept_rolling"] = df.groupby("dept")["salary"].rolling(window=2).mean()
```

---

## Utility Functions (zip with pandas)

```python
# Python built-in zip can be handy with pandas for element-wise operations
names = ["Alice", "Bob", "Charlie"]
scores = [88, 92, 79]

# Create DataFrame from zipped lists
df = pd.DataFrame(list(zip(names, scores)), columns=["name", "score"]) 

# Use zip in apply for parallel iteration over multiple columns/iterables
df["summary"] = [f"{n} ({s})" for n, s in zip(df["name"], df["score"]) ]

# When combining Series of different lengths, zip stops at shortest —
# use itertools.zip_longest if you need to fill missing values.
```
