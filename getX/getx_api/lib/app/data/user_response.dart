class UserResponse {
  String? name;
  String? username;
  String? email;
  List<String>? role;
  String? password;
  String? address;
  String? photo;

  UserResponse(
      {this.name,
      this.username,
      this.email,
      this.role,
      this.password,
      this.address,
      this.photo});

  UserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    role = json['role'].cast<String>();
    password = json['password'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['password'] = this.password;
    data['address'] = this.address;
    data['photo'] = this.photo;
    return data;
  }
}
