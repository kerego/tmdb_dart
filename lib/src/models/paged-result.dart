class PagedResult<T> {
  final List<T> results;
  final int totalResults;
  final int totalPages;
  final int page;

  PagedResult._createPage({
    this.results = const [],
    this.totalResults = 0,
    this.totalPages = 0,
    this.page = 0,
  });

  factory PagedResult.fromJson(
    Map<String, dynamic> json,
    T factory(Map<String, dynamic> json),
  ) =>
      PagedResult._createPage(
        page: json["page"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
        results:
            (json["results"] ?? []).map<T>(factory).toList(growable: false),
      );
}
