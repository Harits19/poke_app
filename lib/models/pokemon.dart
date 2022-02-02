class Pokemon {
  String? id;
  String? name;
  String? url;

  Pokemon({
    this.name,
    this.url,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
    id = url?.replaceAll("https://", "").split("/")[4];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['url'] = url;
    return json;
  }
}
