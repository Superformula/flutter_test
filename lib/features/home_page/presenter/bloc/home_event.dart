part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}


class InitialEvent extends HomeEvent {
  const InitialEvent();

  @override
  List<Object> get props => [];
}