class Todo {
  String topic;
  String msg;

  Todo({this.topic, this.msg});

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
