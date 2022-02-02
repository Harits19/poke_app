import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/pokebag/pokebag_page.dart';
import 'package:github_app/ui/pokemon/pokemon_page.dart';
import 'package:github_app/ui/views/gap.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key, this.useHome = false, this.usePokebag = false})
      : super(key: key);

  final bool useHome, usePokebag;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (useHome)
              InkWell(
                onTap: () {
                  Get.offAll(() => PokemonPage());
                },
                child: Text(
                  "Home",
                  style: T.text.h2,
                ),
              ),
            Spacer(),
            if (usePokebag)
              InkWell(
                onTap: () {
                  Get.to(() => PokebagPage());
                },
                child: Text(
                  "Pokebag",
                  style: T.text.h2,
                ),
              )
          ],
        ),
        Gap.verti(32),
      ],
    );
  }
}
