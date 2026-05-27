import 'dart:convert';

class LoginResponseModel {

  final bool success;
  final String type;
  final String message;
  final String token;
  final UserModel user;

  LoginResponseModel({
    required this.success,
    required this.type,
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json) {

    return LoginResponseModel(
      success: json["success"] ?? false,
      type: json["type"] ?? "",
      message: json["message"] ?? "",
      token: json["token"] ?? "",
      user: UserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() {

    return {
      "success": success,
      "type": type,
      "message": message,
      "token": token,
      "user": user.toJson(),
    };

  }

  static LoginResponseModel fromRawJson(
      String str) {

    return LoginResponseModel.fromJson(
      jsonDecode(str),
    );

  }

}

class UserModel {

  final String id;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(
      Map<String, dynamic> json) {

    return UserModel(
      id: json["_id"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
    );

  }

  Map<String, dynamic> toJson() {

    return {
      "_id": id,
      "email": email,
      "password": password,
    };

  }

}