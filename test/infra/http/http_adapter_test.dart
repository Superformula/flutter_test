import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/infra/infra.dart';

class ClientSpy extends Mock implements Client {}

class UriFake extends Fake implements Uri {}

void main() {
  late HttpAdapter sut;
  late ClientSpy client;
  late String url;
  late Uri uri;
  late String data;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client: client, headers: {'content-type': 'application/json', 'accept': 'application/json'});
    url = faker.internet.httpUrl();
    uri = Uri.parse(url);
    data = '{"any_key":"any_value"}';
  });

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  group('shared', () {
    test('Should throw ServeError if invalid method is provided', () async {
      final future = sut.request(url: url, method: 'invalid_method');
      expect(future, throwsA(HttpError.serverError));
    });
  });

  group('post', () {
    When mockRequest() {
      return when(
        () => client.post(any(), body: any(named: 'body'), headers: any(named: 'headers')),
      );
    }

    void mockError() {
      mockRequest().thenThrow(Exception());
    }

    void mockResponse(int statusCode, {String body = '{"any_key":"any_value"}'}) {
      mockRequest().thenAnswer(
        (_) async => Response(body, statusCode),
      );
    }

    setUp(() {
      mockResponse(200);
    });

    test('Should call post with correct values', () async {
      await sut.request(
        url: url,
        method: 'post',
        data: '{"any_key":"any_value"}',
      );

      verify(
        () => client.post(
          uri,
          headers: {'content-type': 'application/json', 'accept': 'application/json'},
          body: data,
        ),
      );
    });

    test('Should call post without body', () async {
      await sut.request(url: url, method: 'post');
      verify(() => client.post(any(), headers: any(named: 'headers')));
    });

    test('Should return data if post returns 200', () async {
      final response = await sut.request(url: url, method: 'post', data: data);
      expect(response, {'any_key': 'any_value'});
    });

    test('Should return null if post returns 200 with no data', () async {
      mockResponse(200, body: '');
      final response = await sut.request(url: url, method: 'post', data: data);
      expect(response, null);
    });

    test('Should return BadRequestError if post returns 400', () async {
      mockResponse(400, body: '');
      final future = sut.request(url: url, method: 'post', data: data);
      expect(future, throwsA(HttpError.badRequest));
    });

    test('Should return BadRequestError if post returns 400', () async {
      mockResponse(400);
      final future = sut.request(url: url, method: 'post', data: data);
      expect(future, throwsA(HttpError.badRequest),);
    });

    test('Should return UnathorizedError if post returns 401', () async {
      mockResponse(401);
      final future = sut.request(url: url, method: 'post', data: data);
      expect(future, throwsA(HttpError.unauthorized));
    });

    test('Should return ServerError if post returns 500', () async {
      mockResponse(500);
      final future = sut.request(url: url, method: 'post', data: data);
      expect(future, throwsA(HttpError.serverError));
    });

    test('Should return ServerError if post throws', () async {
      mockError();
      final future = sut.request(url: url, method: 'post', data: data);
      expect(future, throwsA(HttpError.serverError));
    });
  });
}
