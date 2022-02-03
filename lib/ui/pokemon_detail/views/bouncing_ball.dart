import 'package:flutter/material.dart';

class BouncingBall extends StatefulWidget {
  const BouncingBall({Key? key, this.child}) : super(key: key);

  @override
  _BouncingBallState createState() => _BouncingBallState();

  final Widget? child;
}

class _BouncingBallState extends State<BouncingBall>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 100,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: controller.value),
      child: widget.child,
    );
  }
}
