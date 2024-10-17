<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Async Button Handler

`Async Button Handler` is a Flutter package that simplifies handling asynchronous actions triggered by button presses. It
manages loading and error states without requiring any additional state management libraries. The package is designed to
help you reduce boilerplate code while maintaining a clean UI flow for async actions.

## Features

- **Loading State:** Shows a loading indicator while an asynchronous task is in progress.
- **Error Handling:** Optionally handles errors and allows custom error callbacks.
- **Customizable UI:** Accepts custom widgets for both loading and default states, as well as button styling options.
- **Minimal Setup:** Eliminates the need for a state management solution, making it easy to integrate into any Flutter
  project.

## Getting started

### Installation

Add this package to your pubspec.yaml file:

```yaml
dependencies:
async_button_handler: ^1.0.0
```

## Usage

First, import the package into your Dart file:

```dart

import 'package:async_button_handler/async_button_handler.dart';

```
Then, use the AsyncButton widget in your widget tree:
```dart
AsyncButtonHandler(
  onPressed: () async {
    // Perform any asynchronous action here, e.g., API call
  },
  loadingChild: CircularProgressIndicator(),
  buttonChild: Text('Submit'),
  onError: (error) {
    // Handle error here, e.g., show a snackBar or dialog
    print("Error: $error");
  },
),
```

