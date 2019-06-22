import 'dart:async';
import 'package:tmdb_dart/tmdb_dart.dart';

Future main(List<String> arguments) async {
  assert(arguments.length == 1);
  TmdbService service = new TmdbService(arguments[0]);
  await service.initConfiguration();

  var pagedResult = await service.searchMovies("harry");

  for (var movie in pagedResult.results) {
    print("${movie.title} - ${movie.voteAverage}");
  }

  var popular = await service.getPopularMovies(new MovieSearchSettings());

  for (var movie in popular.results) {
    print("${movie.title} - ${movie.voteAverage}");
  }

  var movie = await service.getMovie(671,
      appendSettings: MovieAppendSettings(
          includeRecommendations: true, includeSimilarMovies: true));

  print("${movie.recommendations[0].title}");
  print("${movie.similar[0].title}");
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
