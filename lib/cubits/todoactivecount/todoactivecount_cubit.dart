import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/cubits/todolist/todolist_cubit.dart';

part 'todoactivecount_state.dart';

class TodoactivecountCubit extends Cubit<TodoactivecountState> {
  late final TodolistCubit todolistCubit;

  late final StreamSubscription todolistCubitsubscription;

  TodoactivecountCubit({required this.todolistCubit})
      : super(TodoactivecountState.initial()) {
    todolistCubitsubscription = todolistCubit.stream.listen((event) {
      setIncompletedToDosCount();
    });
  }
  void setIncompletedToDosCount() {
    final activeToDoList =
        todolistCubit.state.todolist.where((todo) => !todo.isCompleted);

    emit(
      state.copyWith(activeCount: activeToDoList.length),
    );
  }

  
  @override
  Future<void> close() {
    todolistCubitsubscription.cancel();
    return super.close();
  }
}
