import 'package:bloc/bloc.dart';

class CoblosCubit extends Cubit<List<String>> {
  CoblosCubit() : super([]);

  void selectPaslon(String id) {
    print('sebelum = $state');
    if (!isSelected(id)) {
      List<String> newState = List.from(state);
      newState.clear();
      newState.add(id);
      emit(List.from(newState));
    }
    print('sesudah = $state');
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    print('index = $index');
    return index != -1;
  }
}
