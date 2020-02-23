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
    backdropSizes: ["w300", "w780", "w1280", "original"],
    logoSizes: ["w300", "w780", "w1280", "original"],
    posterSizes: ["w300", "w780", "w1280", "original"],
    profileSizes: ["w300", "w780", "w1280", "original"],
    stillSizes: ["w300", "w780", "w1280", "original"],
  );

  var popular = await service.getPopularMovies(MovieSearchSettings());

  for (var movie in popular.results) {
    print("${movie.title} - ${movie.voteAverage}");
  }

  var discover = await service.discoverMovies(MovieDiscoverSettings(
    primaryReleaseDateGTE: Date(day: 15, month: 9, year: 2010),
    primaryReleaseDateLTE: Date(day: 22, month: 10, year: 2015),
    voteAverageGTE: 5.5,
    withPeople: [108916, 7467],
    sortBy: SortBy.popularity.desc,
    quality: QualitySettings(
      backdropQuality: AssetQuality.High,
      logoQuality: AssetQuality.High,
      posterQuality: AssetQuality.High,
      profileQuality: AssetQuality.High,
      stillQuality: AssetQuality.High,
    ),
  ));

  for (var movie in discover.results) {
    print("${movie.title} - ${movie.voteAverage} - ${movie.releaseDate}");
  }

  var movie = await service.getMovie(671,
      appendSettings: MovieAppendSettings(
          includeRecommendations: true, includeSimilarMovies: true));

  print("${movie.recommendations[0].title}");
  print("${movie.similar[0].title}");
  print("${(await service.getAllCountries()).length}");
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
