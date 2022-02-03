import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/getx/pokemon_controller.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/ui/views/header_title_view.dart';
import 'package:github_app/ui/views/pokemon_item_view.dart';
import 'package:github_app/utils/helper.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonController _controller = Get.find();
  final _scrollController = ScrollController();
  bool isLoading = false;
  List<Pokemon> searchList = [];
  String query = "";

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
            final showList =
                query.isNotEmpty ? searchList : constroller.listPokemon;
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: HeaderTitleView(
                    title: "Pokedex",
                    usePokebag: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (val) {
                      searchList = constroller.listPokemon.where((element) {
                        if (element.name?.isEmpty ?? true) return false;
                        return element.name!.contains(val);
                      }).toList();
                      query = val;
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: [
                      ...List.generate(
                        showList.length,
                        (index) => PokemonItemView(
                          item: showList[index],
                        ),
                      )
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
