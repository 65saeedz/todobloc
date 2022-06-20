import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  TodolistBloc() : super(TodolistState.initial()) {
    on<AddToDoEvent>(addToDo);
    on<RemoveToDoEvent>(removeToDo);
    on<ToggleToDoEvent>(toggleTodo);
    on<EditToDoEvent>(editTodo);
  }
  void addToDo(AddToDoEvent event, Emitter<TodolistState> emit) {
    Todo newToDo = Todo(description: event.desc);
    List<Todo> newToDoList = [...state.todolist, newToDo];
    emit(state.copyWith(todolist: newToDoList));
    print('added');
  }

  void removeToDo(RemoveToDoEvent event, Emitter<TodolistState> emit) {
    List<Todo> newToDoList = state.todolist;
    newToDoList.remove(event.newToDo);
    emit(state.copyWith(todolist: newToDoList));
    print(newToDoList.length);
  }

  void toggleTodo(ToggleToDoEvent event, Emitter<TodolistState> emit) {
    List<Todo> newToDoList = state.todolist;
    var newToDoList2 = newToDoList.map((e) {
      if (e.id == event.id) {
        print(!e.isCompleted);
        return Todo(description: e.description, isCompleted: !e.isCompleted);
      } else {
        return e;
      }
    }).toList();

    emit(state.copyWith(todolist: newToDoList2));
    print('toggeled');
  }

  void editTodo(EditToDoEvent event, Emitter<TodolistState> emit) {
    List<Todo> newToDoList = state.todolist;
    var newToDoList2 = newToDoList.map((e) {
      if (e.id == event.id) {
        print(event.newDesc);
        return Todo(description: event.newDesc, id: event.id);
      } else {
        return e;
      }
    }).toList();

    emit(state.copyWith(todolist: newToDoList2));
    print('edited');
  }
}
