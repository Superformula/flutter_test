part of 'splash_screen_bloc.dart';

sealed class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();
}

class InitialEvent extends SplashScreenEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}
