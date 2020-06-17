class Article {
  int id;
  String subtitle;
  String title;

  Article({this.id, this.subtitle, this.title});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      subtitle: json['subtitle'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    return data;
  }

  @override
  String toString() {
    return 'Article{id: $id, subtitle: $subtitle, title: $title}';
  }
}
