part of 'epic_cubit.dart';

@immutable
sealed class EpicState {
  const EpicState();
  List<Object> get props => [];
}

final class EpicInitial extends EpicState {}

class EpicLoading extends EpicState {}

class EpicLoaded extends EpicState {
  final List<Epic> epic;
  const EpicLoaded(this.epic);
  @override
  List<Object> get props => [epic];
}

final class EpicError extends EpicState {
  final Object error;
  const EpicError(this.error);
  @override
  List<Object> get props => [error];
}
