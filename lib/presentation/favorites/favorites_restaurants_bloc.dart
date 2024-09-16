import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'favorites_restaurants_event.dart';
part 'favorites_restaurants_state.dart';

class FavoritesRestaurantsBloc
    extends Bloc<FavoritesRestaurantsEvent, FavoritesRestaurantsState> {
  FavoritesRestaurantsBloc(this.usecase)
      : super(FavoritesRestaurantsInitial()) {
    on<LoadFavoriteRestaurants>((event, emit) async {
      try {
        emit(FavoriteRestaurantsLoading());
        final favorites = await usecase.getFavoriteRestaurants();
        emit(FavoriteRestaurantReady(favorites));
      } catch (e) {
        emit(FavoriteRestaurantsError());
      }
    });
  }
  final RestaurantsUsecase usecase;
}
