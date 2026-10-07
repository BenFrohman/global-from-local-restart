# global-from-local-restart

Copyright (c) 2026 Benjamin Stanley Frohman. Apache-2.0. See `LICENSE`.

This repository is the conditional continuation, under a new name.
It is not an unconditional Navier-Stokes proof.

`global_of_local_ceiling_restart_uniqueness` says: if a short-time witness
supplies a positive restart length, a ceiling is granted, restart extends
every reached time by that length, and uniqueness is granted, then there is
no finite last reached time.

`hCeiling` and `hUniq` are arguments. `hUniq` is re-exported, not derived.
The local witness is not constructed from smooth data.

## Check

Pinned toolchain: `leanprover/lean4:v4.30.0-rc1`.

```bash
git clone https://github.com/BenFrohman/global-from-local-restart.git
cd global-from-local-restart
lake build
```

The source in `Continuation.lean` is the file that `lake build` accepted
with exit 0. `#print axioms` reported that neither theorem depends on any
axioms. There is no `sorry`.
