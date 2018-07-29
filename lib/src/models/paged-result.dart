class PagedResult<T> {
  List<T> results;
  int totalResults;
  int totalPages;
  int page;

  PagedResult.fromJson(Map<String, dynamic> json, T factory(dynamic json)) {
    page = json["page"];
    totalPages = json["total_pages"];
    totalResults = json["total_results"];
    results =
        (json["results"] as List<dynamic>).map(factory).toList(growable: false);
  }
}
