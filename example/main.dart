import 'dart:async';
import 'package:tmdb_dart/tmdb.dart';

Future main() async {
  TmdbService service = new TmdbService("apikey");
  await service.initConfiguration();

  var pagedResult = await service.searchMovies("harry");

  for (var movie in pagedResult.results) {
    print("${movie.title} - ${movie.voteAverage}");
  }
}

// generate many requests
// number of requests is over the allowed threshold
// but thanks to integrated resilience, all the requests are completed successfully
Future resilienceExample(TmdbService service) async {
  var futures = new Iterable.generate(100)
      .map((x) => service.searchMovies(x.toString()))
      .toList();
  await Future.wait(futures);
}
