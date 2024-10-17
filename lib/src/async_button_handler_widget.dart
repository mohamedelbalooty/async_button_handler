import 'package:flutter/material.dart';

class AsyncButtonHandler extends StatefulWidget {
  const AsyncButtonHandler({
    super.key,
    required this.onPressed,
    this.loadingChild,
    this.buttonChild,
    this.style,
    this.onError,
  });

  final Future<void> Function() onPressed;
  final Widget? loadingChild;
  final Widget? buttonChild;
  final ButtonStyle? style;
  final Function(Exception)? onError;

  @override
  State<AsyncButtonHandler> createState() => _AsyncButtonHandlerState();
}

class _AsyncButtonHandlerState extends State<AsyncButtonHandler> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style ??
          ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size(200, 50),
          ),
      onPressed: isLoading ? null : _handlePressBehavior,
      child: isLoading
          ? widget.loadingChild ?? const CircularProgressIndicator()
          : widget.buttonChild ?? const Text('Button'),
    );
  }

  void _handlePressBehavior() async {
    setState(() => isLoading = true);
    try {
      await widget.onPressed();
    } catch (e) {
      if (widget.onError != null) {
        widget.onError!(e as Exception);
      }
    } finally {
      setState(() => isLoading = false);
    }
  }
}