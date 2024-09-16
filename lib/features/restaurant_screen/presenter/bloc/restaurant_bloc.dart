import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc({required this.hiveHelper}) : super(RestaurantInitial()) {
    on<CheckFavoriteEvent>(_onCheckFavoriteEvent);
    on<AddFavoriteEvent>(_onAddFavoriteEvent);
    on<RemoveFavoriteEvent>(_onRemoveFavoriteEvent);
  }

  final HiveHelper hiveHelper;

  Future<void> _onCheckFavoriteEvent(
    CheckFavoriteEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const AppBarLoadingState());
    try {
      List<String> favoriteIds = hiveHelper.getAllFavoriteIds();
      bool isFavorite = favoriteIds.contains(event.restaurant.id);

      emit(VerifiedState(isFavorite: isFavorite));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddFavoriteEvent(
    AddFavoriteEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const AppBarLoadingState());
    try {
      await hiveHelper.addFavorite(event.restaurantId);
      emit(const VerifiedState(isFavorite: true));
    } catch (e) {
      emit(FavoriteOperationError(message: e.toString()));
    }
  }

  Future<void> _onRemoveFavoriteEvent(
    RemoveFavoriteEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const AppBarLoadingState());
    try {
      await hiveHelper.removeFavorite(event.restaurantId);
      emit(const VerifiedState(isFavorite: false));
    } catch (e) {
      emit(FavoriteOperationError(message: e.toString()));
    }
  }
}
