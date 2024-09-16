import '../../data/usecases/usecases.dart';
import '../../domain/usecases/usecases.dart';
import '../factories.dart';

SaveFavoriteRestaurants makeSaveFavoriteRestaurants() {
  final localStorageAdapter = makeLocalStorageAdapter();
  return LocalSaveFavoriteRestaurants(cache: localStorageAdapter);
}
