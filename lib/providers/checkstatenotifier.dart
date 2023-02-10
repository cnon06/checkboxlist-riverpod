import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/checkbox.dart';
import 'package:todolistriverpod/model/indexvalue.dart';

final myStateNotifierProvider =

      StateNotifierProvider<CheckNotifier, IndexValue>(
        (ref) => CheckNotifier(IndexValue(index: 0, value: checks[0])));

class CheckNotifier extends StateNotifier<IndexValue> {
  CheckNotifier(super.state);

  void cont(int index, bool value) {
    state = IndexValue(index: index, value: value) ;
    value;
  }
}
