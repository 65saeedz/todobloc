part of 'todofilteredsearched_bloc.dart';

abstract class TodofilteredsearchedEvent extends Equatable {
  const TodofilteredsearchedEvent();

  @override
  List<Object> get props => [];@override
  
  bool? get stringify => super.stringify;
}
class SetFilters_SearchesEvent extends TodofilteredsearchedEvent{}