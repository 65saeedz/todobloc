import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
 
import 'package:todo_app_cubit/models/todo.dart';

import '../todofilter/todofilter_bloc.dart';
import '../todolist/todolist_bloc.dart';
import '../todosearch/todosearch_bloc.dart';

part 'todofilteredsearched_event.dart';
part 'todofilteredsearched_state.dart';

class TodofilteredsearchedBloc
    extends Bloc<TodofilteredsearchedEvent, TodofilteredsearchedState> {
  final TodolistBloc todolistBloc;
  final TodofilterBloc todofilterBloc;
  final TodosearchBloc todosearchBloc;
  late final StreamSubscription todolistBlocsubscription;
  late final StreamSubscription todofilterBlocsubscription;
  late final StreamSubscription todosearchBlocsubscription;

  TodofilteredsearchedBloc({
    required this.todolistBloc,
    required this.todofilterBloc,
    required this.todosearchBloc,
  }) : super(TodofilteredsearchedState.initial()) {
    todofilterBlocsubscription = todofilterBloc.stream.listen((event) {
      setFilters_Searches();
    });
    todosearchBlocsubscription = todosearchBloc.stream.listen((event) {
      setFilters_Searches();
    });
    todolistBlocsubscription = todolistBloc.stream.listen((event) {
      setFilters_Searches();
    });

    on<SetFilters_SearchesEvent>(((event, emit) {
      
    }));
  }
  void setFilters_Searches()
       {
    List<Todo> newToDoList = [];
    switch (todofilterBloc.state.filterStatus) {
      case Filter.active:
        newToDoList = todolistBloc.state.todolist
            .where((todo) => !todo.isCompleted)
            .toList();

        break;
      case Filter.compeleted:
        newToDoList = todolistBloc.state.todolist
            .where((todo) => todo.isCompleted)
            .toList();

        break;
      case Filter.all:
        newToDoList = todolistBloc.state.todolist;

        break;
    }
    if (todosearchBloc.state.searchTerm.isNotEmpty) {
      newToDoList = newToDoList
          .where((todo) => todo.description
              .toLowerCase()
              .contains(todosearchBloc.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(searchedFilteredToDoes: newToDoList));
  }

  @override
  Future<void> close() {
    todofilterBlocsubscription.cancel();
    todolistBlocsubscription.cancel();
    todosearchBlocsubscription.cancel();
    return super.close();
  }
}
