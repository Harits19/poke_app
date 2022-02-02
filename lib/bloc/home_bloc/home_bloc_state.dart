part of 'home_bloc_cubit.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

class HomeBlocInitialState extends HomeBlocState {}

class HomeBlocErrorState extends HomeBlocState {
  final String error;

  const HomeBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
