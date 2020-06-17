class Person2 {
  int age;
  List<String> hobi;
  String name;

  Person2({this.age, this.hobi, this.name});

  factory Person2.fromJson(Map<String, dynamic> json) {
    return Person2(
      age: json['age'],
      hobi: json['hobi'] != null ? new List<String>.from(json['hobi']) : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    if (this.hobi != null) {
      data['hobi'] = this.hobi;
    }
    return data;
  }

  @override
  String toString() {
    return 'Person2{age: $age, hobi: $hobi, name: $name}';
  }
}
