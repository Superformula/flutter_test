part of 'home_bloc.dart';

// we could use something like Freezed here handle the copyWith and equality
class HomeState extends Equatable {
  const HomeState({
    this.favoriteRestaurants = const [],
  });

  final List<Restaurant> favoriteRestaurants;

  HomeState copyWith({
    List<Restaurant>? favoriteRestaurants,
  }) {
    return HomeState(
      favoriteRestaurants: favoriteRestaurants ?? this.favoriteRestaurants,
    );
  }

  @override
  List<Object> get props => [favoriteRestaurants];
}
