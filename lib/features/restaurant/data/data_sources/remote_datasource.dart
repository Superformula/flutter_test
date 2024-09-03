import 'package:dio/dio.dart';
import 'package:restaurant_tour/utils/app_exceptions.dart';

abstract class RemoteDatasource {
  Future<Map<String, dynamic>> getRestaurants({int offset = 0});
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final Dio dio;

  RemoteDatasourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getRestaurants({int offset = 0}) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getQuery(offset),
      );
      return response.data!['data']['search'];
    } on DioException catch (e) {
      throw AppException(message: e.message);
    }
  }

  String _getQuery(int offset) {
    return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
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
