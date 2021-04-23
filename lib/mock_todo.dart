import 'package:todo/models/todo_model.dart';

class MockTodo {
  static List<Todo> todos = [
    Todo(topic: "อ่านหนังสือหลังตื่นนอน", msg: "เล่ม ทำยังไงให้สมาธิดีขึ้น"),
    Todo(topic: "อ่านหนังสือก่อนนอน", msg: "อ่านเล่ม เพิ่มประสิทธิภาพการนอน"),
  ];

  static Future<List<Todo>> getTodo() async {
    await Future.delayed(Duration(seconds: 1));
    return todos;
  }

  static Future<void> addTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));
    todos.add(todo);
  }
}
