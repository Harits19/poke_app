import 'package:get/get.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/services/pokemon_api.dart';

class PokemonController extends GetxController {
  List<Pokemon> listPokemon = <Pokemon>[];

  int page = 0;

  getPokemon({
    required Function(String) onError,
  }) async {
    await PokemonApi().getPokemon(
      pageKey: page,
      onSuccess: (val) {
        listPokemon.addAll(val);
        page++;
      },
      onError: onError,
    );
    update();
  }
}
