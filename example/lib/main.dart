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

  Future<void> _simulateAsyncOperation() async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulates a 2-second delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Button Example')),
      body: Center(
        child: AsyncButtonHandler(
          onPressed: _simulateAsyncOperation,
          loadingChild: const CircularProgressIndicator(),
          buttonChild: const Text('Click Me'),
          onError: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('An error occurred: $e')),
            );
          },
        ),
      ),
    );
  }
}
