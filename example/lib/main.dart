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
