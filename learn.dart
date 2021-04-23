void main() {
  String name = "Ball";
  int age = 22;
  double bmi = 27.28;
  bool single = true;
  List<String> skills = [
    "flutter",
    "dart",
  ];
  Map<String, dynamic> todo = {
    "message": "To day is to day.",
    "createDate": DateTime.now(),
    "complete": false,
  };

  print("$name $age $bmi $single $skills $todo");
}
