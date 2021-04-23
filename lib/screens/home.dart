import 'package:flutter/material.dart';
import 'package:todo/mock_todo.dart';
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

  Future<void> getTodo() async {
    final result = await MockTodo.getTodo();
    setState(() {
      todos = result;
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewTodoScreen(
                            callback: () {
                              getTodo();
                            },
                          ),
                        ));
                      },
                    ),
                    Container(
                      child: todos.isEmpty
                          ? Container(
                              padding: EdgeInsets.only(top: 32),
                              child: Text("Empty..."),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: todos.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    todos[index].complete
                                        ? Icons.check_circle_outline_rounded
                                        : Icons.panorama_fish_eye,
                                    size: 30,
                                    color: todos[index].complete
                                        ? Colors.green
                                        : Colors.yellow[600],
                                  ),
                                  title: Text(
                                    todos[index].topic,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                  onTap: () async {
                                    await MockTodo.completeTodo(index);
                                    await getTodo();
                                  },
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
