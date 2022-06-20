part of 'todolist_cubit.dart';

class TodolistState extends Equatable {
  final List<Todo> todolist;
  const TodolistState({
    required this.todolist,
  });

  @override
  List<Object> get props => [todolist];

  TodolistState copyWith({
    List<Todo>? todolist,
  }) {
    return TodolistState(
      todolist: todolist ?? this.todolist,
    );
  }

  factory TodolistState.initial() {
    return TodolistState(todolist: [
      Todo(description: 'Wash the dish'),
      Todo(description: 'clean the room'),
      Todo(description: 'buy some potato')
    ]);
  }
  @override
  String toString() => 'TodolistState(todolist: $todolist)';
}
