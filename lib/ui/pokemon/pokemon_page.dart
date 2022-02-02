import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/getx/pokemon_controller.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/ui/views/header_title_view.dart';
import 'package:github_app/ui/views/pokemon_item_view.dart';
import 'package:github_app/utils/helper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PokemonPage extends StatefulWidget {
  PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonController _controller = Get.find();
  final _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (isTop) {
        } else {
          _getData();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getData() async {
    isLoading = true;
    setState(() {});
    await _controller.getPokemon(onError: (err) {
      Helper.func.showSnackbar(context, err);
    });
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PokemonController>(
          builder: (constroller) {
            print("list pokemon length " +
                constroller.listPokemon.length.toString());
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: [
                      const HeaderTitleView(
                        title: "Pokedex",
                        usePokebag: true,
                      ),
                      ...constroller.listPokemon.map((e) {
                        print("id pokemon " + e.id.toString());
                        return PokemonItemView(
                          item: e,
                        );
                      }),
                    ],
                  ),
                ),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
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
