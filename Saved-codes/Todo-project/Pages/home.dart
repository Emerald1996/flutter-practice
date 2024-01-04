import 'package:flutter/material.dart';
import 'add.dart';
import 'completed.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// We display the todo by turning the state Widget to a consumer Widget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  // Make a proper consumer widget by adding a widget ref
  Widget build(BuildContext context, WidgetRef ref) {
    // Display todos
    List<Todo> todos = ref.watch(todoProvider);

    List<Todo> activeTodos =
        todos.where((todo) => todo.completed == false).toList();
    List<Todo> completedTodos =
        todos.where((todo) => todo.completed == true).toList();

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo App"),
      ),
      body: ListView.builder(
          itemCount: activeTodos.length + 1,
          itemBuilder: (context, index) {
            if (activeTodos.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Center(
                  child: const Text("Add a Todo using the button below"),
                ),
              );
            }
            if (index == activeTodos.length) {
              if (completedTodos.isEmpty) {
                return Container();
              } else {
                return Center(
                  child: TextButton(
                    child: const Text("Completed Todos"),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CompletedTodo())),
                  ),
                );
              }
            } else {
              return Slidable(
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => ref
                          .watch(todoProvider.notifier)
                          .deleteTodo(activeTodos[index].todoId),
                      backgroundColor: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: Icons.delete,
                    )
                  ]),
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => ref
                          .watch(todoProvider.notifier)
                          .completeTodo(activeTodos[index].todoId),
                      backgroundColor: Colors.green,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      icon: Icons.check,
                    )
                  ]),
                  child: Container(
                    margin: EdgeInsets.all(6),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[400],
                    ),
                    child: ListTile(title: Text(activeTodos[index].content),),
                  )
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        tooltip: 'Add todo Item',
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
