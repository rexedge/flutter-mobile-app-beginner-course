# Glossary

Every technical term in this course, in plain English, tagged with the session it first appears in. When a word stops you, look here first.

Terms are listed in the order they're introduced, not alphabetically — so reading top to bottom follows the course.

---

## Beginner course terms

| Term | Plain-English definition | First appears |
|---|---|---|
| Git | A program on your computer that tracks every change to a folder of files, and can move those changes between computers | Session 0 |
| GitHub | A website that hosts Git repositories so they can be shared between computers and people. Git is the program; GitHub is one place to put it | Session 0 |
| Repository (repo) | One project's folder, plus its entire history of changes | Session 0 |
| Clone | Download a complete copy of a repository, including its history | Session 0 |
| Pull | Fetch whatever changed in the online repository and apply it to your copy | Session 0 |
| Commit | One saved snapshot of your work, with a message describing it | Session 0 |
| Conflict | Git found two different versions of the same file and needs you to decide which to keep | Session 0 |
| Working tree clean | Your copy exactly matches the repository — nothing has been edited | Session 0 |
| Source code | The instructions a person wrote, in text, describing exactly what an app should do | Session 1 |
| Compile / compiler | The process (and tool) that translates human-written code into something a phone's processor can execute | Session 1 |
| Native app | An app written specifically for one platform, using that platform's own official toolkit (e.g. Swift for iOS, Kotlin for Android) | Session 1 |
| Web app | A website, built with HTML/CSS/JavaScript, dressed up to feel app-like in a browser | Session 1 |
| Cross-platform app | An app written once that produces real, installable, native-feeling apps for multiple platforms at once | Session 1 |
| Framework | A pre-built, organized toolbox of code that handles common problems so you don't build everything from scratch | Session 1 |
| Widget | In Flutter, anything visible on screen — text, buttons, spacing, containers — all of it is a widget | Session 1 |
| Rendering engine | The part of Flutter that draws the app's screen directly, pixel by pixel, instead of using the phone's native UI components | Session 1 |
| IDE | "Integrated development environment" — the specialized editor used to write code (this course uses VS Code) | Session 1 |
| Emulator | A simulated phone that runs as a window on your computer, used to test apps without a physical device | Session 1 |
| SDK | "Software development kit" — the full bundle of tools (framework + compiler, etc.) needed to build apps for a platform | Session 1 |
| Hot reload | Flutter's ability to update a running app within about a second of a code change, without a full restart (full lesson: Session 3) | Session 1 (preview) |
| Syntax error | An error the compiler reports when code breaks the language's strict grammar rules and it cannot guess the intended meaning | Session 1 |
| Terminal / command line | A window where you type commands directly instead of clicking icons | Session 2 |
| PATH | The list of folder locations your computer checks whenever you type a command name | Session 2 |
| `flutter doctor` | The command that health-checks your entire Flutter development environment | Session 2 |
| Android toolchain | The Android SDK, build tools, and emulator manager, installed via Android Studio | Session 2 |
| AVD (Android Virtual Device) | A specific virtual phone model you create and run inside Android Studio's Device Manager | Session 2 |
| Target platform | The specific device/OS combination an app is being built and tested for | Session 2 |
| `flutter create` | The command that generates a complete, working Flutter project from a template | Session 2 |
| `flutter run` | The command that compiles a Flutter project and launches it on the currently connected device | Session 2 |
| Project anatomy / project structure | What every folder and file in a Flutter project is actually for | Session 3 |
| Dependency (package) | A chunk of pre-written code — from Flutter's team or another developer — that your project relies on instead of writing it yourself | Session 3 |
| Entry point / `main()` function | The one guaranteed first function that runs when a Dart program starts | Session 3 |
| `runApp()` | The function call that hands your whole app to Flutter and puts it on screen | Session 3 |
| Widget tree | The nested structure formed when widgets contain other widgets, like a family tree (full lesson: Session 10) | Session 3 (preview) |
| Hot reload | Injecting saved code changes into a still-running app, preserving its current state, in under a second | Session 3 (full lesson; previewed Session 1) |
| Hot restart | Relaunching a running app fresh from a saved code change — faster than a full rebuild, but resets app state | Session 3 |
| State preservation | Whether an app's current data (like a counter's value) survives a code update — hot reload preserves it, hot restart doesn't | Session 3 |
| Variable | A named container that holds a piece of information a program can use, check, or change later | Session 4 |
| `var` | Declares a variable and lets Dart infer its type from the value assigned to it | Session 4 |
| `dart create` | Generates a new plain Dart console project — `flutter create`'s non-Flutter cousin | Session 4 |
| Type annotation | Explicitly writing out a variable's type instead of letting Dart infer it | Session 4 |
| `String` | Dart's text type — always written in quotes | Session 4 |
| `int` | Dart's whole-number type — no decimal point | Session 4 |
| `double` | Dart's decimal-number type | Session 4 |
| `bool` | Dart's true/false type — exactly one of two values | Session 4 |
| `null` | The deliberate, genuine absence of a value — not zero, not empty text | Session 4 |
| Null safety | Dart's requirement that every variable is non-nullable by default, checked before the program ever runs | Session 4 |
| Nullable type (`?`) | A type explicitly marked as allowed to hold `null` (e.g. `String?`) | Session 4 |
| Non-nullable type | A type that must always hold a real value, never `null` — the default for every Dart type | Session 4 |
| String interpolation | Combining text and variables into one string using `$variable` or `${expression}` | Session 5 (full lesson; previewed Session 4) |
| Operator | A symbol that takes one or more values and produces a new one | Session 5 |
| Arithmetic operators (`+ - * / ~/ %`) | Dart's math operators — `/` always returns a double, `~/` truncates to a whole number, `%` returns the remainder | Session 5 |
| Comparison operators (`== != < > <= >=`) | Operators that ask a true/false question about two values and return a bool | Session 5 |
| Logical operators (`&& \|\| !`) | Operators that combine (`&&`, `\|\|`) or flip (`!`) bool values (full use inside decisions: Session 6) | Session 5 (preview) |
| `final` | A variable that can be assigned exactly once — locked after that, but its value may depend on something only known at runtime | Session 5 |
| `const` | A variable that's locked AND whose value must be fully known before the program even runs | Session 5 |
| Immutability | The property of a value that can't be changed after it's created — true of both `final` and `const` | Session 5 |
| Control flow | The general name for anything that changes which lines of code run, and in what order | Session 6 |
| `if` / `else if` / `else` | Branches to one block of code based on conditions, checked top to bottom — first true one wins | Session 6 (full lesson; previewed Session 4, S5) |
| `switch` / `case` / `default` / `break` | Checks one value against a specific, exact list of possible matches | Session 6 |
| `for` loop | Repeats a block of code a controlled, counted number of times, managing a counter automatically | Session 6 |
| Loop counter / iterator variable | The variable a loop uses to track how many times it has repeated (e.g. `i` in `for (int i = 0; ...)`) | Session 6 |
| `while` loop | Repeats a block of code as long as a condition stays true, with the counter managed manually | Session 6 |
| Infinite loop | A loop whose condition never becomes false, so it never stops on its own | Session 6 |
| Function | A named, reusable block of code, defined once and called as many times as needed | Session 7 |
| Parameter | A named, typed input a function expects, declared in its definition | Session 7 |
| Argument | The actual value handed over when calling a function | Session 7 |
| Return type / `return` | The type of value a function promises to hand back; `return` sends that value to the caller | Session 7 |
| `void` | A return type meaning a function performs an action but hands nothing back | Session 7 |
| Optional named parameter | A parameter wrapped in `{}`, called by name, with a default value if omitted | Session 7 |
| Required named parameter (`required`) | A named parameter with no default — callers must supply it, but still by name | Session 7 |
| Arrow syntax (`=>`) | Shorthand for a function whose entire body is one expression being returned | Session 7 |
| Collection | A type built to hold multiple values inside one variable | Session 8 |
| `List` | An ordered, indexed collection of values | Session 8 |
| Index | A value's numbered position within a List, starting at 0 | Session 8 |
| `Set` | A collection that automatically keeps only unique values, dropping duplicates | Session 8 |
| `Map` | A collection of key-value pairs, looked up by key instead of position | Session 8 |
| Key / value (Map) | The lookup name (key) and the data stored under it (value) in a Map | Session 8 |
| Spread operator (`...`) | Unpacks every item from one collection into another collection literal | Session 8 |
| Collection-if | An `if` written directly inside a collection literal, conditionally including one item | Session 8 |
| Class | A blueprint that describes what an object is made of (fields) and what it can do (methods) | Session 9 |
| Object / instance | One real, actual thing built from a class's blueprint | Session 9 |
| Field | A variable that lives inside a class, storing one piece of data for each object | Session 9 |
| Constructor | The special function that runs when an object is created, usually filling in its fields | Session 9 |
| Method | A function that lives inside a class and can be called on any object built from it | Session 9 |
| `this` | Inside a class, refers to "the object currently being built or used" — `this.field` assigns straight to that field | Session 9 |
| Inheritance / `extends` | Building a new class on top of an existing one, automatically gaining all its fields and methods | Session 9 |
| Superclass / subclass | The superclass is the class being inherited from; the subclass is the one doing the inheriting | Session 9 |
| `super` | Inside a subclass's constructor, calls the superclass's constructor to build the inherited part of the object | Session 9 |
| `@override` | Marks that a method or getter is intentionally replacing one required by a superclass or mixin | Session 9 |
| Mixin / `with` | A mixin is a bundle of reusable behavior; `with` bolts that behavior onto a class regardless of what it already extends | Session 9 |
| Widget (full formal definition) | A piece of your app's screen, described in code, that knows how to draw itself — includes invisible spacing, not just visible controls | Session 10 (full lesson; previewed Session 1, S3) |
| Widget tree | The nested structure formed when widgets contain other widgets, like a family tree | Session 10 (full lesson; previewed Session 3) |
| `StatelessWidget` | A widget class that draws itself once and doesn't remember or change anything on its own; StatefulWidget (Session 16) can | Session 10 |
| `build()` method | The one method every widget class must implement — returns the widget it draws | Session 10 |
| `BuildContext` | A parameter Flutter automatically hands `build()`, representing "where in the widget tree this widget currently is" | Session 10 |
| `MaterialApp` | The widget that sets up an entire app: Material Design, text direction, navigation support, and more | Session 10 |
| `Scaffold` | A pre-built skeleton for a single screen, with clearly labeled slots like `appBar`, `body`, and `floatingActionButton` | Session 10 |
| `AppBar` | The bar across the top of a screen, usually holding a title | Session 10 |
| `FloatingActionButton` (FAB) | The round button that floats in the corner of a screen | Session 10 |
| Widget composition / nesting | Building a screen by handing widgets to other widgets as properties, layer inside layer | Session 10 |
| `TextStyle` | A bundle of styling properties (size, weight, color, italics) passed to a `Text` widget's `style:` property | Session 11 |
| `FontWeight` | A fixed set of named text-weight options (e.g. `FontWeight.bold`) used inside `TextStyle` | Session 11 |
| `FontStyle` | A fixed set of named text-slant options (e.g. `FontStyle.italic`) used inside `TextStyle` | Session 11 |
| `Colors` | Flutter's built-in color palette, used anywhere a `Color` value is needed | Session 11 |
| `Image` widget / `Image.network` | Displays a picture; `Image.network` loads it from a URL with no project setup (bundling your own files via `Image.asset`: full lesson Session 26) | Session 11 |
| `Icon` (full formal lesson) | Draws one picture from Flutter's built-in icon set; controlled with `size` and `color` | Session 11 (full lesson; previewed Session 10) |
| `IconData` | The type of value every entry in the `Icons` class holds (e.g. `Icons.favorite`) | Session 11 |
| `Container` | A widget that wraps one child and controls its padding, margin, and decoration | Session 11 |
| `padding` / `EdgeInsets` | Space between a `Container`'s edges and its child, set with `EdgeInsets` | Session 11 |
| `margin` | Space between a `Container` and whatever surrounds it | Session 11 |
| `BoxDecoration` | Holds a `Container`'s visual styling — background color, rounded corners, and more | Session 11 |
| `borderRadius` / `BorderRadius` | Rounds a `Container`'s corners, set inside `BoxDecoration` | Session 11 |

---

[← Course home](README.md) · [Start here](START-HERE.md)
