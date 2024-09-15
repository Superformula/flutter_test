import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.favoritesUsecaseContract})
      : super(FavoritesInitial());

  final FavoritesUsecaseContract favoritesUsecaseContract;

  void getFavorites() async {
    try {
      emit(FavoritesLoading());
      final favorites = await favoritesUsecaseContract.getFavorites();
      if (favorites.isEmpty) {
        emit(FavoritesEmpty());
        return;
      }
      emit(FavoritesLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoritesError(message: e.toString()));
    }
  }

  void saveFavorite(Restaurant restaurant) async {
    await favoritesUsecaseContract.saveFavorite(restaurant);
    getFavorites();
    isFavorite(restaurant);
  }

  void removeFavorite(Restaurant restaurant) async {
    await favoritesUsecaseContract.removeFavorite(restaurant);
    getFavorites();
  }

  void isFavorite(Restaurant restaurant) async {
    final isFavorite = await favoritesUsecaseContract.isFavorite(restaurant);
    emit(FavoritesIsFavorite(isFavorite: isFavorite));
  }
}
