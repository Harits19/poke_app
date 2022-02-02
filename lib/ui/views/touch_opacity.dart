import 'package:flutter/material.dart';

class TouchOpacity extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  const TouchOpacity({required this.child, this.onTap, Key? key})
      : super(key: key);

  @override
  _TouchOpacityState createState() => _TouchOpacityState();
}

class _TouchOpacityState extends State<TouchOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        child: widget.child,
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
      ),
    );
  }
}
