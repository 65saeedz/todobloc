part of 'todolist_bloc.dart';

abstract class TodolistEvent extends Equatable {
  const TodolistEvent();

  @override
  bool? get stringify => super.stringify;
  @override
  List<Object> get props => [];
}

class AddToDoEvent extends TodolistEvent {
  final String desc;
  AddToDoEvent({
    required this.desc,
  });
  @override
  List<Object> get props => [desc];
}

class RemoveToDoEvent extends TodolistEvent {
  final Todo newToDo;
  RemoveToDoEvent({
    required this.newToDo,
  });
  @override
  List<Object> get props => [newToDo];
}

class ToggleToDoEvent extends TodolistEvent {
  final String id;
  ToggleToDoEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}

class EditToDoEvent extends TodolistEvent {
  final String id;
  final String newDesc;
  EditToDoEvent({
    required this.id,
    required this.newDesc,
  });
  @override
  List<Object> get props => [newDesc, id];
}
