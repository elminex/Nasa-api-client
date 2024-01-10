part of 'visible_planets_cubit.dart';

@immutable
sealed class VisiblePlanetsState {
  const VisiblePlanetsState();
  List<Object> get props => [];
}

final class VisiblePlanetsInitial extends VisiblePlanetsState {}

final class VisiblePlanetsLoading extends VisiblePlanetsState {}

final class VisiblePlanetsLoaded extends VisiblePlanetsState {
  final List<Data> listOfPlanets;
  const VisiblePlanetsLoaded(this.listOfPlanets);

  @override
  List<Object> get props => [listOfPlanets];
}

final class VisiblePlanetsError extends VisiblePlanetsState {
  final Object error;
  const VisiblePlanetsError(this.error);
  @override
  List<Object> get props => [error];
}
