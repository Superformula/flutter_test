import 'package:equatable/equatable.dart';

abstract class SFState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SFInitialState extends SFState {
  @override
  List<Object?> get props => [];
}

class SFSuccessState<T> extends SFState {
  final T object;

  SFSuccessState({required this.object});
  @override
  List<Object?> get props => [];
}

class SFLoadingState extends SFState {
  @override
  List<Object?> get props => [];
}

class SFErrorState extends SFState {
  final String? error;
  SFErrorState({this.error});
  @override
  List<Object?> get props => [];
}
