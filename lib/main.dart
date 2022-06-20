import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/blocs/todoactivecount/todoactivecount_bloc.dart';
import 'package:todo_app_cubit/blocs/todofilter/todofilter_bloc.dart';
import 'package:todo_app_cubit/blocs/todofilteredsearched/todofilteredsearched_bloc.dart';
import 'package:todo_app_cubit/blocs/todolist/todolist_bloc.dart';
import 'package:todo_app_cubit/blocs/todosearch/todosearch_bloc.dart';


import 'pages_widgets/todo_add_todo.dart';
import 'pages_widgets/todo_filter_row.dart';
import 'pages_widgets/todo_header.dart';
import 'pages_widgets/todo_listview.dart';
import 'pages_widgets/todo_search_todo.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TodofilterBloc>(
        create: (BuildContext context) => TodofilterBloc(),
      ),
      BlocProvider<TodosearchBloc>(
        create: (BuildContext context) => TodosearchBloc(),
      ),
      BlocProvider<TodolistBloc>(
        create: (BuildContext context) => TodolistBloc(),
      ),
      BlocProvider<TodoactivecountBloc>(
        create: (BuildContext context) => TodoactivecountBloc(
          todolistBloc: BlocProvider.of<TodolistBloc>(context),
        ),
      ),
      BlocProvider<TodofilteredsearchedBloc>(
        create: (BuildContext context) => TodofilteredsearchedBloc(
            todosearchBloc: BlocProvider.of<TodosearchBloc>(context),
            todofilterBloc: BlocProvider.of<TodofilterBloc>(context),
            todolistBloc: BlocProvider.of<TodolistBloc>(context)),
      ),
    ],
    child: MaterialApp(
      home: const HomePage(),
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Center(
              child: Column(
            children: [
              Todo_Header(),
              Divider(),
              Todo_Add_Todo(),
              Todo_Search_Todo(),
              Todo_Filter_Row(),
              MyListview()
            ],
          )),
        ),
      )),
    );
  }
}
