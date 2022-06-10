// To parse this JSON data, do
//
//     final authentication = authenticationFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

Authentication authenticationFromJson(String str) =>
    Authentication.fromJson(json.decode(str));

String authenticationToJson(Authentication data) => json.encode(data.toJson());

class Authentication {
  Authentication({
    required this.status,
    this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
  });

  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class AuthenticationService {
  Future<Authentication> login() async {
    final response = await post(
        Uri.parse("https://attendance.putraprima.id/api/auth/login"),
        body: {
          "email": "putraprima@gmail.com",
          "password": "password",
        });
    final activity = authenticationFromJson(response.body);
    return activity;
  }
}
