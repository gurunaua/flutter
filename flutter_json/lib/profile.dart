import 'dart:convert';

class Profile {
  int age;
  String email;
  int id;
  String name;

  Profile({this.age, this.email, this.id, this.name});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      age: json['age'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  List<Profile> profileFormJson(String jsonData){
    final data = json.decode(jsonData);
    return List<Profile>.from(data.map((item)=>Profile.fromJson(item)));
  }

  String profileToJson(Profile data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }

  @override
  String toString() {
    return 'profile{age: $age, email: $email, id: $id, name: $name}';
  }
}
