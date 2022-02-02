import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap.verti(double size, {Key? key})
      : height = size,
        width = null,
        super(key: key);

  const Gap.hori(double size, {Key? key})
      : height = null,
        width = size,
        super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
