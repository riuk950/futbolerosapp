# AGENTS.md

## Commands

There is **no `lib/main.dart`**. Entry points are per-flavor targets:

```bash
flutter run --flavor dev  --target lib/env/main.dev.dart
flutter run --flavor prod --target lib/env/main.prod.dart
```

```bash
flutter analyze                      # must be clean before committing
flutter test                         # plain works locally (pure domain tests)
flutter test --flavor dev            # matches what CI runs
flutter test test/domain/models/match_test.dart   # single file
dart run build_runner build --delete-conflicting-outputs   # regenerate *.g.dart after editing riverpod-annotated providers
```

Android flavors are defined in `android/app/build.gradle.kts` (`dev` adds `.dev` applicationId suffix).

## Environment

- `.env.dev` / `.env.prod` are loaded via `flutter_dotenv` and **must stay listed under `assets:` in `pubspec.yaml`** or the app fails at startup.
- Keys read by `lib/env/env_def.dart`: `SUPABASE_URL` / `SUPABASE_ANON_KEY`, with legacy fallbacks `API_BASE_URL` / `AUTH_TOKEN_KEY`.
- In CI these files are generated from GitHub secrets; locally they already exist and are gitignored-ish — don't commit real keys.

## Architecture (strict Clean Architecture)

Dependency rule: `ui` and `infrastructure` depend on `domain`; **`domain` imports nothing** (no Flutter, no packages). Violations fail review.

- `lib/domain/models/gateways/` — abstract contracts, suffixed `Gateway`
- `lib/domain/usecase/` — one class per use case, takes its Gateway via constructor
- `lib/infrastructure/driven_adapters/` — `implements XxxGateway` (supabase/, hive/)
- `lib/infrastructure/helpers/mappers/` — pure functions DTO/JSON → entity; never leak raw JSON into domain
- `lib/config/providers/` — Riverpod (code-gen via `riverpod_annotation`); providers call **use cases, never gateways directly**
- `lib/ui/pages/`, `lib/ui/widgets/` — zero business logic; consume providers only

All dependencies injected by constructor — never instantiate adapters inside use cases or widgets.

`lib/data/` is a vestigial/incomplete layer (mostly empty dirs); real code lives in the layers above. Don't add new code there.

## Conventions that differ from defaults

- **Code identifiers in English, all user-visible UI strings in Spanish.**
- Design system: follow `DESIGN.md` ("Kinetic Minimalist" palette) and theme in `lib/config/theme/`.
- Tests: `mocktail`, strict AAA with `// Arrange / Act / Assert` comments, one `group()` per method, always cover error scenarios, mirrors source path under `test/`. Widget tests use exactly three groups: "Find the page widgets", "Interaction with page widgets", "Test Page Experience". Full spec: `.github/skills/dart-testing/SKILL.md`.

## Commits

Conventional Commits **with emoji**, enforced team format (see `.github/skills/commit/SKILL.md`; local `commit.template` = `.gitmessage.conf`):

```
<type>(<scope>): <emoji> Subject ≤50 chars
```

Body ≥150 chars explaining what/why, plus a `Componentes afectados:` list. Types map to fixed emojis (`feat` 🆕, `fix` 🔨, `chore` 🧹, `ci` ⚙️, …). Run `flutter analyze` + `flutter test` before committing.

## CI / delivery

- `.github/workflows/ci.yml` runs on push/PR to `main`, `develop`, `release`: analyze → `flutter test --flavor $FLAVOR` → on push only, builds a release APK and distributes to Firebase App Distribution.
- Flavor selection: `main` → `prod`, other branches → `dev`.
- SonarCloud is configured (`sonar-project.properties`).

## Stale docs warning

The README's folder-structure and dependencies sections were copied from another project (mentions `valora_code`, ProductItem/SaleRecord, ~90 tests). Trust this file and the codebase instead; the app currently has few tests (domain models/use cases only).
