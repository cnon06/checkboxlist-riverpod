import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolistriverpod/providers/checkstatenotifier.dart';
import 'package:todolistriverpod/providers/enumstatenotifier.dart';

List<bool> checks = [false, true, true, false];

enum TaskCategories { all, completed, uncompleted }

class MyCheckBox extends ConsumerWidget {
  const MyCheckBox({super.key});

  // TaskCategories groupValue = TaskCategories.completed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var checkboxChanged = ref.watch(myStateNotifierProvider);

    checks[checkboxChanged.index] = checkboxChanged.value;

    TaskCategories groupValue = ref.watch(myEnumStateNotifierProvider);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  checks.where((element) => element == true).length.toString()),
              Radio(
                  value: TaskCategories.all,
                  groupValue: groupValue,
                  onChanged: (value) {
                    ref
                        .read(myEnumStateNotifierProvider.notifier)
                        .selectRadioButton(TaskCategories.all);
                  }),
              const Text('All'),

              Radio(
                  value: TaskCategories.completed,
                  groupValue: groupValue,
                  onChanged: (value) 
                  {
                     ref
                        .read(myEnumStateNotifierProvider.notifier)
                        .selectRadioButton(TaskCategories.completed);
                  }),
              const Text('Completed'),

              Radio(
                  value: TaskCategories.uncompleted,
                  groupValue: groupValue,
                  onChanged: (value) 
                  {
                     ref
                        .read(myEnumStateNotifierProvider.notifier)
                        .selectRadioButton(TaskCategories.uncompleted);
                  }),
              const Text('Uncompleted'),

              
            ],
          ),
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
}
