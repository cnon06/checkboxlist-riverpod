import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/providers/checkstatenotifier.dart';

List<bool> checks = [false, true, true, false];

class MyCheckBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<int, bool> trr = ref.watch(myStateNotifierProvider);
    checks[trr.keys.first] = trr.values.first;
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: checks.length,
              itemBuilder: (context, index) {
                // checks[index] = ref.watch(myStateNotifierProvider);
                return Checkbox(
                  onChanged: (bool? value) {
                    ref
                        .read(myStateNotifierProvider.notifier)
                        .cont(index, value!);
                  },
                  // value: ref.watch(myStateNotifierProvider),
                  value: checks[index],
                );
              })

          //     child: Checkbox(
          //   onChanged: (bool? value) {
          //     ref.read(myStateNotifierProvider.notifier).cont(value!);
          //   },
          //   value: ref.watch(myStateNotifierProvider),
          // )

          ),
    );
  }
}
