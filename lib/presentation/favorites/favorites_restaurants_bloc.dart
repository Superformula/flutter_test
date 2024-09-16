import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';

part 'favorites_restaurants_event.dart';
part 'favorites_restaurants_state.dart';

class FavoritesRestaurantsBloc
    extends Bloc<FavoritesRestaurantsEvent, FavoritesRestaurantsState> {
  FavoritesRestaurantsBloc(this.usecase)
      : super(FavoritesRestaurantsInitial()) {
    on<LoadFavoritesRestaurants>((event, emit) async {
      try {
        emit(FavoritesRestaurantsLoading());
        final favorites = await usecase.getFavoriteRestaurants();
        emit(FavoritesRestaurantsReady(favorites));
      } catch (e) {
        emit(FavoriteRestaurantsListError(FavoritesRestaurantsListException()));
      }
    });
    on<AddFavoriteRestaurant>(
      (event, emit) async {
        try {
          emit(FavoritesRestaurantsLoading());
          await usecase.addFavoriteRestaurant(event.restaurant);
          final favoritesRestaurants = await usecase.getFavoriteRestaurants();
          emit(FavoritesRestaurantsReady(favoritesRestaurants));
        } catch (e) {
          emit(AddFavoriteRestaurantsError(AddFavoriteRestaurantException()));
        }
      },
    );

    on<RemoveFavoriteRestaurant>(
      (event, emit) async {
        try {
          emit(FavoritesRestaurantsLoading());
          await usecase.removeFavoriteRestaurant(event.restaurant);
          final favoritesRestaurants = await usecase.getFavoriteRestaurants();
          emit(FavoritesRestaurantsReady(favoritesRestaurants));
        } catch (e) {
          emit(
            RemoveFavoriteRestaurantsError(
              RemoveFavoriteRestaurantException(),
            ),
          );
        }
      },
    );
  }
  final RestaurantsUsecase usecase;
}
