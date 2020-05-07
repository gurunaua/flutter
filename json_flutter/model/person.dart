class Person {
  String name;
  int age;
  List<String> hobi;
  List<int> numbers;
  Card card;
  List<Doing> doo;
  Map<String, Doing> map;


  Person({this.name, this.age, this.hobi, this.numbers, this.card, this.doo, this.map});


  @override
  String toString() {
    return 'Person{name: $name, age: $age, hobi: $hobi, numbers: $numbers, card: $card, doo: $doo, map: $map}';
  }

  factory Person.fromJson(Map<String, dynamic> json) {

    var listDoo = json["doo"] as List;
    var iterableDoo = listDoo.map((article) {
      return Doing.fromJson(article);
    });
    var doo = List<Doing>.from(iterableDoo);

    var mapDoo = json["map"] as Map;
    print("mam print : ${mapDoo.runtimeType}");

    Map<String, Doing> mapE = mapDoo.map((key, value) {
      return MapEntry(key, Doing.fromJson(value));
    });

    return Person(
        name: json['name'],
        age: json['age'],
        hobi: List<String>.from(json["hobi"]),
        numbers: List<int>.from(json["numbers"]),
        card: Card.fromJson(json["card"]),
        doo: doo,
        map: mapE
    );
  }
}

class Card {
  int id;
  String username;

  Card({this.id, this.username});

  @override
  String toString() {
    return 'Card{id: $id, username: $username}';
  }

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      username: json['username'],
    );
  }
}

class Doing {
  String doo;

  Doing({this.doo});


  @override
  String toString() {
    return 'Doing{doo: $doo}';
  }

  factory Doing.fromJson(Map<String, dynamic> json) {
    return Doing(
      doo: json['do'],
    );
  }
}
