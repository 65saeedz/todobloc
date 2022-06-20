import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todosearch/todosearch_bloc.dart';

class Todo_Search_Todo extends StatelessWidget {
  const Todo_Search_Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (txt) {
        context.read<TodosearchBloc>().add(ChangeSearchTermEvent(term: txt));
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
        hintText: 'Search Todos...',
        prefixIcon: Icon(
          Icons.search,
        ),
      ),

      //  focusColor: Colors.grey,
    );
  }
}
