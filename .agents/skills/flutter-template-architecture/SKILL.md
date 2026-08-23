# Flutter Template Architecture Skill

Use this skill when adding, modifying, reviewing, or explaining features in this Flutter template.

The goal is to keep changes consistent with the existing architecture: feature-first modules, clear core/shared boundaries, dependency injection through `get_it`/`injectable`, routing through `auto_route`, state through Bloc/Cubit, and generated code through `build_runner`.

## Core Principles

- Make the smallest correct change that solves the feature request.
- Preserve the existing folder structure and naming style.
- Put product-specific code inside `lib/features/<feature_name>`.
- Put reusable cross-feature code inside `lib/core` only when it is genuinely shared.
- Do not create new abstractions unless they remove real duplication or match an existing pattern.
- Do not add dependencies unless the feature cannot be implemented cleanly with existing packages.
- Do not edit generated files by hand. Regenerate them.
- Keep UI widgets thin. Business logic belongs in Cubits, use cases, repositories, and services.
- Keep repositories behind interfaces when the feature needs testability or multiple implementations.

## Existing Architecture

The main application layout is:

```text
lib/
  main.dart
  app.dart
  auth_listener.dart
  config/
    routes/
    themes/
  core/
    api/
    di/
    enums/
    error/
    localStorage/
    models/
    network/
    requests/
    usecases/
    utils/
    validation/
    widgets/
  data/
    repositories/
    services/
  features/
    authentication/
    startUp/
  generated/
  l10n/
```

Important conventions:

- `lib/main.dart` bootstraps Flutter and configures the dependency environment.
- `lib/app.dart` owns `MaterialApp.router`, localization delegates, theme, route config, screen util setup, and top-level Bloc providers.
- `lib/config/routes/app_router.dart` defines app routes and generates `app_router.gr.dart`.
- `lib/core/di/injection.dart` configures `GetIt` and generates `injection.config.dart`.
- `lib/core/api` contains API consumers, interceptors, status codes, and helper logic.
- `lib/core/widgets` contains reusable UI components.
- `lib/features/authenticated/main` contains the default authenticated app shell and bottom navigation.
- `lib/features/authentication/shared` contains reusable auth request models, contracts, and usecases such as OTP send/verify.
- `lib/l10n` contains ARB translation source files.
- `lib/generated` contains localization output from `intl_utils`.

## Build A New Feature

Use this default feature shape unless the feature is very small:

```text
lib/features/<feature_name>/
  data/
    datasources/
    models/
    repositories/
  domain/
    repositories/
    usecases/
  presentation/
    cubit/
    screens/
    widgets/
```

For a small feature, it is acceptable to create only the folders that are actually needed.

### 1. Define The Route

Add or update routes in:

```text
lib/config/routes/app_router.dart
```

Use `auto_route` annotations and regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Do not manually edit:

```text
lib/config/routes/app_router.gr.dart
```

### 2. Add Presentation Layer

Use:

```text
presentation/screens/
presentation/widgets/
presentation/cubit/
```

Guidelines:

- Screens compose widgets and connect Cubit state to UI.
- Widgets should receive explicit inputs and callbacks.
- Cubits should expose immutable state and call use cases.
- Use existing shared widgets from `lib/core/widgets` before creating new ones.
- Use `context`, localization, theme, colors, and shared typography consistently with existing screens.
- Keep Arabic/English and RTL behavior in mind for all visible text and layout.

### 3. Add Domain Layer

Use:

```text
domain/repositories/
domain/usecases/
```

Guidelines:

- Use cases should contain one application action.
- Repository interfaces should describe feature needs without leaking API details.
- Return existing result/failure types when the feature follows current patterns.
- Avoid putting Flutter UI types in the domain layer.

### 4. Add Data Layer

Use:

```text
data/models/
data/repositories/
data/datasources/
```

Guidelines:

- Data models handle serialization.
- Repository implementations map data failures into domain failures.
- Datasources or API helpers should own endpoint calls.
- Use existing API consumers and helpers from `lib/core/api`.
- Keep endpoint constants in the existing endpoint location if the repo already uses it.

### 5. Register Dependencies

Use `injectable` annotations on services, repositories, use cases, and Cubits that need dependency injection.

Then regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Do not manually edit:

```text
lib/core/di/injection.config.dart
```

When one concrete repository implements multiple contracts, follow the auth pattern:

- Annotate the concrete implementation with `@LazySingleton()`.
- Bind each interface through a module in `lib/core/di/injection.dart`.
- Keep UI flows depending on the narrowest contract, such as `AuthSharedRepository` for OTP operations.

### 6. Add Models And Requests

Use existing model/request conventions:

- Request models usually live under `lib/core/requests` or a feature-specific `data/models` folder.
- Shared response models live under `lib/core/models`.
- Generated serialization files use `part '<file>.g.dart';`.
- Freezed models use `part '<file>.freezed.dart';` and usually `part '<file>.g.dart';` when JSON is needed.

After editing generated model inputs, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Do not manually edit `*.g.dart` or `*.freezed.dart`.

## Shared Auth Pattern

Use `lib/features/authentication/shared` for auth operations reused by more than one flow, for example login, sign-up, and password recovery.

Current shared auth pieces:

```text
lib/features/authentication/shared/
  data/models/requests/
    phone_number_request.dart
    verify_otp_request.dart
  domain/repositories/
    auth_shared_repository.dart
  domain/usecases/
    send_otp_usecase.dart
    verify_otp_usecase.dart
```

Guidelines:

- Keep generic auth actions here, such as send OTP and verify OTP.
- Keep product-specific lookup actions out until the app needs them.
- If a new project needs onboarding lookups, add methods to `AuthSharedRepository` and implement them in the existing auth repository implementation.
- Add request/response models under `features/authentication/shared/data/models` when they are only useful to authentication flows.
- Add tests for request serialization and usecase delegation when adding shared auth methods.

## Authenticated Shell Pattern

Use `lib/features/authenticated/main/presentation/screens/main_shell_screen.dart` as the default post-login shell.

Current shell tabs:

```text
lib/features/authenticated/home/
lib/features/authenticated/notifications/
lib/features/authenticated/profile/
```

Guidelines:

- Keep the base template to one generic bottom-navigation set.
- Do not add role-specific navigation strategies to the template.
- Add product-specific role dashboards only in copied projects that need them.
- Route successful authentication to `MainShellRoute`.
- Keep logout in the profile/account area and clear both access and refresh tokens.

## Refresh Token Pattern

401 refresh is owned by `lib/core/api/api_interceptors.dart`.

Rules:

- Production Dio must reject non-2xx responses so `401` reaches `onError`.
- The interceptor refreshes once, stores the returned tokens, and retries the original request once.
- Mark retried requests with request `extra` to avoid refresh loops.
- If refresh fails, force logout through `AuthCubit.onForceLogout()`.
- Do not duplicate refresh retry logic in repositories or UI flows.

### 7. Add Localization

Put visible strings in:

```text
lib/l10n/intl_en.arb
lib/l10n/intl_ar.arb
```

Regenerate:

```bash
flutter pub run intl_utils:generate
```

Use generated localization through:

```dart
S.of(context)
```

Do not hardcode user-facing strings in screens unless the surrounding code already does and the change is intentionally scoped.

### 8. Add Assets

Place assets under the existing asset folders, then update `pubspec.yaml` if a new folder must be included.

After changing asset declarations:

```bash
flutter pub get
```

Prefer reusing existing asset constants from generated asset helpers when available.

## Flavor Rules

Dependency environment is selected through `AppFlavor` and the bootstrap entry points:

```text
lib/bootstrap.dart
lib/main.dart
lib/main_mock.dart
lib/main_prod.dart
```

`lib/bootstrap.dart` calls:

```dart
di.configureDependencies(flavor: flavor);
```

Use the mock flavor for local UI work and the prod flavor for real backend wiring.

When adding environment-specific implementations:

- Annotate implementations with the correct injectable environment.
- Keep flavor switching in DI, not in widgets.
- Do not branch on flavor inside UI unless there is a direct product requirement.

## Testing Expectations

For a feature change, add focused tests when practical:

- Cubit tests for state transitions.
- Repository tests for mapping success and failure.
- Widget tests for important UI states.
- Route/navigation tests only when navigation behavior changes.

When testing widgets that use `GetIt`, initialize or mock required dependencies before pumping the widget.

Run the narrowest relevant check first, then broader checks:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

If analysis fails because generated files are missing, regenerate before debugging source code.

## CI Expectations

The Flutter workflow should use Flutter commands:

```bash
flutter pub get
flutter analyze
flutter test
```

Do not use `dart pub get`, `dart analyze`, or `dart test` as the main CI commands for this app because it depends on Flutter SDK packages such as `flutter_test`.

## Review Checklist

Before finishing a feature, check:

- Routes were regenerated if route definitions changed.
- DI was regenerated if injectable registrations changed.
- Models were regenerated if Freezed or JSON models changed.
- Localization was regenerated if ARB files changed.
- No generated files were manually edited.
- No unrelated refactors or dependency changes were introduced.
- User-facing strings support the app localization approach.
- `flutter pub get` succeeds.
- `flutter analyze` and `flutter test` were run, or blockers are reported clearly.

## Common Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs
flutter pub run intl_utils:generate
flutter analyze
flutter test
flutter run
```
