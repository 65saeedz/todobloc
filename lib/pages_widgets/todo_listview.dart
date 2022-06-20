import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todofilteredsearched/todofilteredsearched_bloc.dart';
import 'package:todo_app_cubit/blocs/todolist/todolist_bloc.dart';

import 'package:todo_app_cubit/models/todo.dart';

class MyListview extends StatelessWidget {
  const MyListview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: context
            .watch<TodofilteredsearchedBloc>()
            .state
            .searchedFilteredToDoes
            .length,
        itemBuilder: ((context, index) {
          return BlocBuilder<TodofilteredsearchedBloc,
              TodofilteredsearchedState>(
            builder: (context, state) {
              return ToDoItem(
                todo: state.searchedFilteredToDoes[index],
              );
            },
          );
        }));
  }
}

class ToDoItem extends StatefulWidget {
  late final Todo todo;
  ToDoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  late final TextEditingController txtCtrl;

  @override
  void initState() {
    txtCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) {
        context.read<TodolistBloc>().add(RemoveToDoEvent(newToDo: widget.todo));
      },
      background: Container(
        color: Colors.pink[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
            Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
      key: ValueKey(widget.todo.id),
      child: ListTile(
        leading: Checkbox(
            value: widget.todo.isCompleted,
            onChanged: (_) {
              context
                  .read<TodolistBloc>()
                  .add(ToggleToDoEvent(id: widget.todo.id));
            }),
        title: Text(widget.todo.description),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                txtCtrl.text = widget.todo.description;
                return AlertDialog(
                  title: Text('edit todo'),
                  actions: <Widget>[
                    TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    TextButton(
                        child: Text('edit'),
                        onPressed: () {
                          context.read<TodolistBloc>().add(EditToDoEvent(
                              id: widget.todo.id, newDesc: txtCtrl.text));
                          Navigator.of(context).pop();
                        })
                  ],
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  content: Container(
                    child: TextField(
                      controller: txtCtrl,
                      decoration:
                          InputDecoration(hintText: 'Edit todo description'),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 250,
                      minWidth: 250,
                      maxHeight: 250,
                      maxWidth: 250,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
