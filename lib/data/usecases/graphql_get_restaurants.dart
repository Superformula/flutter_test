import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../infra/http/http.dart';
import '../models/models.dart';

class GraphqlGetRestaurants implements GetRestaurants<String> {
  final HttpClient<Map, String?> _client;
  final String _url;

  const GraphqlGetRestaurants({
    required HttpClient<Map, String?> client,
    required String url,
  })  : _client = client,
        _url = url;

  @override
  Future<List<RestaurantEntity>> call(String data) async {
    try {
      final response = await _client.request(url: _url, method: 'post', data: data);
      return (response as List).map((item) => RestaurantModel.fromJson(item).toEntity()).toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
