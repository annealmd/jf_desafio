abstract class IHttpClient {
  Future<HttpResponse> getCity();

  Future<HttpResponse> getState();
}

class HttpResponse {
  final dynamic body;
  final int statusCode;

  HttpResponse({required this.body, required this.statusCode});
}
