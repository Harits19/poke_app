class ApiResponse {
  Meta? meta;
  List<dynamic>? data;
  Links? links;

  ApiResponse({
    this.meta,
    this.data,
    this.links,
  });

  ApiResponse.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
    data = (json['data'] as List?);
    links = (json['links'] as Map<String, dynamic>?) != null
        ? Links.fromJson(json['links'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['meta'] = meta?.toJson();
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['links'] = links?.toJson();
    return json;
  }
}

class Meta {
  int? totalItems;
  int? currentPage;
  int? itemPerPage;
  int? totalPages;

  Meta({
    this.totalItems,
    this.currentPage,
    this.itemPerPage,
    this.totalPages,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'] as int?;
    currentPage = json['currentPage'] as int?;
    itemPerPage = json['itemPerPage'] as int?;
    totalPages = json['totalPages'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['totalItems'] = totalItems;
    json['currentPage'] = currentPage;
    json['itemPerPage'] = itemPerPage;
    json['totalPages'] = totalPages;
    return json;
  }
}

class Links {
  String? self;
  String? next;
  String? last;

  Links({
    this.self,
    this.next,
    this.last,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] as String?;
    next = json['next'] as String?;
    last = json['last'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['self'] = self;
    json['next'] = next;
    json['last'] = last;
    return json;
  }
}
