part of 'todosearch_bloc.dart';

abstract class TodosearchEvent extends Equatable {
  const TodosearchEvent();

  @override
  List<Object> get props => [];
}

class ChangeSearchTermEvent extends TodosearchEvent {
  final String term;
  ChangeSearchTermEvent({
    required this.term,
  });

  @override
  List<Object> get props => [term];
  @override
  String toString() => 'ChangeSearchTermEvent(term: $term)';
}
