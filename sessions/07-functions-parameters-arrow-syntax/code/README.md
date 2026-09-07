# Session 7 — Code

Still the same `dart_practice` project, carried forward from Session 6.

- **`starter/dart_practice/`** — identical to Session 6's finished file. The grade calculator, countdown, and squares table are all still loose code sitting inside `main()`. If you still have your own, use that instead; this copy is here in case you need a clean one.
- **`final/dart_practice/`** — the same file after this session: the same three pieces of logic, now packaged into three named functions (`calculateGrade`, `runCountdown`, `printSquares`) and called from `main()`.

Both versions produce almost identical output. That's the point of a refactor — it changes how the code is organised, not what it does. The only difference is one extra grade line, which the new version gets for one line of code instead of twelve.

The teaching examples from the chapter (`sayHello`, `add`, `greet`, `square`) are not in `final/` — they're there for you to type and experiment with, not to keep. Only the build work carries forward between sessions.

The broken calls from the break-it section (`runCountdown()` and `runCountdown(5, 10)`) aren't in `final/` either. Break it yourself, read the error, then put the argument back.

## Running either version

```
cd starter/dart_practice     # or final/dart_practice
dart run
```
