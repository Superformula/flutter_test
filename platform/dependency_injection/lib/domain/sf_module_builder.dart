import 'package:flutter/widgets.dart';

abstract class SFModule {
  void registerProviders() {}

  Map<String, Widget Function(dynamic)> get routes => {};
}
