import '../../data/usecases/usecases.dart';
import '../../domain/usecases/usecases.dart';
import '../factories.dart';

GetFavoriteRestaurants makeGetFavoriteRestaurants() {
  final localStorageAdapter = makeLocalStorageAdapter();
  return LocalGetFavoriteRestaurants(cache: localStorageAdapter);
}
