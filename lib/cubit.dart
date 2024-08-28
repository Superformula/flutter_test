import 'dart:collection';

import 'package:hydrated_bloc/hydrated_bloc.dart';

/// A [Cubit] that manages the apps global state.
///
/// Currently, the only managed data is which restaurants have been favorited.
///
/// This is a [HydratedCubit], which means that changes to this data are
/// persisted to the users device.
final class RestaurantTourCubit extends HydratedCubit<Set<String>> {
  RestaurantTourCubit() : super({});

  /// Whether the restaurant with the given [id] is favorited.
  bool favorited(String id) => state.contains(id);

  /// Favorite the restaurant with the given [id].
  void favorite(String id) => emit({...state, id});

  /// Remove the restaurant with the given [id] from the favorites.
  void unfavorite(String id) => emit({...state}..remove(id));

  /// Toggle the favorite state of the restaurant with the given [id].
  void toggleFavorite(String id) {
    if (favorited(id)) {
      unfavorite(id);
    } else {
      favorite(id);
    }
  }

  @override
  Set<String> fromJson(Map<String, Object?> json) {
    final list = json['favorited'] as List<String>;
    return HashSet.from(list);
  }

  @override
  Map<String, Object?> toJson(Set<String> state) {
    return {
      'favorited': [...state],
    };
  }
}
