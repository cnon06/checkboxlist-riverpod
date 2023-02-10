import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/checkbox.dart';

final myEnumStateNotifierProvider =

      StateNotifierProvider<EnumNotifier, TaskCategories>(
        (ref) => EnumNotifier(TaskCategories.completed));

class EnumNotifier extends StateNotifier<TaskCategories> {
  EnumNotifier(super.state);

 
  void selectRadioButton(enumNotifier) {
    state = enumNotifier ;
    
  }
}
