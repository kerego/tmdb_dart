abstract class SortBy {
  /// SortBy order to be used for both Movie and TV show discover
  static final _Order popularity = _Order._defaultDesc("popularity"),
      vote_average = _Order._defaultDesc("vote_average"),
      vote_count = _Order._defaultDesc("vote_count");

  /// SortBy order to be used for Movie discover
  static final _Order primary_release_date =
          _Order._defaultDesc("primary_release_date"),
      release_date = _Order._defaultDesc("release_date"),
      revenue = _Order._defaultDesc("revenue"),
      original_title = _Order._defaultAsc("original_title");

  /// SortBy order to be used for TV show discover
  static final _Order first_air_date = _Order._defaultDesc("vote_count");
}

class _Order extends SortBy {
  final String? _by, _order;
  final _Order? _other;

  SortBy get asc => _order == "asc" ? this : _other!;

  SortBy get desc => _order == "desc" ? this : _other!;

  _Order._defaultAsc(
    this._by, {
    bool createDesc = true,
  })  : this._order = "asc",
        _other = createDesc ? _Order._defaultDesc(_by, createAsc: false) : null;

  _Order._defaultDesc(
    this._by, {
    bool createAsc = true,
  })  : this._order = "desc",
        _other = createAsc ? _Order._defaultAsc(_by, createDesc: false) : null;

  @override
  String toString() => _by! + "." + _order!;
}
