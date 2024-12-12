
# Async Button Handler
![App Screenshot](https://raw.githubusercontent.com/mohamedelbalooty/async_button_handler/refs/heads/main/assets/images/logo.gif)

`Async Button Handler` is a Flutter package that simplifies handling asynchronous actions triggered by button presses. It manages loading states without requiring any additional state management libraries. The package is designed to help you reduce boilerplate code while maintaining a clean UI flow for async actions.

## Features

- **Loading State:** Shows a loading indicator while an asynchronous task is in progress.
- **Customizable UI:** Accepts custom widgets for both loading and default states, as well as button styling options.
- **Overlay Loading:** Displays a modal loading indicator overlay while tasks are running.
- **Minimal Setup:** Eliminates the need for a state management solution, making it easy to integrate into any Flutter project.

## Getting Started

### Installation

Add this package to your pubspec.yaml file:

```yaml
dependencies:
  async_button_handler: ^0.1.0
```

## Usage

First, import the package into your Dart file:

```dart
import 'package:async_button_handler/async_button_handler.dart';
```

Then, use the `AsyncButtonHandler` widget in your widget tree:

### Basic Usage

```dart
AsyncButtonHandler<Future<void>>(
  onPressed: () async {
    // Perform any asynchronous action here, e.g., API call
  },
  loadingChild: CircularProgressIndicator(),
  buttonChild: Text('Submit'),
);
```

### Overlay Loading Mode

```dart
AsyncButtonHandler<Future<void>>(
  onPressed: () async {
    // Perform any asynchronous action here
    await Future.delayed(Duration(seconds: 3));
  },
  overlayLoading: true,
  widget: Text('Submit'),
);
```

### Example App

Here is an example app demonstrating various use cases of `Async Button Handler`:

```dart
import 'package:async_button_handler/async_button_handler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  Future<void> asyncOperation() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => print('Hello world'),
    );
  }

  Future<String> asyncTypedOperation() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => 'Hello world',
    );
  }

  void syncOperation() {
    print('Hello world');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Button Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AsyncButtonHandler<Future<void>>(
              overlayLoading: false,
              onPressed: asyncOperation,
              loadingChild: const CircularProgressIndicator(),
              widget: const Text('Async Button'),
            ),
            const SizedBox(height: 10),
            AsyncButtonHandler<Future<String>>(
              overlayLoading: true,
              onPressed: asyncTypedOperation,
              loadingChild: const CircularProgressIndicator(),
              widget: const Text('Typed Async Button'),
            ),
            const SizedBox(height: 10),
            AsyncButtonHandler<void>(
              onPressed: syncOperation,
              loadingChild: const CircularProgressIndicator(),
              widget: const Text('Sync Button'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## What's New in Version 0.1.0

- **Removed `onError` Callback:** Package users can now handle exceptions directly outside the package for better customization and tracking.
- **Enhanced Overlay Loading Mode:** Improved behavior and usability for showing modal loading overlays.
- **Updated Documentation:** Example app included to showcase various use cases.

## Connect with the Creator

The creator aspires to help grow the Flutter community. If you have a question related to this project, your project, or anything Flutter, connect with him over the following links. Don't worry, it's free! 😉

- **[LinkedIn](https://eg.linkedin.com/in/mohamed-elbalooty)**
- **Email:** mohamedelbalooty123@gmail.com

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests on the [GitHub repository](https://github.com/your-repo/async_button_handler).
## License

This project is licensed under the MIT License. See the LICENSE file for details.

