import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todofilter/todofilter_bloc.dart';
import 'package:todo_app_cubit/models/todo.dart';

class Todo_Filter_Row extends StatefulWidget {
  Todo_Filter_Row({Key? key}) : super(key: key);

  @override
  State<Todo_Filter_Row> createState() => _Todo_Filter_RowState();
}

class _Todo_Filter_RowState extends State<Todo_Filter_Row> {
  var SelectedTab = 'All';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                context
                    .read<TodofilterBloc>()
                    .add(ChangeFilterEvent(newFilter: Filter.all));
                SelectedTab = 'All';
              });
            },
            child: Text(
              'All',
              style: TextStyle(
                  fontSize: SelectedTab == 'All' ? 25 : 20,
                  fontWeight: SelectedTab == 'All'
                      ? FontWeight.w800
                      : FontWeight.normal,
                  color: SelectedTab == 'All' ? Colors.blue : Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                context
                    .read<TodofilterBloc>()
                    .add(ChangeFilterEvent(newFilter: Filter.active));
                SelectedTab = 'Active';
              });
            },
            child: Text(
              'Active',
              style: TextStyle(
                  fontSize: SelectedTab == 'Active' ? 25 : 20,
                  fontWeight: SelectedTab == 'Active'
                      ? FontWeight.w800
                      : FontWeight.normal,
                  color: SelectedTab == 'Active' ? Colors.blue : Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                context
                    .read<TodofilterBloc>()
                    .add(ChangeFilterEvent(newFilter: Filter.compeleted));
                SelectedTab = 'Completed';
              });
            },
            child: Text(
              'Completed',
              style: TextStyle(
                  fontSize: SelectedTab == 'Completed' ? 25 : 20,
                  fontWeight: SelectedTab == 'Completed'
                      ? FontWeight.w800
                      : FontWeight.normal,
                  color:
                      SelectedTab == 'Completed' ? Colors.blue : Colors.grey),
            ),
          ),
          //  Text('Active'),
          // Text('Completed')
        ],
      ),
    );
  }

  // TextButton tabButton(String headerTxt) {
  //   return TextButton(
  //     onPressed: () {
  //       setState(() { context.read<TodofilterBloc>().changeFilter(newFilter)
  //         SelectedTab = headerTxt;
  //       });
  //     },
  //     child: Text(
  //       headerTxt,
  //       style: TextStyle(
  //           fontSize: SelectedTab == headerTxt ? 25 : 20,
  //           fontWeight:
  //               SelectedTab == headerTxt ? FontWeight.w800 : FontWeight.normal,
  //           color: SelectedTab == headerTxt ? Colors.blue : Colors.grey),
  //     ),
  //   );
}
