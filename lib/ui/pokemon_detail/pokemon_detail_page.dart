import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/getx/pokemon_controller.dart';
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
      backgroundColor: Colors.grey[100],
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
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
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TouchOpacity(
                    onTap: () {
                      controller.catchPokemon(
                          pokemon: item,
                          onError: (error) {
                            Helper.func.showSnackbar(context, error);
                          });
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
}
