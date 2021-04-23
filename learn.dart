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

  Predicate<String> a = (value) {
    print(value.runtimeType);
  };
  Predicate<int> b = (value) {
    print(value.runtimeType);
  };

  a("Hello world");

  b(23);

  print("$name $age $bmi $single $skills $todo");
}

typedef Predicate<T> = Function(T value);
