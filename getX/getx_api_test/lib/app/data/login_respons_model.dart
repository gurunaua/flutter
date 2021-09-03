class LoginRespons {
  String? homePage;
  String? message;
  String? fullName;

  LoginRespons({this.homePage, this.message, this.fullName});

  LoginRespons.fromJson(Map<String, dynamic> json) {
    homePage = json['home_page'];
    message = json['message'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['home_page'] = homePage;
    data['message'] = message;
    data['full_name'] = fullName;
    return data;
  }
}
