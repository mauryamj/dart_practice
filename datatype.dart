import 'dart:io';

void main() {
  List<String> fruits = ['apple', 'orange', 'banana'];
  fruits.add("mango");
  fruits.sort();
  bool value = fruits.contains('apple');
  //not a list but an iterable
  var result = fruits.where((element) => element == 'banana');
  print(fruits);
  print(value);
  print(result);
  Map<String, dynamic> data = {
    'name': "maurya",
    'age': 20,
    "male": true,
    "fruits": fruits,
  };
  print(data);
  print(data["male"]);
  print(data.keys);
  print(data.containsKey("name"));

  final String a;
  a = "hello";
  const double m = 3.3;
  String? name = stdin.readLineSync();
  print("hello " + name!);
}
