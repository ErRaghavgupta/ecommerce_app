class SocialLoginModel {
  String? login_medium;
  bool? status;

  SocialLoginModel({this.login_medium, this.status});

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) {
    return SocialLoginModel(
      login_medium: json['login_medium'],
      status: json['status'],
    );
  }
}
