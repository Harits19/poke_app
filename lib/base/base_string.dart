part of 'base.dart';

class _Image {
  const _Image();
  static const _path = "images/";
  String get icLogin => _path + "ic_login.png";
}

class _String {
  const _String();

  String get pokeball =>
      "https://upload.wikimedia.org/wikipedia/commons/4/4c/Pokeball.png";

  String imagePokemonUrl(String id) =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
}

class _Font {
  const _Font();

  // String get notoSans => "NotoSans";
  // String get poppins => "Poppins";
}
