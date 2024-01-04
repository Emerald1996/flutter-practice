import 'package:flutter/material.dart';
import '../providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Center(
        child: Column(
            // Centers the children inside the column
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: todoController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              TextButton(
                  onPressed: () {
                    ref
                        .read(todoProvider.notifier)
                        .addTodo(todoController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("Add Todo"))
            ]),
      ),
    );
  }
}
