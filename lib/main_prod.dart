import 'package:flutter/material.dart';
import 'package:restaurant_tour/app.dart';
import 'package:restaurant_tour/core/flavors.dart';

import 'core/dependency_injection/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(flavor: Flavor.prod);
  runApp(const App());
}
