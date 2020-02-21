import 'dart:async';
import 'package:tmdb_dart/tmdb_dart.dart';

Future main(List<String> arguments) async {
  assert(arguments.length == 1);
  TmdbService service = TmdbService(arguments[0]);

  // auto configure api based on default configuration
  await service.initConfiguration();

  var pagedResult = await service.searchMovies("harry");

  for (var movie in pagedResult.results) {
    print("${movie.title} - ${movie.voteAverage}");
  }

  // OR custom configure api based on your requirments
  service.configuration = Configuration(
    baseUrl: "http://image.tmdb.org/t/p/",
    secureBaseUrl: "https://image.tmdb.org/t/p/",
    backdropSizes: ["original"],
    logoSizes: ["original"],
    posterSizes: ["original"],
    profileSizes: ["original"],
    stillSizes: ["original"],
  );

  var popular = await service.getPopularMovies(MovieSearchSettings());

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
  var futures = Iterable.generate(100)
      .map((x) => service.searchMovies(x.toString()))
      .toList();
  await Future.wait(futures);
}
