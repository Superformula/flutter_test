part of 'splash_screen_bloc.dart';

sealed class SplashScreenState extends Equatable {
  const SplashScreenState();
}

final class SplashScreenInitial extends SplashScreenState {
  @override
  List<Object> get props => [];
}

class PushToHomeState extends SplashScreenState {
  const PushToHomeState();

  @override
  List<Object?> get props => [];
}