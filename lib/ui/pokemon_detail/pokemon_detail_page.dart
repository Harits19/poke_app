import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/views/gap.dart';
import 'package:github_app/ui/views/header_view.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const HeaderView(
                  useHome: true,
                  usePokebag: true,
                ),
                Text(
                  "Bulbasaur",
                  style: T.text.h1,
                ),
                const Gap.verti(16),
                Row(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: [
                        ...List.generate(
                          2,
                          (index) => _type(),
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap.verti(80),
                Image.network(
                  C.string.dummyPoke,
                  width: 80,
                  height: 80,
                ),
                const Gap.verti(16),
                Stack(
                  children: [
                    Gap.verti(Get.size.height),
                    Positioned.fill(
                      child: Container(
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
                            Text(
                              "Moves",
                              style: T.text.h2,
                            ),
                            const Gap.verti(16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ...List.generate(
                                    20,
                                    (index) => _type(
                                          color: Colors.blue,
                                        ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.network(
                C.string.pokeball,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _type({
    Color color = Colors.black,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "grass",
        style: T.text.h2.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
