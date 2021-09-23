class UserLoginRequest {
  String? username;
  String? password;

  UserLoginRequest({this.username, this.password});

  UserLoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
