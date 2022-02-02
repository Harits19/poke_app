import 'package:flutter/material.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/ui/views/header_title_view.dart';
import 'package:github_app/ui/views/header_view.dart';
import 'package:github_app/ui/views/pokemon_item_view.dart';

class PokebagPage extends StatelessWidget {
  const PokebagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            HeaderTitleView(
              title: "Pokebag",
              useHome: true,
            ),
            ...List.generate(
              10,
              (index) => PokemonItemView(
                item: Pokemon(),
                onDelete: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
