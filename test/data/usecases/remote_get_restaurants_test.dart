import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/usecases/usecases.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';
import 'package:restaurant_tour/infra/infra.dart';

import '../../core/factories.dart';

class HttpClientSpy extends Mock implements HttpClient<Map, String?> {}

void main() {
  late RemoteGetRestaurants sut;
  late HttpClientSpy httpClient;
  late String url;
  late Map data;

  When mockRequest() {
    return when(
      () => httpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'),
        data: any(named: 'data'),
      ),
    );
  }

  void mockHttpData(Map mockData) {
    data = mockData;
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() {
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    sut = RemoteGetRestaurants(url: url, client: httpClient);
    mockHttpData({
      'data': {
        'search': {
          'business': makeRemoteRestaurantsJson(),
        },
      },
    });
  });

  test('Should call HttpClient with correct values', () async {
    await sut();
    verify(() => httpClient.request(url: any(named: 'url'), method: any(named: 'method'), data: any(named: 'data')));
  });

  test('Should return restaurants on 200', () async {
    final articles = await sut();
    expect(articles, isA<List<RestaurantEntity>>());
    expect(articles, isNotEmpty);
  });

  test('Should throw UnexpectedError if HttpClient returns 200 with invalid data', () async {
    mockHttpData({'invalid_key': 'invalid_value'});
    final future = sut();
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 400', () async {
    mockHttpError(HttpError.badRequest);
    final future = sut();
    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);
    final future = sut();
    expect(future, throwsA(DomainError.unexpected));
  });
}
