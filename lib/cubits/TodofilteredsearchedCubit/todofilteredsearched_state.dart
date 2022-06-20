part of 'todofilteredsearched_cubit.dart';

class TodofilteredsearchedState extends Equatable {
  final List<Todo> searchedFilteredToDoes;
  TodofilteredsearchedState({
    required this.searchedFilteredToDoes,
  });

  @override
  List<Object> get props => [searchedFilteredToDoes];
  factory TodofilteredsearchedState.initial() {
    return TodofilteredsearchedState(searchedFilteredToDoes: TodolistState.initial().todolist);
  }
  TodofilteredsearchedState copyWith({
    List<Todo>? searchedFilteredToDoes,
  }) {
    return TodofilteredsearchedState(
      searchedFilteredToDoes:
          searchedFilteredToDoes ?? this.searchedFilteredToDoes,
    );
  }

  @override
  bool get stringify => true;
}
