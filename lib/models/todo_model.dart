class Todo {
  late String topic;
  late String msg;

  Todo({required this.topic, required this.msg});

  Todo.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['msg'] = this.msg;
    return data;
  }
}
