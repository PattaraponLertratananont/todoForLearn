import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/mock_todo.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/title_bar.dart';

class NewTodoScreen extends StatefulWidget {
  final Function? callback;
  NewTodoScreen({Key? key, this.callback}) : super(key: key);

  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  TextEditingController topicController = TextEditingController();
  TextEditingController todoController = TextEditingController();
  FocusNode topicFocusCode = FocusNode();
  FocusNode todoFocusCode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
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
                          nameAction: "save",
                          action: () async {
                            await addTodo(
                              topic: topicController.text,
                              todo: todoController.text,
                              routeTo: () async {
                                await widget.callback!();
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: TextField(
                            controller: topicController,
                            focusNode: topicFocusCode,
                            cursorColor: Colors.grey[800],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              labelText: "Topic",
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: TextField(
                            controller: todoController,
                            focusNode: todoFocusCode,
                            cursorColor: Colors.grey[800],
                            maxLines: 8,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              labelText: "Todo...",
                              alignLabelWithHint: true,
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  child: Container(
                    margin: EdgeInsets.only(left: 8, top: 8),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addTodo({
    String? topic,
    String? todo,
    Future Function()? routeTo,
  }) async {
    if (topic!.isNotEmpty && todo!.isNotEmpty) {
      MockTodo.addTodo(
        Todo(
          topic: topic,
          msg: todo,
          complete: false,
        ),
      );
      await routeTo!();
    }
  }
}
