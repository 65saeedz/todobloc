import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todoactivecount/todoactivecount_bloc.dart';

class Todo_Header extends StatelessWidget {
  const Todo_Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'TODO',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
          ),
          Text(
            context.watch<TodoactivecountBloc>().state.activeCount.toString(),
            style: TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
