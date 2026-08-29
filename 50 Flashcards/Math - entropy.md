---
subject: Math
topic: entropy
---

#flashcards/math/entropy

How is "surprise" related to probability, and what should surprise equal when an event is certain?
?
Surprise has an inverse relation with probability: high probability = low surprise, low probability = high surprise. When p(event) = 1, surprise should be 0.

---

What is the formula for the surprise of an event with probability p, and how is it derived?
?
Surprise = log₂(1/p) = log₂(1) − log₂(p) = −log₂(p). This satisfies surprise = 0 when p = 1.

---

What is entropy, in terms of surprise?
?
Entropy is the average (expected) amount of surprise per event: Entropy = Σ(pᵢ × surprise(pᵢ)) = −Σ pᵢ log₂(pᵢ).

---

For a coin flip, when is entropy maximized and when is it low, and what do these cases represent?
?
Entropy is maximized (=1 bit) for a fair coin (p=0.5/0.5) — maximum entropy corresponds to a fair/balanced distribution. Entropy is low (~0.244 bits for a 3/4–1/4 split) when the distribution is imbalanced — low entropy = high imbalance.
