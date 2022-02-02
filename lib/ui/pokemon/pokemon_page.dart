import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/pokemon_detail/pokemon_detail_page.dart';
import 'package:github_app/ui/views/gap.dart';
import 'package:github_app/ui/views/header_title_view.dart';
import 'package:github_app/ui/views/header_view.dart';
import 'package:github_app/ui/views/pokemon_item_view.dart';
import 'package:github_app/ui/views/touch_opacity.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            HeaderTitleView(
              title: "Pokedex",
              usePokebag: true,
            ),
            ...List.generate(10, (index) => PokemonItemView()),
          ],
        ),
      ),
    );
  }
}
