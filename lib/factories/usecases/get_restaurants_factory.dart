import '../../data/usecases/usecases.dart';
import '../../domain/usecases/usecases.dart';
import '../factories.dart';

GetRestaurants makeGetRestaurants() {
  final client = makeHttpAdapter();
  final url = makeApiUrl();
  return GraphqlGetRestaurants(client: client, url: url);
}
