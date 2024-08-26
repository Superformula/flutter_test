import 'dart:developer';

import 'package:restaurant_tour/env.dart';
import 'package:restaurant_tour/network/network_client.dart';

class YielpDatasource {
  final INetworkClient networkClient;
  final String baseUrl;

  YielpDatasource({required this.networkClient, required this.baseUrl});

  Future<Map<String, dynamic>?> fetchRestaurants(int offset) async {
    try {
      final String query = _getQuery(offset);
      final response = await networkClient.post(
        '$baseUrl/v3/graphql',
        data: query,
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/graphql',
        },
      );
      return response;
    } on Exception catch (e) {
      log(e.toString());
      return null;
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
