class Person {
  int age;
  String name;

  Person({this.age, this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      age: json['age'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return 'Test{age: $age, name: $name}';
  }
}
