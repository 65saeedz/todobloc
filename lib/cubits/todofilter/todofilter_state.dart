part of 'todofilter_cubit.dart';

class TodofilterState extends Equatable {
  final Filter filterStatus;

  TodofilterState({required this.filterStatus});

  @override
  List<Object> get props => [filterStatus];
  @override
  bool get stringify => true;

  factory TodofilterState.initial() {
    return TodofilterState(filterStatus: Filter.all);
  }
  TodofilterState copyWith({
    Filter? filterStatus,
  }) {
    return TodofilterState(
      filterStatus: filterStatus ?? this.filterStatus,
    );
  }
}
