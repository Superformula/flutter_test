import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_tour/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future configureDependencies() async {
  getIt.init();
}
