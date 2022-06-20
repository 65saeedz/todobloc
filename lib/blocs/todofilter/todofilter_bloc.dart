import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo.dart';

part 'todofilter_event.dart';
part 'todofilter_state.dart';

class TodofilterBloc extends Bloc<TodofilterEvent, TodofilterState> {
  TodofilterBloc() : super(TodofilterState.initial()) {
    on<ChangeFilterEvent>(
        (ChangeFilterEvent event, Emitter<TodofilterState> emit) {
      emit(state.copyWith(filterStatus: event.newFilter));
    });
  }
}
