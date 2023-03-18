abstract class IHttpClient {
  Future<HttpResponse> getCity({required int id});

  Future<HttpResponse> getState();
}

class HttpResponse {
  final dynamic body;
  final int statusCode;

  HttpResponse({required this.body, required this.statusCode});
}
