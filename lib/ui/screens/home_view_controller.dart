import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'models/connectivity.dart';

final class ConnectivityCubit extends Cubit<Connectivity> {
  ConnectivityCubit({InternetConnectionChecker? connectionChecker})
      : connectionChecker = connectionChecker ?? InternetConnectionChecker(),
        super(const Connectivity.connected()) {
    connectionSubscription = connectionChecker?.onStatusChange.listen(
      (connectionState) {
        if (connectionState == InternetConnectionStatus.connected) {
          emit(const Connectivity.connected());
        } else {
          emit(const Connectivity.disconnected());
        }
      },
    );
  }

  StreamSubscription<InternetConnectionStatus>? connectionSubscription;
  final InternetConnectionChecker connectionChecker;

  void dispose() {
    connectionSubscription?.cancel();
  }
}
