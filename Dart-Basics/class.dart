class Person {
  String? name;
  int? age;

  // Person({String? inputName, int? age}) {
  //   name = inputName;
  //   this.age = age;
  // }
  Person(this.name, this.age);
}

void main() {
  var Keeshi = Person('Keeshigan', 23);
  if (Keeshi.name != null) {
    print('${Keeshi.name} is ${Keeshi.age}');
}
}

