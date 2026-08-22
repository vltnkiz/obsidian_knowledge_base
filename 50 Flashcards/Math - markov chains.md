---
subject: Math
topic: markov chains
---

#flashcards/math/markov-chains

What is the Markov property, stated in terms of conditional probability?
?
The probability of transitioning to the next state depends only on the current state, not on the history of states before it: P(Xₙ=iₙ | Xₙ₋₁=iₙ₋₁) = P(Xₙ=iₙ | X₀=i₀, X₁=i₁, ..., Xₙ₋₁=iₙ₋₁).

---

What is the difference between a time-homogeneous and a time-inhomogeneous Markov chain?
?
Time-homogeneous (stationary): the transition probabilities are independent of time. Time-inhomogeneous: the probability of moving from one state to another can change over time.

---

What does a transition matrix Pₜ represent, and how do you compute a multi-step transition?
?
(Pₜ)ᵢⱼ = P(Xₜ₊₁ = j | Xₜ = i), the probability of moving from state i to state j in one step. A multi-step transition is computed by multiplying the transition matrices together: (Pₜ₊ₖ)ᵢⱼ = Pₜ × Pₜ₊₁ × ... × Pₜ₊ₖ.

---

What does it mean for a state i to have periodicity k?
?
Any path starting at i and returning to i must take a number of steps divisible by k. A state is aperiodic if k=1, meaning returns can happen at irregular step intervals.

---

What is an absorbing state?
?
A state i where (Pₜ)ᵢᵢ = 1 — once entered, the system stays there with probability 1.

---

What does irreducibility mean for a Markov chain?
?
It is possible to transition between any two states with positive probability (every state is reachable from every other state).

---

What is the difference between a transient and a recurrent state, and between positive and null recurrence?
?
Transient state: there is a non-zero probability the system will never return to this state. Recurrent state: the system is guaranteed to return to this state. Within recurrent states — positive recurrent: the expected number of steps to return is finite; null recurrent: the expected number of steps to return is infinite.

---

What does it mean for a state to be ergodic?
?
A state is ergodic if it is both positive recurrent and aperiodic.

---

What is a Hidden Markov Model (HMM), and what are its hidden vs. observable states?
?
An HMM extends a Markov chain to the case where the true state sequence is not directly observed. Hidden states are the underlying (unobserved) states following the Markov property (e.g. weather conditions); observable states are what's actually seen (e.g. Bob's reported mood), which depend probabilistically on the hidden state.

---

What are the five formal elements of an HMM, denoted λ = {A, B, π}?
?
N: number of hidden states, S = {S₁,...,Sₙ}. M: number of observation symbols per state, V = {v₁,...,vₘ}. A: state transition probability matrix, A = {aᵢⱼ} where aᵢⱼ = P(qₜ=Sⱼ | qₜ₋₁=Sᵢ). B: observation symbol probability distribution, B = {bᵢ(k)}, the probability of emitting vₖ in state Sᵢ. π: initial state distribution, the probability of starting in state Sᵢ at t=1.

---

What is Problem 1 for HMMs, and why can't it be solved by brute-force summing over all state sequences?
?
Problem 1: given observations O and model λ, what is P(O|λ) — the probability the model generated this observation sequence? Summing P(O,Q|λ) over all possible state sequences Q is infeasible, with complexity on the order of (2T−1)Nᵀ + (Nᵀ−1).

---

How does the Forward algorithm solve Problem 1, and what is the forward variable αₜ(i)?
?
αₜ(i) = P(o₁,o₂,...,oₜ, qₜ=Sᵢ | λ), the probability of the partial observation sequence up to t and being in state Sᵢ at t. Initialize α₁(i) = πᵢbᵢ(o₁); recurse αₜ₊₁(j) = Σᵢ αₜ(i)aᵢⱼbⱼ(oₜ₊₁). Then P(O|λ) = Σᵢ αₜ(i).

---

What is the Backward algorithm's variable βₜ(i), and how is P(O|λ) recovered from it?
?
βₜ(i) = P(oₜ₊₁,oₜ₊₂,...,oₜ | qₜ=Sᵢ, λ), the probability of the remaining observations given state Sᵢ at time t. Initialize β_T(i) = 1; recurse βₜ(i) = Σⱼ aᵢⱼbⱼ(oₜ₊₁)βₜ₊₁(j). Then P(O|λ) = Σᵢ β₁(i).

---

What is Problem 2 for HMMs, and what are the two ways to define "best" state sequence?
?
Problem 2: given O and λ, what sequence of states Q best explains the observations? (1) Choose states individually most likely at each t using γₜ(i) = P(qₜ=Sᵢ|O,λ) = αₜ(i)βₜ(i) / P(O|λ), then qₜ = argmax γₜ(i) — maximizes expected correct states but the resulting path may not make sense as a whole. (2) Choose the single path maximizing P(Q,O|λ) jointly, via the Viterbi algorithm.

---

How does the Viterbi algorithm work?
?
It defines δₜ(i) = max over state paths of P({q₁,...,qₜ=i},{o₁,...,oₜ}|λ), the best score along a single path ending in state i at time t. Initialize δ₁(i)=πᵢbᵢ(o₁), ψ₁(i)=0. Induction: δₜ₊₁(j) = max_i(δₜ(i)aᵢⱼ)bⱼ(oₜ₊₁), ψₜ₊₁(j) = argmax_i(δₜ(i)aᵢⱼ). Termination: P* = max_i δ_T(i), q*_T = argmax_i δ_T(i), then backtrack through ψ to recover the full optimal path.

---

What is Problem 3 for HMMs, and what algorithm solves it?
?
Problem 3: given an observation sequence, how do we learn/estimate the model parameters λ = {A,B,π} that would generate it? Solved by the Baum-Welch algorithm, which searches for a local optimum of λ.

---

What new quantity does Baum-Welch introduce beyond α, β, and γ, and what does it represent?
?
ξₜ(i,j) = P(qₜ=Sᵢ, qₜ₊₁=Sⱼ | O, λ) = αₜ(i)aᵢⱼbⱼ(oₜ₊₁)βₜ₊₁(j) / P(O|λ), the probability of being in state i at t and transitioning to state j at t+1, given the observations. γₜ(i) can be derived from it as γₜ(i) = Σⱼ ξₜ(i,j).

---

How does Baum-Welch re-estimate π, A, and B at each iteration?
?
π̄ᵢ = γ₁(i) (probability of starting in state i). āᵢⱼ = (Σₜ ξₜ(i,j)) / (Σₜ γₜ(i)) — expected transitions i→j over expected times in state i. b̄ᵢ(vₖ) = (Σ over t where oₜ=vₖ of γₜ(i)) / (Σₜ γₜ(i)) — expected times in state i while observing vₖ, over expected times in state i.
