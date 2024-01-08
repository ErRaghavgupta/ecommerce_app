class RegisterModel {
  String? f_name;
  String? l_name;
  String? email;
  String? phone;
  String? password;

  RegisterModel(
      {this.f_name, this.l_name, this.password, this.email, this.phone});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        f_name: json['f_name'],
        l_name: json['l_name'],
        password: json['password'],
        email: json['email'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      "f_name": f_name,
      "l_name": l_name,
      "password": password,
      "phone": phone,
      "email": email,
    };
  }
}
