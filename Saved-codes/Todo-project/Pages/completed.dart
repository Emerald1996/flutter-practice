import 'package:flutter/material.dart';
// import 'package:flutter_project/Pages/add.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// We display the todo by making turning the state Widget to a consumer Widget
class CompletedTodo extends ConsumerWidget {
  const CompletedTodo({super.key});

  @override
  // Make a proper consumer widget by adding a widget ref
  Widget build(BuildContext context, WidgetRef ref) {
    // Display todos
    List<Todo> todos = ref.watch(todoProvider);

    // List<Todo> completedTodos =
    //     todos.where((todo) => todo.completed == false).toList();
    List<Todo> completedTodos =
        todos.where((todo) => todo.completed == true).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: ListView.builder(
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
              return Slidable(
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) =>
                        ref.watch(todoProvider.notifier).deleteTodo(index),
                      backgroundColor: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: Icons.delete,
                    )
                  ]),
                 
                  child: Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[300]
                    ),
                    child: ListTile(
                      title: Text(completedTodos[index].content)
                    ),
                  )
                );
          }),
    );
  }
}
