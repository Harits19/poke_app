import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/getx/pokemon_controller.dart';
import 'package:github_app/getx/theme_controller.dart';
import 'package:github_app/models/pokebag.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/ui/pokemon_detail/views/bouncing_ball.dart';
import 'package:github_app/ui/views/gap.dart';
import 'package:github_app/ui/views/header_view.dart';
import 'package:github_app/ui/views/touch_opacity.dart';
import 'package:github_app/utils/helper.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final PokemonController _controller = Get.find();

  _getPokemonDetail() async {
    final pokemon = _controller.listPokemon[index];
    if (pokemon.pokemonDetail != null) return;
    if (pokemon.name?.isEmpty ?? true) return;
    if (Get.context == null) return;
    Helper.func.showLoading(Get.context!);
    await _controller.getDetailPokemon(
      onError: (error) {
        Helper.func.showSnackbar(Get.context!, error);
      },
      pokemonName: pokemon.name!,
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PokemonController>(
          initState: (controller) {
            _getPokemonDetail();
          },
          builder: (controller) {
            final item = controller.listPokemon[index];
            return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    HeaderView(
                      useHome: true,
                      usePokebag: true,
                    ),
                    Text(
                      item.name ?? "",
                      style: T.text.h1,
                    ),
                    const Gap.verti(16),
                    Row(
                      children: [
                        Wrap(
                          spacing: 8,
                          children: [
                            ...(item.pokemonDetail?.types ?? []).map(
                              (e) => _type(text: e.type?.name),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap.verti(80),
                    Image.network(
                      C.string.imagePokemonUrl(item.id ?? ""),
                      width: 80,
                      height: 80,
                    ),
                    const Gap.verti(16),
                    GetBuilder<ThemeController>(builder: (controller) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: controller.isDarkMode
                              ? Colors.black
                              : Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._itemView(
                              text: "Ability",
                              children: [
                                ...(item.pokemonDetail?.abilities ?? []).map(
                                  (e) => _type(
                                    text: e.ability?.name,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            const Gap.verti(16),
                            ..._itemView(
                              text: "Moves",
                              children: [
                                ...(item.pokemonDetail?.moves ?? []).map(
                                  (e) => _type(
                                    text: e.move?.name,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TouchOpacity(
                    onTap: () {
                      controller.catchPokemon(
                        onError: (error) {
                          Helper.func.showSnackbar(context, error);
                        },
                        onSuccess: () {
                          _showModal(context, item, controller);
                        },
                      );
                    },
                    child: BouncingBall(
                      child: Image.network(
                        C.string.pokeball,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _type({
    Color color = Colors.black,
    String? text,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text ?? "",
        style: T.text.h2.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _itemView({
    String text = "",
    List<Widget> children = const [],
  }) {
    return [
      Text(
        text,
        style: T.text.h2,
      ),
      const Gap.verti(16),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: children,
      )
    ];
  }

  void _showModal(
      BuildContext context, Pokemon item, PokemonController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String username = "";
        return StatefulBuilder(
          builder: (context, setLocalState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Gotcha",
                      style: T.text.h1,
                    ),
                    const Gap.verti(16),
                    Text("Now enter your ${item.name} nickname"),
                    const Gap.verti(16),
                    TextField(
                      onChanged: (val) {
                        setLocalState(() => username = val);
                      },
                    ),
                    const Gap.verti(16),
                    ElevatedButton(
                        onPressed: username.isEmpty
                            ? null
                            : () {
                                controller.addPokemon(
                                  pokebag: Pokebag(
                                      pokemon: item, username: username),
                                );
                                Get.back();
                              },
                        child: const Text("Save"))
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
