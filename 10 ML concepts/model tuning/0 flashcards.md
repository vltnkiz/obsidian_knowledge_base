#flashcards/ml/optuna-tuning

What are the three core conceptual steps required to perform hyperparameter optimization using Optuna?
?
1. **Define an objective function** (takes a `trial` object, suggests parameters, evaluates the model, and returns the score).
2. **Create a study** (specifies whether to `"minimize"` or `"maximize"` the target metric).
3. **Optimize** (runs the objective function over a specified number of trials, `n_trials`).

---

Within an Optuna objective function, what do `trial.suggest_float()` and `trial.suggest_int()` do?
?
- `trial.suggest_float()`: Dynamically samples a continuous floating-point value within a given range. Setting `log=True` enables logarithmic scaling (ideal for parameters like `learning_rate`).
- `trial.suggest_int()`: Dynamically samples an integer value within a given range (ideal for discrete parameters like `num_leaves`).

---

Write out the standard syntax used to create an Optuna study that targets a lower error metric, and the command to run it for 30 trials.
?
```python
study = optuna.create_study(direction="minimize")
study.optimize(objective, n_trials=30)