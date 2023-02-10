import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/checkbox.dart';
import 'package:todolistriverpod/model/indexvalue.dart';

final mySelectListStateNotifierProvider =
    StateNotifierProvider<SelectListNotifier, List<bool>>(
        (ref) => SelectListNotifier(checks));

class SelectListNotifier extends StateNotifier<List<bool>> {
  SelectListNotifier(super.state);

  void selectList(TaskCategories enumCategory) {
    // List<bool> newList = [];
    switch (enumCategory) {
      case TaskCategories.all:
        state = checks;
        //  state = checks.where((element) => element == true).toList();
        break;

      case TaskCategories.completed:
        state = checks.where((element) => element == true).toList();
        break;

      case TaskCategories.uncompleted:
        state = checks.where((element) => element == false).toList();
        break;
    }

    // state = IndexValue(index: index, value: value);
  }
}
