part of 'nil_image_cubit.dart';

@immutable
sealed class NILImageState {
  const NILImageState();
  List<Object> get props => [];
}

final class NILImageInitial extends NILImageState {}

class NILImageLoading extends NILImageState {}

class NILImageLoaded extends NILImageState {
  final String imageLink;
  const NILImageLoaded(this.imageLink);

  @override
  List<Object> get props => [imageLink];
}

final class NILImageError extends NILImageState {
  final Object error;
  const NILImageError(this.error);
  @override
  List<Object> get props => [error];
}
