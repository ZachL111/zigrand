# Failure Modes

For `zigrand`, I would look first for these mistakes:

- `allocation pressure` cases moving lanes without a matching threshold change.
- `guard slack` scoring higher after drag increases.
- Duplicate fixture ids hiding a stale golden row.
- README examples drifting away from the verifier.

The local checks are intentionally strict about these cases.
