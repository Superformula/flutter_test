import 'package:dio/dio.dart';
import 'package:restaurant_tour/core/utils/app_exceptions.dart';

abstract class RemoteDatasource {
  Future<Map<String, dynamic>> getRestaurants({int offset = 0});
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final Dio dio;

  RemoteDatasourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getRestaurants({int offset = 0}) async {
    final Response response = await dio.post(
      '/v3/graphql',
      data: _getQuery(offset),
    );

    if (response.statusCode != 200) throw ServerException();

    return response.data;
  }

  String _getQuery(int offset) {
    return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: \\$offset) {
    total
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
''';
  }
}
