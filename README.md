# global-from-local-restart

Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.

Author: Benjamin Stanley Frohman

License: Apache-2.0. See `LICENSE`, `NOTICE`, and `COPYRIGHT.md`.

## What is proved

`Continuation.no_finite_last_time_of_restart` is an induction. If time 0 is
reached and every reached time extends by a positive step, then there is no
finite last reached time.

`Continuation.global_of_local_restart` is that induction with the step taken
from a `LocalWitness`. The witness is an argument. It is not constructed from
smooth data.

This file does not contain a uniqueness hypothesis. It does not derive a cubic
sink. It is not an unconditional Navier-Stokes theorem.

## Build

Pinned toolchain: `leanprover/lean4:v4.30.0-rc1`.

```bash
git clone https://github.com/BenFrohman/global-from-local-restart.git
cd global-from-local-restart
lake build
```
