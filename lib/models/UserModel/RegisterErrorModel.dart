import 'dart:convert';

RegisterErrorModelClass registerErrorModelClassFromJson(String str) =>
    RegisterErrorModelClass.fromJson(json.decode(str));

String registerErrorModelClassToJson(RegisterErrorModelClass data) =>
    json.encode(data.toJson());

class RegisterErrorModelClass {
  List<Error>? errors;

  RegisterErrorModelClass({
    this.errors,
  });

  factory RegisterErrorModelClass.fromJson(Map<String, dynamic> json) =>
      RegisterErrorModelClass(
        errors: json["errors"] == null
            ? []
            : List<Error>.from(json["errors"]!.map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class Error {
  String? code;
  String? message;

  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
