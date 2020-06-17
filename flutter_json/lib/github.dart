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
