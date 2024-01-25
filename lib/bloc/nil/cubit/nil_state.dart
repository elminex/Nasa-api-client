part of 'nil_cubit.dart';

@immutable
sealed class NILState {
  const NILState();
  List<Object> get props => [];
}

final class NILInitial extends NILState {}

class NILLoading extends NILState {}

class NILLoaded extends NILState {
  final FilteredNILCollection collection;
  const NILLoaded(this.collection);
  @override
  List<Object> get props => [collection];
}

final class NILError extends NILState {
  final Object error;
  const NILError(this.error);
  @override
  List<Object> get props => [error];
}
