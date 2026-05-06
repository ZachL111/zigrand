# Zigrand Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | allocation pressure | 137 | watch |
| stress | dirty state | 163 | ship |
| edge | guard slack | 216 | ship |
| recovery | layout drift | 152 | ship |
| stale | allocation pressure | 131 | watch |

Start with `edge` and `stale`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`edge` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
