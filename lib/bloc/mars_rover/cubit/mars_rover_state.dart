part of 'mars_rover_cubit.dart';

@immutable
sealed class MarsRoverState {
  const MarsRoverState();
  List<Object> get props => [];
}

final class MarsRoverInitial extends MarsRoverState {}

class MarsRoverLoading extends MarsRoverState {}

class MarsRoverLoaded extends MarsRoverState {
  final List<RoverPhoto> photos;
  const MarsRoverLoaded(this.photos);
  @override
  List<Object> get props => [photos];
}

class MarsRoverLoadedNoImages extends MarsRoverState {}

final class MarsRoverError extends MarsRoverState {
  final Object error;
  const MarsRoverError(this.error);
  @override
  List<Object> get props => [error];
}
