import 'package:flutter/material.dart';
import 'package:restaurant_tour/app.dart';

import 'core/dependency_injection/service_locator.dart';

void main() {
  setupLocator();
  runApp(const App());
}
