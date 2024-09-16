import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';


class MockHiveHelper extends Mock implements HiveHelper {}

class MockYelpRepository extends Mock implements YelpRepository {}