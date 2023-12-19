import 'package:bloc/bloc.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/bloc/apod/apod_state.dart';

class ApodCubit extends Cubit<ApodState> {
  ApodCubit() : super(ApodInitial());

  void fetchCurrentApod() async {
    emit(ApodLoading());
    try {
      final apod = await ApiRepository().getCurrentApod();
      emit(ApodLoaded(apod));
    } catch (error) {
      emit(ApodError(error));
    }
  }

  void fetchRandomApod() async {
    emit(ApodLoading());
    try {
      final apod = await ApiRepository().getRandomApod();
      emit(ApodLoaded(apod));
    } catch (error) {
      emit(ApodError(error));
    }
  }
}
