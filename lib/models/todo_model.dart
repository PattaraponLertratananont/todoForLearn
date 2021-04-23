class Todo {
  late String topic;
  late String msg;
  late bool complete;

  Todo({
    required this.topic,
    required this.msg,
    required this.complete,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    msg = json['msg'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['msg'] = this.msg;
    data['complete'] = this.complete;
    return data;
  }
}
