# zigrand

`zigrand` explores systems programming in Zig. The repository keeps the core rule set compact, then surrounds it with examples that show how the decisions move.

## Zigrand Notes

The quickest review path is the verifier first, then the fixtures, then the operations note. That order makes it easy to see whether the code, data, and explanation still agree.

## Why This Exists

I use this kind of project to make a rule visible before adding more machinery around it. The important part here is not the size of the codebase. It is that the input signals, scoring rule, fixture data, and expected output can all be checked in one sitting.

## Example Scenarios

The examples are meant to be readable before they are exhaustive. They cover enough variation to show how latency and risk can pull a decision below the threshold.

## Implementation Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps memory shape, resource pressure, and bounds checks in one explicit decision path. The threshold is 167, with risk penalty 5, latency penalty 3, and weight bonus 4. The Zig version uses compile-time constants and native test blocks for fast local checks.

## Feature Notes

- Models memory shape with deterministic scoring and explicit review decisions.
- Uses fixture data to keep resource pressure changes visible in code review.
- Includes extended examples for bounds checks, including `recovery` and `degraded`.
- Documents low-level invariants tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Try It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Tests

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Code Tour

- `src`: primary implementation
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Roadmap

- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add one more systems programming fixture that focuses on a malformed or borderline input.

## Boundaries

The fixture set is deliberately small. That keeps the review surface clear, but it also means the model should not be treated as a complete domain simulator.

## Local Setup

Use a normal shell with Zig available on `PATH`. The verifier is written as a PowerShell script because the portfolio was assembled on Windows.
