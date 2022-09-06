int addNumbers(int num1, int num2) {
  return num1 + num2;
}

printHello() {
  for (int i = 0; i < 5; i++) {
    print('Hello ${i + 1}');
  }
  dynamic a = "End";
  print(a);
}

void main() {
  printHello();
  print(addNumbers(1, 2));
}
