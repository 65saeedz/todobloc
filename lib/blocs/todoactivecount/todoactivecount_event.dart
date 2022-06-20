part of 'todoactivecount_bloc.dart';

abstract class TodoactivecountEvent extends Equatable {
  const TodoactivecountEvent();
@override
  bool? get stringify => super.stringify;
 
  @override
  List<Object> get props => [];
}
class setIncompletedToDosCountEvent extends TodoactivecountEvent{

}