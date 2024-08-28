import 'dart:collection';

import 'package:hydrated_bloc/hydrated_bloc.dart';

final class RestaurantTourCubit extends HydratedCubit<Set<String>> {
  RestaurantTourCubit() : super({});

  bool favorited(String id) => state.contains(id);

  void favorite(String id) => emit({...state, id});

  void unfavorite(String id) => emit({...state}..remove(id));

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
