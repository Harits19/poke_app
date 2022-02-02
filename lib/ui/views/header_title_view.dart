import 'package:flutter/material.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/views/gap.dart';
import 'package:github_app/ui/views/header_view.dart';

class HeaderTitleView extends StatelessWidget {
  const HeaderTitleView({
    Key? key,
    this.title = "",
    this.usePokebag = false,
    this.useHome = false,
  }) : super(key: key);

  final String title;
  final bool useHome, usePokebag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderView(
          useHome: useHome,
          usePokebag: usePokebag,
        ),
        Text(
          title,
          style: T.text.h1,
        ),
        Gap.verti(16)
      ],
    );
  }
}
