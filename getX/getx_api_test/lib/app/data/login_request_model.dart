class LoginRequest {
  String? usr;
  String? pwd;

  LoginRequest({this.usr, this.pwd});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    usr = json['usr'];
    pwd = json['pwd'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['usr'] = usr;
    data['pwd'] = pwd;
    return data;
  }
}
