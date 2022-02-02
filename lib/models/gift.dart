class Gift {
  String? id;
  String? type;
  Attributes? attributes;

  Gift({
    this.id,
    this.type,
    this.attributes,
  });

  Gift.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    type = json['type'] as String?;
    attributes = (json['attributes'] as Map<String, dynamic>?) != null
        ? Attributes.fromJson(json['attributes'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type;
    json['attributes'] = attributes?.toJson();
    return json;
  }
}

class Attributes {
  int? id;
  String? name;
  String? info;
  String? description;
  int? points;
  String? slug;
  int? stock;
  List<String>? images;
  int? isNew;
  double? rating;
  int? numOfReviews;
  int? isWishlist;

  Attributes({
    this.id,
    this.name,
    this.info,
    this.description,
    this.points,
    this.slug,
    this.stock,
    this.images,
    this.isNew,
    this.rating,
    this.numOfReviews,
    this.isWishlist,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    info = json['info'] as String?;
    description = json['description'] as String?;
    points = json['points'] as int?;
    slug = json['slug'] as String?;
    stock = json['stock'] as int?;
    images =
        (json['images'] as List?)?.map((dynamic e) => e as String).toList();
    isNew = json['isNew'] as int?;
    rating = json['rating'] as double?;
    numOfReviews = json['numOfReviews'] as int?;
    isWishlist = json['isWishlist'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['info'] = info;
    json['description'] = description;
    json['points'] = points;
    json['slug'] = slug;
    json['stock'] = stock;
    json['images'] = images;
    json['isNew'] = isNew;
    json['rating'] = rating;
    json['numOfReviews'] = numOfReviews;
    json['isWishlist'] = isWishlist;
    return json;
  }
}
