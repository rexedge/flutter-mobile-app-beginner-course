# Session 8 — Code

Still the same `dart_practice` project, carried forward from Session 7.

- **`starter/dart_practice/`** — identical to Session 7's finished file. Three real functions, but each still only ever called with one hardcoded value at a time. If you still have your own, use that instead; this copy is here in case you need a clean one.
- **`final/dart_practice/`** — the same file after this session. The two hardcoded `calculateGrade` calls are gone, replaced by a full grade report:
  1. `List<int> allScores`, built from two smaller lists with the spread operator plus a conditional bonus score with collection-if
  2. A `for`-`in` loop running `calculateGrade` across every score
  3. `Set<String> gradesSeen` collecting which grades appeared at all
  4. `Map<String, int> gradeCounts` tallying how many of each

The `runCountdown` and `printSquares` calls are unchanged. This session's work is entirely the grade report.

The teaching examples from the chapter (`names`, `uniqueGrades`, `inventory`) aren't in `final/` — type those in as you read, then keep or delete them as you like. Only the build work carries forward between sessions.

The `print(allScores[10]);` line from the break-it section isn't there either. Add it yourself, read the `RangeError`, then take it out.

## Running either version

```
cd starter/dart_practice     # or final/dart_practice
dart run
```
