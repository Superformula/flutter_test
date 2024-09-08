// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity.freezed.dart';

@freezed
class Connectivity with _$Connectivity {
  const factory Connectivity.connected() = ConnectivityConnected;
  const factory Connectivity.disconnected() = ConnectivityDisConnected;
}
