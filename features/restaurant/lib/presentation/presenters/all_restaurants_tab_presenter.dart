import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/presentation/sf_state.dart';
import '../../domain/usecases/get_restaurants_usecase.dart';

class AllRestaurantsTabPresenter extends Cubit<SFState> {
  AllRestaurantsTabPresenter() : super(SFInitialState());

  final GetRestaurantsUsecase _getRestaurantsUsecase =
      SFInjector.instance.get<GetRestaurantsUsecase>();

  Future<void> loadRestaurants() async {
    emit(SFLoadingState());
    var response = await _getRestaurantsUsecase.execute();
    if (response.isRight) {
      emit(SFSuccessState(object: response.right));
    } else {
      emit(SFErrorState());
    }
  }
}
