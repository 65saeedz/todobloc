import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todosearch_event.dart';
part 'todosearch_state.dart';

class TodosearchBloc extends Bloc<TodosearchEvent, TodosearchState> {
  TodosearchBloc() : super(TodosearchState.initial()) {
    on<ChangeSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.term));
    });
  }
}
