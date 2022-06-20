import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app_cubit/cubits/todofilter/todofilter_cubit.dart';
import 'package:todo_app_cubit/cubits/todolist/todolist_cubit.dart';
import 'package:todo_app_cubit/cubits/todosearch/todosearch_cubit.dart';

import '../../models/todo.dart';

part 'todofilteredsearched_state.dart';

class TodofilteredsearchedCubit extends Cubit<TodofilteredsearchedState> {
  final TodolistCubit todolistCubit;
  final TodofilterCubit todofilterCubit;
  final TodosearchCubit todosearchCubit;
  late final StreamSubscription todolistCubitsubscription;
  late final StreamSubscription todofilterCubitsubscription;
  late final StreamSubscription todosearchCubitsubscription;

  TodofilteredsearchedCubit({
    required this.todolistCubit,
    required this.todofilterCubit,
    required this.todosearchCubit,
  }) : super(TodofilteredsearchedState.initial()) {
    todofilterCubitsubscription = todofilterCubit.stream.listen((event) {
      setFilters_Searches();
    });
    todosearchCubitsubscription = todosearchCubit.stream.listen((event) {
      setFilters_Searches();
    });
    todolistCubitsubscription = todolistCubit.stream.listen((event) {
      setFilters_Searches();
    });
  }
  void setFilters_Searches() {
    List<Todo> newToDoList = [];
    switch (todofilterCubit.state.filterStatus) {
      case Filter.active:
        newToDoList = todolistCubit.state.todolist
            .where((todo) => !todo.isCompleted)
            .toList();

        break;
      case Filter.compeleted:
        newToDoList = todolistCubit.state.todolist
            .where((todo) => todo.isCompleted)
            .toList();

        break;
      case Filter.all:
        newToDoList = todolistCubit.state.todolist;

        break;
    }
    if (todosearchCubit.state.searchTerm.isNotEmpty) {
      newToDoList = newToDoList
          .where((todo) => todo.description
              .toLowerCase()
              .contains(todosearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(searchedFilteredToDoes: newToDoList));
  }

  @override
  Future<void> close() {
    todofilterCubitsubscription.cancel();
    todolistCubitsubscription.cancel();
    todosearchCubitsubscription.cancel();
    return super.close();
  }
}
