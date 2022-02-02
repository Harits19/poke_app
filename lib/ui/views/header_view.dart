import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/getx/theme_controller.dart';
import 'package:github_app/ui/pokebag/pokebag_page.dart';
import 'package:github_app/ui/pokemon/pokemon_page.dart';
import 'package:github_app/ui/views/gap.dart';

class HeaderView extends StatelessWidget {
  HeaderView({Key? key, this.useHome = false, this.usePokebag = false})
      : super(key: key);

  final bool useHome, usePokebag;

  final ThemeController theme = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GetBuilder<ThemeController>(builder: (controller) {
              return IconButton(
                  onPressed: () {
                    theme.toggleThemeMode();
                  },
                  icon: Icon(
                    controller.isDarkMode
                        ? CupertinoIcons.sun_max_fill
                        : CupertinoIcons.moon_fill,
                  ));
            }),
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
