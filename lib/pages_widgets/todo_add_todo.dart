import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todolist/todolist_bloc.dart';

class Todo_Add_Todo extends StatefulWidget {
  Todo_Add_Todo({
    Key? key,
  }) : super(key: key);

  @override
  State<Todo_Add_Todo> createState() => _Todo_Add_TodoState();
}

class _Todo_Add_TodoState extends State<Todo_Add_Todo> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: textEditingController,
        onSubmitted: (String desc) {
          textEditingController.text = desc;
          context.read<TodolistBloc>().add(AddToDoEvent(desc: desc));
          textEditingController.clear();
        },
        decoration: InputDecoration(hintText: 'What to do?'),
      ),
    );
  }
}
