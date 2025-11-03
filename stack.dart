class Stack<E> {
  final _storage = <E>[];
  void push(E element) => _storage.add(element);
  E pop() => _storage.removeLast();
  E get peek => _storage.last;
  String toString() {
    return _storage.join(",");
  }
}

void main() {
  final stack = Stack<String>();
  stack.push("anime");
  stack.push("managa");
  stack.pop();
  stack.push("mm");

  print(stack);
  print(stack.peek);
}
