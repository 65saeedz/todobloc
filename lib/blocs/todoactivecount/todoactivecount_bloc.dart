import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/blocs/todolist/todolist_bloc.dart';
part 'todoactivecount_event.dart';
part 'todoactivecount_state.dart';

class TodoactivecountBloc
    extends Bloc<TodoactivecountEvent, TodoactivecountState> {
  final TodolistBloc todolistBloc;
  late final StreamSubscription todolistBlocsubscription;
  TodoactivecountBloc({required this.todolistBloc})
      : super(TodoactivecountState.initial()) {
    todolistBlocsubscription = todolistBloc.stream.listen((event) {
      add(setIncompletedToDosCountEvent());
    });

    on<setIncompletedToDosCountEvent>((event, emit) {
      final activeToDoList =
          todolistBloc.state.todolist.where((todo) => !todo.isCompleted);

      emit(
        state.copyWith(activeCount: activeToDoList.length),
      );
    });
  }
  void setIncompletedToDosCount() {}

  @override
  Future<void> close() {
    todolistBlocsubscription.cancel();
    return super.close();
  }
}
