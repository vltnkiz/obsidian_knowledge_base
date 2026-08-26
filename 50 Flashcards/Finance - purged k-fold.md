---
subject: Finance
topic: purged k-fold
---

#flashcards/finance/purged-k-fold

What does purging do in cross-validation for financial data
?
It removes training observations whose label window overlaps with the test set's time span, so no training sample was labeled using information from inside the test period.

---

If a test fold spans [t1, t2], which training samples get purged
?
Any training sample with label span [ti, ti+h] where ti falls inside [t1, t2], or ti+h falls inside [t1, t2] — i.e. its label window starts or ends inside the test period.

---

What does embargo do in cross-validation for financial data
?
It removes (embargoes) a number of observations that immediately follow the test set, rather than only inside it.

---

Why is embargo needed even when purging has already removed overlapping training labels
?
Financial data is often autocorrelated, so observations placed right after the test set still carry information similar to the test set even without a direct label-window overlap.
