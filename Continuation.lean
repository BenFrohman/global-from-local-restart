/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
SPDX-License-Identifier: Apache-2.0
-/

/-!
# Restart induction

If time 0 is reached and every reached time extends by a positive step,
there is no finite last reached time.

This is that induction. It does not construct a local solution from smooth
data, and it does not derive a cubic sink. The positive step is an argument.
-/

namespace Continuation

/-- A time already reached. -/
abbrev ExistenceTime := Nat

/-- A short-time length. The construction of this length is not in this file. -/
structure LocalWitness where
  T : Nat
  T_pos : 0 < T

/-- If `0` is reached and every reached time extends by a positive step,
there is no finite last reached time. -/
theorem no_finite_last_time_of_restart
    (reached : ExistenceTime → Prop)
    (h0 : reached 0)
    (tau : Nat) (htau : 0 < tau)
    (hRestart : ∀ t, reached t → reached (t + tau)) :
    ∀ N : Nat, ∃ t : ExistenceTime, N ≤ t ∧ reached t := by
  intro N
  induction N with
  | zero =>
      exact ⟨0, Nat.le_refl 0, h0⟩
  | succ N ih =>
      obtain ⟨t, ht, hr⟩ := ih
      refine ⟨t + tau, ?_, hRestart t hr⟩
      have h1 : N + 1 ≤ t + 1 := Nat.succ_le_succ ht
      have htau1 : 1 ≤ tau := Nat.succ_le_of_lt htau
      exact Nat.le_trans h1 (Nat.add_le_add_left htau1 t)

/-- The same induction, with the step taken from a local witness. -/
theorem global_of_local_restart
    (reached : ExistenceTime → Prop)
    (h0 : reached 0)
    (w : LocalWitness)
    (hRestart : ∀ t, reached t → reached (t + w.T)) :
    ∀ N : Nat, ∃ t : ExistenceTime, N ≤ t ∧ reached t :=
  no_finite_last_time_of_restart reached h0 w.T w.T_pos hRestart

#print axioms no_finite_last_time_of_restart
#print axioms global_of_local_restart

end Continuation
