part of 'todosearch_cubit.dart';

class TodosearchState extends Equatable {
  final String searchTerm;

  TodosearchState({required this.searchTerm});

  @override
  List<Object> get props => [searchTerm];
  @override
  bool get stringify => true;

  factory TodosearchState.initial() {
    return TodosearchState(searchTerm: '');
  }
  TodosearchState copyWith({
    String? searchTerm,
  }) {
    return TodosearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
