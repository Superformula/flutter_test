import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../infra/http/http.dart';
import '../models/models.dart';

class RemoteGetRestaurants implements GetRestaurants {
  final HttpClient<Map, String?> _client;
  final String _url;

  const RemoteGetRestaurants({
    required HttpClient<Map, String?> client,
    required String url,
  })  : _client = client,
        _url = url;

  static const query = '''
  query getRestaurants {
    search(location: "Las Vegas", limit: 20, offset: 0) {
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

  @override
  Future<List<RestaurantEntity>> call() async {
    try {
      final response = await _client.request(url: _url, method: 'post', data: query);
      return (response['data']['search']['business'] as List).map((item) => RestaurantModel.fromJson(item).toEntity()).toList();
    } catch (e, s) {
      debugPrintStack(label: 'Error $e', stackTrace: s);
      throw DomainError.unexpected;
    }
  }
}
