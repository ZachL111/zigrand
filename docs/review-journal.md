# Review Journal

The repository goal stays the same: implement deterministic PRNG streams and reservoir sampling checks. This note explains the added review angle.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its systems programming focus without claiming live deployment or external usage.

## Cases

- `baseline`: `allocation pressure`, score 137, lane `watch`
- `stress`: `dirty state`, score 163, lane `ship`
- `edge`: `guard slack`, score 216, lane `ship`
- `recovery`: `layout drift`, score 152, lane `ship`
- `stale`: `allocation pressure`, score 131, lane `watch`

## Note

This file is intentionally plain so the fixture remains the source of truth.
