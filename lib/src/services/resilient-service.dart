part of 'tmdb-service.dart';

abstract class ResilientService {
  Future<Response> getWithResilience(Uri uri) async {
    var response = await get(uri);
    if (response.statusCode == 429) {
      var retryAfter = int.parse(response.headers["retry-after"]);
      await Future.delayed(Duration(seconds: retryAfter));
      return await getWithResilience(uri);
    }
    return response;
  }
}
