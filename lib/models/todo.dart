import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
enum Filter{all,compeleted,active}
Uuid uuid = Uuid();

class Todo extends Equatable {
  late final String id;
  final String description;
  final bool isCompleted;
  Todo({
    String? id,
    required this.description,
    this.isCompleted = false,
  }) {
    this.id = id ?? uuid.v4();
  }
  
  @override
  List<Object> get props => [id, description, isCompleted];

  @override
  String toString() => 'Todo(id: $id, description: $description, isCompleted: $isCompleted)';
}
