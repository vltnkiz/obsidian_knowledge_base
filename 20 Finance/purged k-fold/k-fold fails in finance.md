#### Correlated features
In finance prices, returns, volatility are correlated to previous observations. This can cause leakage as we could train with data from the future causing [[leakage]] with standard [[k-fold]].

Say we have this data
> Monday:    -2.1%   ← big drop
> Tuesday:   -1.3%   ← still falling (correlated with Monday)
> Wednesday: -0.8%   ← recovering slowly
> Thursday:  +0.5%   ← bouncing back
> Friday:    +1.1%   ← continued bounce

If we train with the following:
> FOLD A (train): Monday, Wednesday, Friday
> FOLD B (test):  Tuesday, Thursday

Information about Tuesday is contained inside Wednesday so we are testing a model that was trained with future data (look-ahead bias).

---
#### Overlapping labels
When building labels based on bars of data (example: BUY/SELL label on 20-day window of returns)

K-fold might end up:
>TRAIN: Day 1, Day 3, Day 8, Day 15 ... 
>TEST: Day 2, Day 5, Day 9, Day 14 ...

The label constructed with for Day 1 already peaked at data from Day 1 to 20. So the test set has leaked into training set.
