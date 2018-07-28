part of 'tmdb-service.dart';

abstract class ResilientService {
  String _apiKey;

  Future<Response> getWithResilience(Uri uri) async {
    var response = await get(uri);
    if (response.statusCode == 429) {
      var retryAfter = int.parse(response.headers["retry-after"]);
      await new Future.delayed(new Duration(seconds: retryAfter));
      return await getWithResilience(uri);
    }
    return response;
  }
}
