import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/pokemon_detail/pokemon_detail_page.dart';
import 'package:github_app/ui/views/touch_opacity.dart';

class PokemonItemView extends StatelessWidget {
  const PokemonItemView({
    Key? key,
    this.onDelete,
  }) : super(key: key);

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: () {
        Get.to(() => const PokemonDetailPage());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: -2,
                blurRadius: 4,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Bulbasaur",
                style: T.text.h2,
              ),
              Image.network(
                C.string.dummyPoke,
                alignment: Alignment.centerRight,
                width: 80,
                height: 80,
              ),
              if (onDelete != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    CupertinoIcons.delete,
                    color: Colors.grey,
                    size: 32,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
