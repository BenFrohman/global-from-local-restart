-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import Continuation

#print axioms Continuation.LocalWitness.T_pos
#print axioms Continuation.global_of_local_restart
#print axioms Continuation.no_finite_last_time_of_restart
