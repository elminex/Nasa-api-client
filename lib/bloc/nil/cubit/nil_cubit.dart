import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/api/models/nil/nil_collection.dart';

part 'nil_state.dart';

class NILCubit extends Cubit<NILState> {
  NILCubit() : super(NILInitial());

  void getCollections(String query) async {
    emit(NILLoading());
    try {
      final collections = await ApiRepository().getNILCollection(query);
      emit(NILLoaded(collections));
    } catch (error) {
      emit(NILError(error));
    }
  }
}
