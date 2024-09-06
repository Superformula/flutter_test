import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/usecases/favorite/get_favorite_restaurants_usecase.dart';
import 'package:state_management/presentation/sf_state.dart';

class FavoriteRestaurantsTabPresenter extends Cubit<SFState> {
  FavoriteRestaurantsTabPresenter() : super(SFInitialState());

  final GetFavoriteRestaurantsUsecase _getRestaurantsUsecase =
      SFInjector.instance.get<GetFavoriteRestaurantsUsecase>();

  Future<void> loadRestaurants() async {
    emit(SFLoadingState());
    var response = await _getRestaurantsUsecase.execute();
    if (response.isRight) {
      emit(
        SFSuccessState<List<Restaurant>>(
          object: response.right,
        ),
      );
    } else {
      emit(SFErrorState());
    }
  }
}
