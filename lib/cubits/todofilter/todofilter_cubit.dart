import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/models/todo.dart';

part 'todofilter_state.dart';

class TodofilterCubit extends Cubit<TodofilterState> {
  TodofilterCubit() : super(TodofilterState.initial());
  void changeFilter(Filter newFilter) {
    emit(state.copyWith(filterStatus: newFilter));
    print('filter changed');
  }
}
