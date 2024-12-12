import 'package:flutter/material.dart';

class AsyncButtonHandler<T> extends StatefulWidget {
  const AsyncButtonHandler({
    super.key,
    required this.onPressed,
    this.loadingChild,
    this.widget,
    this.style,
    this.overlayLoading = false,
  });

  final T Function() onPressed;
  final Widget? loadingChild;
  final Widget? widget;
  final ButtonStyle? style;
  final bool overlayLoading;

  @override
  State<AsyncButtonHandler<T>> createState() => _AsyncButtonHandlerState<T>();
}

class _AsyncButtonHandlerState<T> extends State<AsyncButtonHandler<T>> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style ??
          ElevatedButton.styleFrom(minimumSize: const Size(200, 48)),
      onPressed: isLoading ? null : () => _handlePressBehavior(context),
      child: isLoading
          ? widget.loadingChild ?? const CircularProgressIndicator()
          : widget.widget ?? const Text('Button'),
    );
  }

  void _handlePressBehavior(BuildContext context) async {
    final isAsync = widget.onPressed is Future Function();
    if (isAsync) {
      if (!widget.overlayLoading) {
        setState(() => isLoading = true);
        try {
          await (widget.onPressed as Future Function())();
        } catch (e) {
          rethrow;
        } finally {
          if (mounted) setState(() => isLoading = false);
        }
      } else {
        _showOverlayLoading(context);
        try {
          await (widget.onPressed as Future Function())();
        } catch (e) {
          rethrow;
        } finally {
          if (mounted) _hideOverlayLoading(context);
        }
      }
    } else {
      widget.onPressed();
    }
  }

  void _showOverlayLoading(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Center(
            child: widget.loadingChild ?? const CircularProgressIndicator()),
      ),
    );
  }

  void _hideOverlayLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
