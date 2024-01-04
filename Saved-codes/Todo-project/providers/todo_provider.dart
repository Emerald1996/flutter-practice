import '../models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(String content) {
    // Since we cant change the previous state, copy everything within the previous state and add a new Todo Item

    state = [
      ...state,
      Todo(
          todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
          content: content,
          completed: false
        )
    ];
  }

  void completeTodo(int id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          Todo(todoId: todo.todoId, content: todo.content, completed: true)
        else
          todo
    ];
  }

  void deleteTodo(int id) {
    state = state.where((todo) => todo.todoId != id).toList();
  }
}
