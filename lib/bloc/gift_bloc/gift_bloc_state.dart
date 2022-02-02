part of 'gift_bloc_cubit.dart';

abstract class GiftBlocState extends Equatable {
  const GiftBlocState();

  @override
  List<Object> get props => [];
}

class GiftBlocEmptyState extends GiftBlocState {}

class GiftBlocLazyLoadingState extends GiftBlocState {
  final List<Gift> gifts;
  const GiftBlocLazyLoadingState(this.gifts);
  @override
  List<Object> get props => [gifts];
}

class GiftBlocLoadedState extends GiftBlocState {
  final List<Gift> gifts;

  const GiftBlocLoadedState(this.gifts);

  @override
  List<Object> get props => [gifts];
}

class GiftBlocErrorState extends GiftBlocState {
  final String error;

  const GiftBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
