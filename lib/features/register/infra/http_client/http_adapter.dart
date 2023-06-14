import 'package:jf_desafio/features/register/data/data.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements IHttpClient {
  final client = http.Client();

  @override
  Future<HttpResponse> getCity({required int id}) async {
    String url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/municipios?orderBy=nome';
    final response = await client.get(Uri.parse(url));
    return HttpResponse(body: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> getState() async {
    String url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome';
    final response = await client.get(Uri.parse(url));
    return HttpResponse(body: response.body, statusCode: response.statusCode);
  }
}
