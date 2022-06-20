import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/models/todo.dart';

part 'todolist_state.dart';

class TodolistCubit extends Cubit<TodolistState> {
  TodolistCubit() : super(TodolistState.initial());

  void addToDo(String desc) {
    Todo newToDo = Todo(description: desc);
    List<Todo> newToDoList = [...state.todolist, newToDo];
    emit(state.copyWith(todolist: newToDoList));
    print('added');
  }

  void removeToDo(Todo todo) {
    List<Todo> newToDoList = state.todolist;
    newToDoList.remove(todo);
    emit(state.copyWith(todolist: newToDoList));
    print(newToDoList.length);
  }

  void toggleTodo(String id) {
    List<Todo> newToDoList = state.todolist;
    var newToDoList2 = newToDoList.map((e) {
      if (e.id == id) {
        print(!e.isCompleted);
        return Todo(description: e.description, isCompleted: !e.isCompleted);
      } else {
        return e;
      }
    }).toList();

    emit(state.copyWith(todolist: newToDoList2));
    print('toggeled');
  }

  void editTodo(String id, String newdesc) {
    List<Todo> newToDoList = state.todolist;
    var newToDoList2 = newToDoList.map((e) {
      if (e.id == id) {
        print(newdesc);
        return Todo(description: newdesc, id: id);
      } else {
        return e;
      }
    }).toList();

    emit(state.copyWith(todolist: newToDoList2));
    print('edited');
  }
}
