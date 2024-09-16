import '../../presentation/presentation.dart';
import '../../ui/pages/pages.dart';
import '../factories.dart';

RestaurantTourPresenter makeRestaurantTourPresenter() {
  return CubitRestaurantTourPresenter(getRestaurants: makeGetRestaurants());
}
