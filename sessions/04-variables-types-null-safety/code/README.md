# Session 4 — Code

The first plain-Dart project in the course. **No Flutter, no emulator** — these run in a terminal.

- **`starter/dart_practice/`** — a blank `void main() {}`, the state you reach after running `dart create dart_practice` and clearing out the generated example.
- **`final/dart_practice/`** — the finished bio script: five variables covering all four core types, plus one nullable field handled with a null check.

Your `final` should hold *your* details, not the ones in this copy. The shape is what matters.

## Running either version

```
cd starter/dart_practice     # or final/dart_practice
dart run
```

`dart run` on its own works because each project's folder name matches its `pubspec.yaml` name and its `bin/<name>.dart` file.
