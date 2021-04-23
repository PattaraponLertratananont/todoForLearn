import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/helper/routing.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/new_todo.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];
  @override
  void initState() {
    super.initState();
    getTodo();
  }

  getTodo() async {
    final pref = await SharedPreferences.getInstance();
    todos.clear();
    setState(() {
      pref.getStringList("todo")!.forEach((element) {
        todos.add(Todo.fromJson(jsonDecode(element)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/cover.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.7,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    titleBar(
                      nameAction: "new",
                      action: () {
                        routeTo(
                          context: context,
                          screen: NewTodoScreen(callback: () {
                            getTodo();
                          }),
                        );
                      },
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              Icons.check_circle_outline_rounded,
                              size: 30,
                              color: Colors.green,
                            ),
                            title: Text(
                              todos[index].topic,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              todos[index].msg,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
