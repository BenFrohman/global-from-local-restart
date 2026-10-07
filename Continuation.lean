/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
SPDX-License-Identifier: Apache-2.0
-/

/-!
# Global extension from a local witness, a ceiling, restart, and uniqueness

This is the implication closed by `NS_Millennium_Proof` at `d1047673`,
stated without the Navier-Stokes types.

It does not prove local existence from smooth data.
It does not prove the cubic sink. The ceiling is an argument.
The local witness supplies the positive restart length.
-/

/-- A short-time solution of positive length. -/
structure LocalWitness where
  T : Nat
  T_pos : 0 < T

/-- A time already reached by some solution. -/
abbrev ExistenceTime := Nat

/-- If `0` is reached and every reached time extends by a positive step,
there is no finite last reached time. -/
theorem no_finite_last_time_of_restart
    (reached : ExistenceTime -> Prop)
    (h0 : reached 0)
    (tau : Nat) (htau : 0 < tau)
    (hRestart : forall t, reached t -> reached (t + tau)) :
    forall N : Nat, Exists t : ExistenceTime, N <= t /\ reached t := by
  intro N
  induction N with
  | zero =>
      exact ⟨0, Nat.le_refl 0, h0⟩
  | succ N ih =>
      obtain ⟨t, ht, hr⟩ := ih
      refine ⟨t + tau, ?_, hRestart t hr⟩
      have h1 : N + 1 <= t + 1 := Nat.succ_le_succ ht
      have htau1 : 1 <= tau := Nat.succ_le_of_lt htau
      exact Nat.le_trans h1 (Nat.add_le_add_left htau1 t)

/-- The certified implication.

`hLocal` is the short-time witness. Its length is the restart step.
`hCeiling` is the Riccati ceiling, assumed.
`hRestart` uses that ceiling to extend a reached time by `hLocal.T`.
`hUniq` is local uniqueness, assumed and re-exported. It is not derived.
-/
theorem global_of_local_ceiling_restart_uniqueness
    (reached : ExistenceTime -> Prop)
    (hLocal : LocalWitness)
    (h0 : reached 0)
    (hCeiling : Prop)
    (hRestart : hCeiling -> forall t, reached t -> reached (t + hLocal.T))
    (hC : hCeiling)
    (hUniq : forall t s, reached t -> reached s -> t <= s \/ s <= t) :
    (forall N : Nat, Exists t : ExistenceTime, N <= t /\ reached t) /\
      (forall t s, reached t -> reached s -> t <= s \/ s <= t) := by
  refine ⟨?_, hUniq⟩
  exact no_finite_last_time_of_restart reached h0 hLocal.T hLocal.T_pos (hRestart hC)

#print axioms no_finite_last_time_of_restart
#print axioms global_of_local_ceiling_restart_uniqueness
