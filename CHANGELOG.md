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

## 0.0.4

* Changed http package version 

## 0.0.5

* Upgraded version of the 'http' package
* Upgraded sdk version to stable (was 'dev' previosly)
* Enhanced getMovie() method to support new appending options
    1. Alternative Titles
    2. Credits
    3. External Ids
    4. Keywords
    5. Videos
    6. Recommendations
    7. Similar Movies

## 0.0.6

* Asset Resolver now resolves null urls to null instead of prepending image url
* MovieBase constructor does not fail anymore on null release date

## 0.0.7

* Fix for null properties in serialized movie search settings

## 0.0.8

* Fix code style according to dartfmt
* Rename Image to ImageInfo for better import resolution when used with flutter

## 0.0.9

* [Akash Mondal](https://github.com/Akash98Sky) - Fix typo in MovieBase constructor causing exceptions when accesing movie genres

## 0.0.10

* [Akash Mondal](https://github.com/Akash98Sky) - Fix Exception:ArgumentError while parsing release_date at MovieBase.fromJson() constructor
* [Akash Mondal](https://github.com/Akash98Sky) - Remove unnecessary new keywords and Re-format some code
* [Akash Mondal](https://github.com/Akash98Sky) - Fix warnings due to unused variables and Improve some codes
* [Akash Mondal](https://github.com/Akash98Sky) - Add assertion to parameters of TmdbService, Configuration constructors

## 0.0.11

* [Akash Mondal](https://github.com/Akash98Sky) - Add a seperate quality Original to AssetQuality
* [Akash Mondal](https://github.com/Akash98Sky) - Change all Movie Settings constructors to const
* [Akash Mondal](https://github.com/Akash98Sky) - Add new classes SortBy and Date for movie discover
* [Akash Mondal](https://github.com/Akash98Sky) - Add new movie service functions.
    1. discoverMovies()
    2. getAllMovieGenres()
    3. getAllCountries()
