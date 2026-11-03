# global-from-local-restart

[![certify.yml](https://github.com/BenFrohman/global-from-local-restart/actions/workflows/certify.yml/badge.svg?branch=main)](https://github.com/BenFrohman/global-from-local-restart/actions/workflows/certify.yml)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23653003.svg)](https://doi.org/10.5281/zenodo.23653003) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

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

---
## Archival DOI & Cryptographic Provenance

- **Dedicated 1-to-1 Zenodo DOI:** [10.5281/zenodo.23653003](https://doi.org/10.5281/zenodo.23653003)
- **Author:** Benjamin Stanley Frohman (ORCID: [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718))
- **License:** Apache License, Version 2.0 (`Copyright (c) 2026 Benjamin Stanley Frohman`)
- **Earliest Commit Provenance:** `0aa100b6be5851bd0b73ed51e2ae03078bfa6a46` (2026-10-07 04:10:30 AM CDT (UTC-5))
- **SealGuard SHA-256 Merkle Root:** `bb14de00a0a8e432c6452aeb6afa985e8592306657a4060c1062c12a22f27133` (`PROVENANCE_MERKLE_ROOT.json`)
- **Titan Audit Certificate:** `audit/TITAN_AUDIT_CERTIFICATE.json` (Ed25519 key `b428fb72676f1c52`)
- **Scope & Scientific Boundary:** Proves the abstract conditional continuation lemma in Lean 4 with zero sorry; explicitly states that applying it to 3D Navier-Stokes requires supplying the a priori ceiling hypothesis independently.
