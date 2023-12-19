import 'package:nasa_api_app/api/models/apod/apod.dart';

abstract class ApodState {
  const ApodState();

  List<Object> get props => [];
}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final Apod apod;
  const ApodLoaded(this.apod);
  @override
  List<Object> get props => [apod];
}

final class ApodError extends ApodState {
  final Object error;
  const ApodError(this.error);
  @override
  List<Object> get props => [error];
}
