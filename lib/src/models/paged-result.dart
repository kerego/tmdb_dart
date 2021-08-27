class PagedResult<T> {
  final List<T> results;
  final int totalResults;
  final int totalPages;
  final int page;

  PagedResult._createPage({
    this.results = const [],
    int? totalResults,
    int? totalPages,
    int? page,
  })  : page = page ?? 0,
        totalResults = totalResults ?? 0,
        totalPages = totalPages ?? 0;

  factory PagedResult.fromJson(
    Map<String, dynamic> json,
    T factory(Map<String, dynamic> json),
  ) =>
      PagedResult._createPage(
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        results:
            (json["results"] ?? []).map<T>(factory).toList(growable: false),
      );
}
