---
subject: Math
topic: log loss
---

#flashcards/math/log-loss

What is the formula for log loss (cross-entropy loss) in the general multi-class setting?
?
L[Y,P] = −N⁻¹ ΣₙΣₖ yₙ,ₖ log[pₙ,ₖ], where Y is the matrix of one-hot encoded labels (yₙ,ₖ=1 if sample n belongs to class k), and P is the matrix of predicted probabilities pₙ,ₖ (with Σₖ pₙ,ₖ = 1 for each sample).

---

When a sample's true class k has yₙ,ₖ=1, what does the loss reduce to, and how does it behave for confident-correct vs. confident-wrong predictions?
?
The loss reduces to −log(pₙ,ₖ). If the model predicts pₙ,ₖ=0.99 (high confidence, correct), loss ≈ 0.01. If it predicts pₙ,ₖ=0.01 (high confidence, wrong), loss ≈ 4.61 — confidently wrong predictions are penalized much more heavily than confidently correct ones are rewarded.

---

Why might you choose (negative) log loss over accuracy as an evaluation metric, especially in finance?
?
Accuracy judges predictions in a binary way (correct vs. wrong), but in finance the confidence of a prediction affects bet sizing. A sample-weighted negative log loss accounts for more factors of a prediction's return: the side of the bet (positive/negative), the size of the bet (probability of the prediction), and the return of the bet (proportional to absolute return).
