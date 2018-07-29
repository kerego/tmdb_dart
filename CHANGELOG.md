## 0.0.1

* Initial release.

## 0.0.1+1

* Renamed main lib file according to pub guidelines
* Relaxed constraint on http dependency

## 0.0.2
* Added methods for predefined searches: getTopRatedMovies(), getPopularMovies(), getUpcomingMovies(), getNowPlayingMovies(), getLatestMovies()

## 0.0.3

* Added methods for getting movie details getMovie() 
* Partial support for response appending of getMovie(), currently only Images are appended 
* Renamed Resolution to AssetQuality
* Extracted Asset Path resolving methods from Configuration class to AssetResolver