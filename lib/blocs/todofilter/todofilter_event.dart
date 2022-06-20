part of 'todofilter_bloc.dart';

abstract class TodofilterEvent extends Equatable {
  const TodofilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodofilterEvent {
  final Filter newFilter;
  ChangeFilterEvent({
    required this.newFilter,
  });

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newFilter)';
  @override
  List<Object> get props => [newFilter];

}
