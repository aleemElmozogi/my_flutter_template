# My Flutter Template

A reusable Flutter application template with a feature-first structure, dependency injection, routing, localization, API helpers, shared widgets, and common mobile app building blocks.

This repository is intended to be cloned or copied when starting a new Flutter project, then renamed and adapted to the target product.

## What Is Included

- Flutter app structure with `lib/core`, `lib/config`, `lib/data`, and `lib/features`.
- Bloc/Cubit state management using `flutter_bloc`.
- Dependency injection using `get_it` and `injectable`.
- Declarative routing using `auto_route`.
- API layer built around `dio`, interceptors, status codes, and mock/prod API consumers.
- Shared authentication foundation for reusable OTP send/verify flows.
- Authenticated home shell with a single bottom-navigation template.
- 401 refresh-token retry handling in the Dio interceptor.
- Localization setup for Arabic and English.
- Shared app theme, widgets, validators, dialogs, storage helpers, and network helpers.
- Model/code generation support with `build_runner`, `freezed`, `json_serializable`, `injectable_generator`, and `auto_route_generator`.
- Firebase dependencies for authentication, core setup, and messaging.
- GitHub Actions workflow for Flutter dependency install, analysis, and tests.

## Project Structure

```text
lib/
  app.dart                         # Root MaterialApp.router setup
  main.dart                        # App bootstrap and dependency environment
  config/
    routes/                        # AutoRoute configuration
    themes/                        # App theme
  core/
    api/                           # API consumers, helpers, interceptors
    di/                            # GetIt/Injectable setup
    enums/                         # Shared enums
    error/                         # Exceptions and failures
    localStorage/                  # Local storage helpers
    models/                        # Shared response and pagination models
    network/                       # Connectivity abstractions
    requests/                      # Shared request models
    usecases/                      # Base use case contracts
    utils/                         # Assets, colors, strings, extensions
    validation/                    # Input validation
    widgets/                       # Reusable UI widgets
  data/
    repositories/                  # Shared repositories
    services/                      # Shared services
  features/
    authenticated/                 # Home shell and authenticated tabs
    authentication/                # Example auth feature
      shared/                      # Shared auth requests, contracts, usecases
    startUp/                       # Splash/onboarding/localization feature
  generated/                       # Generated localization output
  l10n/                            # ARB localization source files
```

## Prerequisites

Install Flutter stable and make sure it is available on your path:

```bash
flutter --version
```

This project uses Flutter SDK packages such as `flutter` and `flutter_test`, so use Flutter commands instead of Dart-only commands.

```bash
flutter pub get
flutter analyze
flutter test
```

Do not use `dart pub get` for this project.

## Setup Existing Project

From the project root:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter pub run intl_utils:generate
flutter run
```

Use `flutter pub get` whenever dependencies change.

Run code generation after changing any file that uses generated parts, including:

- `@injectable` dependency registrations.
- `@AutoRouterConfig` route definitions.
- `@freezed` models or states.
- `json_serializable` models.
- request/response models with `part '*.g.dart'`.

For active development, you can keep generators running:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Flavor Selection

The app boots through `lib/bootstrap.dart` and configures dependencies from an `AppFlavor`:

```dart
di.configureDependencies(flavor: flavor);
```

Available entry points:

```text
lib/main.dart       # Resolves flavor from compile-time defines
lib/main_mock.dart  # Boots AppFlavor.mock
lib/main_prod.dart  # Boots AppFlavor.prod
```

Run a specific flavor:

```bash
flutter run -t lib/main_mock.dart
flutter run -t lib/main_prod.dart
```

Or pass the flavor through compile-time defines:

```bash
flutter run --dart-define=APP_FLAVOR=mock
flutter run --dart-define=APP_FLAVOR=prod
```

Use the mock flavor while developing screens without a backend. Use the prod flavor when wiring the app to real services. Keep flavor-specific behavior behind injectable services, repositories, or API consumers so the UI does not need to know which backend mode is active.

## Environment Keys

Do not commit real API keys in Dart, Android manifests, iOS plist files, or Swift files.

The template reads Dart-side values from compile-time environment defines:

```dart
AppEnvironment.apiBaseUrl
AppEnvironment.apiSpkiSha256Pins
AppEnvironment.googleMapsApiKey
AppEnvironment.aiApiKey
```

Create a local env file from the committed example:

```bash
cp env/example.json env/dev.json
```

Fill `env/dev.json` locally:

```json
{
  "API_BASE_URL": "https://api.example.com",
  "API_SPKI_SHA256_PINS": "",
  "GOOGLE_MAPS_API_KEY": "your-local-google-maps-key",
  "AI_API_KEY": "your-local-ai-key"
}
```

`API_BASE_URL` must be an absolute HTTPS URL in the prod flavor. The optional
`API_SPKI_SHA256_PINS` value is a comma-separated list of SPKI SHA-256 pins.
Always configure both the current pin and a backup pin so certificates can be
rotated without locking users out of the API. Generate a pin from a server
certificate with:

```bash
openssl s_client -servername api.example.com -connect api.example.com:443 </dev/null 2>/dev/null \
  | openssl x509 -pubkey -noout \
  | openssl pkey -pubin -outform DER \
  | openssl dgst -sha256 -binary \
  | openssl base64 -A
```

Store the values as `sha256/<current-pin>,sha256/<backup-pin>`. Leave the
setting empty to use normal platform TLS validation without pinning.

`env/*.json` is ignored by Git, except `env/example.json`.

Run the app with:

```bash
flutter run --dart-define-from-file=env/dev.json
```

You can combine this with flavors:

```bash
flutter run -t lib/main_prod.dart --dart-define-from-file=env/prod.json
flutter build apk --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
flutter build ios --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
```

For Android native manifest values, `android/app/build.gradle` resolves `GOOGLE_MAPS_API_KEY` from:

1. `android/local.properties`
2. the shell/CI environment variable `GOOGLE_MAPS_API_KEY`
3. Flutter `--dart-define-from-file`

For iOS native Google Maps setup, copy the committed example:

```bash
cp ios/Flutter/Env.xcconfig.example ios/Flutter/Env.xcconfig
```

Then set:

```xcconfig
GOOGLE_MAPS_API_KEY=your-local-google-maps-key
```

`ios/Flutter/Env.xcconfig` is ignored by Git and included by Debug/Release xcconfig files. In CI, generate this file from repository secrets before building iOS.

API keys bundled into a mobile app are not fully secret after release. For production, restrict Google keys by Android package/SHA-1 and iOS bundle ID, and keep truly sensitive AI/server keys behind your backend rather than calling those services directly from the app.

## Shared Authentication

Reusable auth operations that are shared across login, sign-up, and password recovery live under:

```text
lib/features/authentication/shared/
```

The template includes:

- `AuthSharedRepository` for shared auth contracts.
- `PhoneNumberRequest` for phone-based auth actions.
- `VerifyOtpRequest` for OTP verification.
- `SendOtpUsecase` for requesting an OTP.
- `VerifyOtpUsecase` for validating an OTP.

The existing `AuthRepositoryImpl` implements both `AuthRepository` and `AuthSharedRepository`, so projects can keep one concrete auth API implementation while exposing focused contracts to different flows.

Project-specific onboarding lookups, such as cities, branches, circles, roles, or student profiles, should be added as separate shared-auth methods only when the new product needs them.

## Authenticated Home Shell

The authenticated area starts at:

```text
lib/features/authenticated/main/presentation/screens/main_shell_screen.dart
```

It provides one reusable bottom-navigation shell with three starter tabs:

```text
HomeRoute
NotificationsRoute
ProfileRoute
```

After login succeeds, the app replaces the route stack with `MainShellRoute`. The profile tab includes a logout action that returns the auth state to unauthenticated.

Use this as the default new-project app shell. If a product needs role-specific dashboards later, add that behavior in the copied project instead of expanding the base template.

## Token Refresh

401 handling is implemented in the Dio interceptor:

```text
lib/core/api/api_interceptors.dart
```

When an authenticated request receives `401`, the interceptor:

- sends the stored refresh token to `EndPoints.refreshToken`;
- saves the returned access and refresh tokens;
- retries the original request once with the new access token;
- forces logout if refresh fails or the retried request is still unauthorized.

The production Dio client rejects non-2xx responses so 401 reaches the interceptor instead of being parsed as a normal response.

## Localization

Localization source files live in:

```text
lib/l10n/intl_en.arb
lib/l10n/intl_ar.arb
```

After changing translations, regenerate localization files:

```bash
flutter pub run intl_utils:generate
```

The app uses `S.delegate` and `S.of(context)` from the generated localization files.

## Assets And Fonts

Assets are declared in `pubspec.yaml`:

```yaml
assets:
  - assets/images/
```

The template includes the `Tajawal` font family. If you add or remove fonts/assets, update `pubspec.yaml`, then run:

```bash
flutter pub get
```

## Using This Template For A New Project

1. Copy or clone this repository into a new folder.
2. Rename the project in `pubspec.yaml`:

   ```yaml
   name: your_project_name
   description: "Your project description"
   ```

3. Replace package imports that reference the template package name:

   ```text
   package:my_flutter_template/
   ```

   with:

   ```text
   package:your_project_name/
   ```

4. Rename app labels and bundle identifiers for each platform:

   - Android package/application id under `android/`.
   - iOS bundle identifier under `ios/`.
   - App display name under Android and iOS platform files.

5. Update the localization app name in the ARB files under `lib/l10n`.
6. Replace placeholder assets, launcher icons, splash assets, and fonts as needed.
7. Configure Firebase only if the new project needs it:

   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

   Then enable Firebase initialization in `lib/main.dart`.

8. Regenerate project code:

   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   flutter pub run intl_utils:generate
   ```

9. Run the app and verify the template boots:

   ```bash
   flutter run
   ```

10. Run quality checks:

    ```bash
    flutter analyze
    flutter test
    ```

## Adding A New Feature

Prefer placing product code under `lib/features/<feature_name>` and keep shared utilities under `lib/core` only when they are genuinely reusable.

A typical feature can use this shape:

```text
lib/features/example/
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

When adding dependencies for a feature, register them with `injectable` and regenerate:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## CI

The GitHub Actions workflow is located at:

```text
.github/workflows/flutter.yml
```

It runs on pushes and pull requests to `main`:

```bash
flutter pub get
flutter analyze
flutter test
```

If CI fails on dependency installation, check that the workflow is using Flutter setup and not Dart-only setup. Flutter projects must use `flutter pub get`.

## Common Commands

```bash
# Install dependencies
flutter pub get

# Run code generators once
dart run build_runner build --delete-conflicting-outputs

# Watch code generators during development
dart run build_runner watch --delete-conflicting-outputs

# Regenerate localization files
flutter pub run intl_utils:generate

# Analyze source
flutter analyze

# Run tests
flutter test

# Run the app
flutter run
```

## Current Notes

- Generated files are part of the project workflow. If analysis reports missing `*.g.dart`, `*.freezed.dart`, route, injection, or localization files, run the generation commands above.
- The test suite may need project-specific dependency setup when `GetIt` services are required by widgets under test.
- Keep template changes small and reusable. Product-specific behavior should live in the copied project, not in the base template unless it is broadly useful.
