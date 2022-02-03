import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/getx/pokemon_controller.dart';
import 'package:github_app/ui/views/header_title_view.dart';
import 'package:github_app/ui/views/pokemon_item_view.dart';

class PokebagPage extends StatelessWidget {
  const PokebagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PokemonController>(
          builder: (controller) {
            final listPokebag = controller.listPokebag;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const HeaderTitleView(
                  title: "Pokebag",
                  useHome: true,
                ),
                ...List.generate(
                  listPokebag.length,
                  (index) => PokemonItemView(
                    item: listPokebag[index].pokemon,
                    username: listPokebag[index].username,
                    onDelete: () {
                      controller.releasePokemon(index: index);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
