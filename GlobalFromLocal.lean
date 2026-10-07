/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Authors: Benjamin Stanley Frohman

Continuation only. A reached stage and a positive restart length give every
multiple of that length. This file does not construct Kato local existence
and does not derive a cubic sink from the Navier-Stokes equation.
-/

namespace GlobalFromLocal

structure Ceiling where
  k : Nat
  pos : 0 < k

def HasLocal (P : Nat → Prop) (n : Nat) : Prop :=
  ∃ m, n < m ∧ P m

def HasRestart (P : Nat → Prop) (c : Ceiling) : Prop :=
  ∀ n, P n → P (n + c.k)

def UniqueContinuation (P : Nat → Prop) : Prop :=
  ∀ n m, P n → P m → n = m ∨ (P n ∧ P m)

theorem local_of_restart
    (P : Nat → Prop) (c : Ceiling) (hRestart : HasRestart P c)
    (n : Nat) (h : P n) : HasLocal P n :=
  ⟨n + c.k, Nat.lt_add_of_pos_right c.pos, hRestart n h⟩

theorem global_of_local_ceiling_restart
    (P : Nat → Prop) (hLocal : P 0) (c : Ceiling)
    (hRestart : HasRestart P c) :
    ∀ n, P (c.k * n) := by
  intro n
  induction n with
  | zero =>
    rw [Nat.mul_zero]
    exact hLocal
  | succ n ih =>
    rw [Nat.mul_succ]
    exact hRestart (c.k * n) ih

theorem global_of_local_ceiling_restart_uniqueness
    (P : Nat → Prop)
    (hLocal : P 0)
    (c : Ceiling)
    (hRestart : HasRestart P c)
    (_hUnique : UniqueContinuation P) :
    ∀ n, P (c.k * n) :=
  global_of_local_ceiling_restart P hLocal c hRestart

#print axioms global_of_local_ceiling_restart
#print axioms global_of_local_ceiling_restart_uniqueness

end GlobalFromLocal
