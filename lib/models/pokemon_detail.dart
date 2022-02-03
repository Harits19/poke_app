part of 'pokemon.dart';

class PokemonDetail {
  List<Abilities>? abilities;
  int? baseExperience;
  List<Forms>? forms;
  List<GameIndices>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokemonDetail({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    abilities = (json['abilities'] as List?)
        ?.map((dynamic e) => Abilities.fromJson(e as Map<String, dynamic>))
        .toList();
    baseExperience = json['base_experience'] as int?;
    forms = (json['forms'] as List?)
        ?.map((dynamic e) => Forms.fromJson(e as Map<String, dynamic>))
        .toList();
    gameIndices = (json['game_indices'] as List?)
        ?.map((dynamic e) => GameIndices.fromJson(e as Map<String, dynamic>))
        .toList();
    height = json['height'] as int?;
    heldItems = json['held_items'] as List?;
    id = json['id'] as int?;
    isDefault = json['is_default'] as bool?;
    locationAreaEncounters = json['location_area_encounters'] as String?;
    moves = (json['moves'] as List?)
        ?.map((dynamic e) => Moves.fromJson(e as Map<String, dynamic>))
        .toList();
    name = json['name'] as String?;
    order = json['order'] as int?;
    pastTypes = json['past_types'] as List?;
    species = (json['species'] as Map<String, dynamic>?) != null
        ? Species.fromJson(json['species'] as Map<String, dynamic>)
        : null;
    sprites = (json['sprites'] as Map<String, dynamic>?) != null
        ? Sprites.fromJson(json['sprites'] as Map<String, dynamic>)
        : null;
    stats = (json['stats'] as List?)
        ?.map((dynamic e) => Stats.fromJson(e as Map<String, dynamic>))
        .toList();
    types = (json['types'] as List?)
        ?.map((dynamic e) => Types.fromJson(e as Map<String, dynamic>))
        .toList();
    weight = json['weight'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['abilities'] = abilities?.map((e) => e.toJson()).toList();
    json['base_experience'] = baseExperience;
    json['forms'] = forms?.map((e) => e.toJson()).toList();
    json['game_indices'] = gameIndices?.map((e) => e.toJson()).toList();
    json['height'] = height;
    json['held_items'] = heldItems;
    json['id'] = id;
    json['is_default'] = isDefault;
    json['location_area_encounters'] = locationAreaEncounters;
    json['moves'] = moves?.map((e) => e.toJson()).toList();
    json['name'] = name;
    json['order'] = order;
    json['past_types'] = pastTypes;
    json['species'] = species?.toJson();
    json['sprites'] = sprites?.toJson();
    json['stats'] = stats?.map((e) => e.toJson()).toList();
    json['types'] = types?.map((e) => e.toJson()).toList();
    json['weight'] = weight;
    return json;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = (json['ability'] as Map<String, dynamic>?) != null
        ? Ability.fromJson(json['ability'] as Map<String, dynamic>)
        : null;
    isHidden = json['is_hidden'] as bool?;
    slot = json['slot'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['ability'] = ability?.toJson();
    json['is_hidden'] = isHidden;
    json['slot'] = slot;
    return json;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({
    this.name,
    this.url,
  });

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class Forms {
  String? name;
  String? url;

  Forms({
    this.name,
    this.url,
  });

  Forms.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class GameIndices {
  int? gameIndex;
  Version? version;

  GameIndices({
    this.gameIndex,
    this.version,
  });

  GameIndices.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'] as int?;
    version = (json['version'] as Map<String, dynamic>?) != null
        ? Version.fromJson(json['version'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['game_index'] = gameIndex;
    json['version'] = version?.toJson();
    return json;
  }
}

class Version {
  String? name;
  String? url;

  Version({
    this.name,
    this.url,
  });

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class Moves {
  Move? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Moves({
    this.move,
    this.versionGroupDetails,
  });

  Moves.fromJson(Map<String, dynamic> json) {
    move = (json['move'] as Map<String, dynamic>?) != null
        ? Move.fromJson(json['move'] as Map<String, dynamic>)
        : null;
    versionGroupDetails = (json['version_group_details'] as List?)
        ?.map((dynamic e) =>
            VersionGroupDetails.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['move'] = move?.toJson();
    json['version_group_details'] =
        versionGroupDetails?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Move {
  String? name;
  String? url;

  Move({
    this.name,
    this.url,
  });

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class VersionGroupDetails {
  int? levelLearnedAt;
  MoveLearnMethod? moveLearnMethod;
  VersionGroup? versionGroup;

  VersionGroupDetails({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'] as int?;
    moveLearnMethod =
        (json['move_learn_method'] as Map<String, dynamic>?) != null
            ? MoveLearnMethod.fromJson(
                json['move_learn_method'] as Map<String, dynamic>)
            : null;
    versionGroup = (json['version_group'] as Map<String, dynamic>?) != null
        ? VersionGroup.fromJson(json['version_group'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['level_learned_at'] = levelLearnedAt;
    json['move_learn_method'] = moveLearnMethod?.toJson();
    json['version_group'] = versionGroup?.toJson();
    return json;
  }
}

class MoveLearnMethod {
  String? name;
  String? url;

  MoveLearnMethod({
    this.name,
    this.url,
  });

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class VersionGroup {
  String? name;
  String? url;

  VersionGroup({
    this.name,
    this.url,
  });

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class Species {
  String? name;
  String? url;

  Species({
    this.name,
    this.url,
  });

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class Sprites {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;
  Other? other;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backFemale = json['back_female'];
    backShiny = json['back_shiny'] as String?;
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'] as String?;
    frontShinyFemale = json['front_shiny_female'];
    other = (json['other'] as Map<String, dynamic>?) != null
        ? Other.fromJson(json['other'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_female'] = backFemale;
    json['back_shiny'] = backShiny;
    json['back_shiny_female'] = backShinyFemale;
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    json['front_shiny'] = frontShiny;
    json['front_shiny_female'] = frontShinyFemale;
    json['other'] = other?.toJson();
    return json;
  }
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = (json['dream_world'] as Map<String, dynamic>?) != null
        ? DreamWorld.fromJson(json['dream_world'] as Map<String, dynamic>)
        : null;
    home = (json['home'] as Map<String, dynamic>?) != null
        ? Home.fromJson(json['home'] as Map<String, dynamic>)
        : null;
    officialArtwork =
        (json['official-artwork'] as Map<String, dynamic>?) != null
            ? OfficialArtwork.fromJson(
                json['official-artwork'] as Map<String, dynamic>)
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['dream_world'] = dreamWorld?.toJson();
    json['home'] = home?.toJson();
    json['official-artwork'] = officialArtwork?.toJson();
    return json;
  }
}

class DreamWorld {
  String? frontDefault;
  dynamic frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    return json;
  }
}

class Home {
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'] as String?;
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    json['front_shiny'] = frontShiny;
    json['front_shiny_female'] = frontShinyFemale;
    return json;
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({
    this.frontDefault,
  });

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['front_default'] = frontDefault;
    return json;
  }
}

class Yellow {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  Yellow({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  Yellow.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backGray = json['back_gray'] as String?;
    backTransparent = json['back_transparent'] as String?;
    frontDefault = json['front_default'] as String?;
    frontGray = json['front_gray'] as String?;
    frontTransparent = json['front_transparent'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_gray'] = backGray;
    json['back_transparent'] = backTransparent;
    json['front_default'] = frontDefault;
    json['front_gray'] = frontGray;
    json['front_transparent'] = frontTransparent;
    return json;
  }
}

class Crystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  Crystal.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backShiny = json['back_shiny'] as String?;
    backShinyTransparent = json['back_shiny_transparent'] as String?;
    backTransparent = json['back_transparent'] as String?;
    frontDefault = json['front_default'] as String?;
    frontShiny = json['front_shiny'] as String?;
    frontShinyTransparent = json['front_shiny_transparent'] as String?;
    frontTransparent = json['front_transparent'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_shiny'] = backShiny;
    json['back_shiny_transparent'] = backShinyTransparent;
    json['back_transparent'] = backTransparent;
    json['front_default'] = frontDefault;
    json['front_shiny'] = frontShiny;
    json['front_shiny_transparent'] = frontShinyTransparent;
    json['front_transparent'] = frontTransparent;
    return json;
  }
}

class Gold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  Gold.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backShiny = json['back_shiny'] as String?;
    frontDefault = json['front_default'] as String?;
    frontShiny = json['front_shiny'] as String?;
    frontTransparent = json['front_transparent'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_shiny'] = backShiny;
    json['front_default'] = frontDefault;
    json['front_shiny'] = frontShiny;
    json['front_transparent'] = frontTransparent;
    return json;
  }
}

class Silver {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Silver({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  Silver.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backShiny = json['back_shiny'] as String?;
    frontDefault = json['front_default'] as String?;
    frontShiny = json['front_shiny'] as String?;
    frontTransparent = json['front_transparent'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_shiny'] = backShiny;
    json['front_default'] = frontDefault;
    json['front_shiny'] = frontShiny;
    json['front_transparent'] = frontTransparent;
    return json;
  }
}

class Emerald {
  String? frontDefault;
  String? frontShiny;

  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  Emerald.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'] as String?;
    frontShiny = json['front_shiny'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['front_default'] = frontDefault;
    json['front_shiny'] = frontShiny;
    return json;
  }
}

class Platinum {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Platinum({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Platinum.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backFemale = json['back_female'];
    backShiny = json['back_shiny'] as String?;
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'] as String?;
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_female'] = backFemale;
    json['back_shiny'] = backShiny;
    json['back_shiny_female'] = backShinyFemale;
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    json['front_shiny'] = frontShiny;
    json['front_shiny_female'] = frontShinyFemale;
    return json;
  }
}

class Animated {
  String? backDefault;
  dynamic backFemale;
  String? backShiny;
  dynamic backShinyFemale;
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Animated({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Animated.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'] as String?;
    backFemale = json['back_female'];
    backShiny = json['back_shiny'] as String?;
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'] as String?;
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['back_default'] = backDefault;
    json['back_female'] = backFemale;
    json['back_shiny'] = backShiny;
    json['back_shiny_female'] = backShinyFemale;
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    json['front_shiny'] = frontShiny;
    json['front_shiny_female'] = frontShinyFemale;
    return json;
  }
}

class Icons {
  String? frontDefault;
  dynamic frontFemale;

  Icons({
    this.frontDefault,
    this.frontFemale,
  });

  Icons.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'] as String?;
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['front_default'] = frontDefault;
    json['front_female'] = frontFemale;
    return json;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({
    this.baseStat,
    this.effort,
    this.stat,
  });

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'] as int?;
    effort = json['effort'] as int?;
    stat = (json['stat'] as Map<String, dynamic>?) != null
        ? Stat.fromJson(json['stat'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['base_stat'] = baseStat;
    json['effort'] = effort;
    json['stat'] = stat?.toJson();
    return json;
  }
}

class Stat {
  String? name;
  String? url;

  Stat({
    this.name,
    this.url,
  });

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}

class Types {
  int? slot;
  Type? type;

  Types({
    this.slot,
    this.type,
  });

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'] as int?;
    type = (json['type'] as Map<String, dynamic>?) != null
        ? Type.fromJson(json['type'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['slot'] = slot;
    json['type'] = type?.toJson();
    return json;
  }
}

class Type {
  String? name;
  String? url;

  Type({
    this.name,
    this.url,
  });

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}
