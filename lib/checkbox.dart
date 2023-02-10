import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/providers/checkstatenotifier.dart';

List<bool> checks = [false, true, true, false];

class MyCheckBox extends ConsumerWidget {
  const MyCheckBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var checkboxChanged = ref.watch(myStateNotifierProvider);
    checks[checkboxChanged.index] = checkboxChanged.value;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(trues(checks).toString()),
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: checks.length,
                itemBuilder: (context, index) {
                  return Checkbox(
                    onChanged: (bool? value) {
                      ref
                          .read(myStateNotifierProvider.notifier)
                          .cont(index, value!);
                    },
                    value: checks[index],
                  );
                }),
          ),
        ],
      )),
    );
  }

  int trues(List<bool> checks) {
    int count = 0;
    checks.forEach((element) {
      if (element == true) count++;
    });
    return count;
  }
}
