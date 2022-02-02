class ApiResponse {
  int? count;
  String? next;
  String? previous;
  dynamic results;

  ApiResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  ApiResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int?;
    next = json['next'] as String?;
    previous = json['previous'] as String?;
    results = (json['results'] as dynamic);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['count'] = count;
    json['next'] = next;
    json['previous'] = previous;
    json['results'] = results?.map((e) => e.toJson()).toList();
    return json;
  }
}
