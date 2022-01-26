fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios distribute_with_testflight

```sh
[bundle exec] fastlane ios distribute_with_testflight
```

Push a new beta build to TestFlight

### ios make_develop_ipa

```sh
[bundle exec] fastlane ios make_develop_ipa
```

Build develop

### ios build_develop

```sh
[bundle exec] fastlane ios build_develop
```

Build develop

### ios build_staging

```sh
[bundle exec] fastlane ios build_staging
```

Build staging

### ios distribute_develop_with_firebase

```sh
[bundle exec] fastlane ios distribute_develop_with_firebase
```

Push a new develop build to Firebase App Distribution

### ios distribute_staging_with_firebase

```sh
[bundle exec] fastlane ios distribute_staging_with_firebase
```

Push a new staging build to Firebase App Distribution

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
