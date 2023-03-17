import 'package:flutter_test/flutter_test.dart';
import 'package:jf_desafio/data/data.dart';
import 'package:jf_desafio/infra/infra.dart';

void main() {
  late HttpAdapter sut;

  setUp(() {
    sut = HttpAdapter();
  });
  group('GetStates Call', () {
    test('Should return a HttpResponse', () async {
      final result = await sut.getState();
      expect(result, isA<HttpResponse>());
      
    });

    test('Should return a Success(200)', () async {
      final result = await sut.getState();
      expect(result.statusCode, 200);
    });
  });

  group('GetCities Call', () {
    test('Should return a HttpResponse', () async {
      final result = await sut.getCity(id: 31);
      expect(result, isA<HttpResponse>());
    });

    test('Should return a Success(200)', () async {
      final result = await sut.getCity(id: 33);
      expect(result.statusCode, 200);
    });
  });
}
