#flashcards/ml/explainability

How are partial plots constructed
?
After a model is fit, alter the value for one variable, fixing other variables. Then plot the average predicted outcome. (see graph)
<!--SR:!2026-06-03,2,250-->

How is permutation importance computed
?
After a model if fit, randomly shuffles one column and observe drop in model accuracy. This is the permutation importance.
<!--SR:!2026-06-03,2,250-->

What are the pros of the method
?
Model agnostic. Tied to model performance.
<!--SR:!2026-06-03,2,252-->

What are the cons
?
Correlated features.
<!--SR:!2026-06-13,12,272-->
