part of 'all_restaurants_tab_bloc.dart';

class AllRestaurantsTabState extends Equatable {
  const AllRestaurantsTabState({
    this.restaurants = const [],
    this.contentIsLoading = true,
    this.error,
  });

  final List<Restaurant> restaurants;
  final bool contentIsLoading;
  final BaseError? error;

  AllRestaurantsTabState copyWith({
    List<Restaurant>? restaurants,
    bool? contentIsLoading,
    BaseError? error,
  }) {
    return AllRestaurantsTabState(
      restaurants: restaurants ?? this.restaurants,
      contentIsLoading: contentIsLoading ?? this.contentIsLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        restaurants,
        contentIsLoading,
        error,
      ];
}
