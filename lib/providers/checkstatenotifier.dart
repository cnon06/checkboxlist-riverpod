import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/checkbox.dart';

final myStateNotifierProvider =
    StateNotifierProvider<CheckNotifier, Map<int, bool>>(
        (ref) => CheckNotifier({0: checks[0]}));

class CheckNotifier extends StateNotifier<Map<int, bool>> {
  CheckNotifier(super.state);

  void cont(int index, bool value) {
    state = {index: value};
    value;
  }
}

// final myStateNotifierProvider = StateNotifierProvider<CheckNotifier,bool>((ref) => CheckNotifier(false));

// class CheckNotifier extends StateNotifier<bool> {
//   CheckNotifier(super.state);

//   void cont(bool value) {
//     state = value;
//   }
// }
