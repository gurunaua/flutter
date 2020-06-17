class Person3 {
  int age;
  Github github;
  List<String> hobi;
  String name;

  Person3({this.age, this.github, this.hobi, this.name});

  factory Person3.fromJson(Map<String, dynamic> json) {
    return Person3(
      age: json['age'],
      github: json['github'] != null ? Github.fromJson(json['github']) : null,
      hobi: json['hobi'] != null ? new List<String>.from(json['hobi']) : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    if (this.github != null) {
      data['github'] = this.github.toJson();
    }
    if (this.hobi != null) {
      data['hobi'] = this.hobi;
    }
    return data;
  }

  @override
  String toString() {
    return 'Person3{age: $age, github: $github, hobi: $hobi, name: $name}';
  }
}

class Github {
  int repository;
  String username;

  Github({this.repository, this.username});

  factory Github.fromJson(Map<String, dynamic> json) {
    return Github(
      repository: json['repository'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repository'] = this.repository;
    data['username'] = this.username;
    return data;
  }

  @override
  String toString() {
    return 'Github{repository: $repository, username: $username}';
  }
}
