---
subject: Math
topic: p-values
---

#flashcards/math/p-values

What does a p-value measure, and how is it used to make a decision regarding the null hypothesis ($H_0$)?
?
A p-value measures the strength of evidence against the null hypothesis ($H_0$). If the p-value is smaller than the significance level $\alpha$ (e.g., 0.05), the evidence against $H_0$ is strong enough to reject the null hypothesis. If the p-value $\ge \alpha$, we fail to reject $H_0$.

---

In a two-sided test for a bottling machine expected to fill exactly 500 mL, what are the null hypothesis ($H_0$) and the physical meaning of the calculated Z-score?
?
The null hypothesis is $H_0: \mu = 500\text{ mL}$, stating that the machine works perfectly. A calculated Z-score of $-2.5$ means that the observed sample mean sits exactly 2.5 standard errors below the hypothesized population mean.

---

What is the fundamental statistical intuition behind mapping sample data to a normal distribution curve in a two-sided Z-test?
?
The mapping determines how rare or extreme the observed sample data (or more extreme data) would be if the null hypothesis were completely true—specifically, how likely it is to observe a sample mean that far or farther from the target in either direction.

---

How is the final p-value calculated and interpreted for a two-sided Z-test when the test statistic is $Z = -2.5$?
?
The p-value is the sum of both tail probabilities:  
$\text{P-value} = P(Z \le -2.5) + P(Z \ge 2.5) = 1.24\%$.  
Since $1.24\% < 5\%$ ($\alpha$), $H_0$ is rejected, indicating strong evidence that the machine is miscalibrated.

---

How do the null hypothesis ($H_0$) and the final p-value calculation change if the consumer only cares that the bottles contain *at least* the advertised 500 mL?
?
The test becomes a one-sided test where $H_0: \mu \ge 500\text{ mL}$. Because we only look for evidence of under-filling in the lower tail, the p-value is cut in half to include only the single left tail:  
$\text{P-value} = P(Z \le -2.5) = 0.62\%$.