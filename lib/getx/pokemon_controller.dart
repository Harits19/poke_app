import 'package:get/get.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/services/pokemon_api.dart';

class PokemonController extends GetxController {
  List<Pokemon> listPokemon = <Pokemon>[];
  List<Pokemon> listPokebag = [];
  bool successCatch = true;

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

  getDetailPokemon({
    required Function(String) onError,
    required String pokemonName,
  }) async {
    await PokemonApi().getDetailPokemon(
      name: pokemonName,
      onSuccess: (val) {
        final index = listPokemon.indexWhere(
          (element) => element.name == pokemonName,
        );
        if (index < 0) return;
        listPokemon[index].pokemonDetail = val;
      },
      onError: onError,
    );
    update();
  }

  catchPokemon({
    required Pokemon pokemon,
    required Function(String) onError,
  }) {
    if (successCatch) {
      listPokebag.removeWhere(
        (element) => element.name == pokemon.name,
      );
      listPokebag.add(pokemon);
    } else {
      onError("Gagal menangkap pokemon");
    }
    successCatch = !successCatch;
    update();
  }

  releasePokemon({
    required int index,
  }) {
    listPokebag.removeAt(index);
    update();
  }
}
