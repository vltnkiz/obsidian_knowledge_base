#flashcards/statistics/evaluation-metrics

What are the Alternative names for a False Negative and a False Positive error in statistical testing?
?
- **False Negative:** Also known as a Type I error.
- **False Positive:** Also known as a Type II error.

---

What is the formula for Accuracy, and what conceptual question does it answer?
?
$\text{Accuracy} = \frac{\text{TP} + \text{TN}}{\text{TP} + \text{FP} + \text{TN} + \text{FN}}$
It answers: "Out of all the predictions made, how many were actually right?"

---

What is the formula for Precision, and what is its primary focus?
?
$\text{Precision} = \frac{\text{TP}}{\text{TP} + \text{FP}}$
It focuses directly on the quality of the positive predictions, answering: "Out of all the instances predicted as positive, how many were truly positive?"

---

What is the formula for Recall, and what capacity does it measure?
?
$\text{Recall} = \frac{\text{TP}}{\text{TP} + \text{FN}}$
It measures how good the model is at finding and capturing all the actual positive instances in the data.

---

What is the formula for the F1-Score, and why is it used?
?
$\text{F1-score} = \frac{2 \times \text{Precision} \times \text{Recall}}{\text{Precision} + \text{Recall}}$
It is used to combine precision and recall into a single metric to effectively balance their structural trade-offs.