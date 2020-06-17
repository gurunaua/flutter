import 'package:flutter_json/github.dart';
import 'package:flutter_json/article.dart';

class Person4 {
  int age;
  List<Article> articles;
  Github github;
  List<String> hobi;
  String name;

  Person4({this.age, this.articles, this.github, this.hobi, this.name});

  factory Person4.fromJson(Map<String, dynamic> json) {
    return Person4(
      age: json['age'],
      articles: json['articles'] != null
          ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList()
          : null,
      github: json['github'] != null ? Github.fromJson(json['github']) : null,
      hobi: json['hobi'] != null ? new List<String>.from(json['hobi']) : null,
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
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
    return 'Person4{age: $age, articles: $articles, github: $github, hobi: $hobi, name: $name}';
  }
}
