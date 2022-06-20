import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todosearch_state.dart';

class TodosearchCubit extends Cubit<TodosearchState> {
  TodosearchCubit() : super(TodosearchState.initial());
  void changeSearchTerm(String newSearchTerm) {
    emit(state.copyWith(searchTerm: newSearchTerm));
  }
}
