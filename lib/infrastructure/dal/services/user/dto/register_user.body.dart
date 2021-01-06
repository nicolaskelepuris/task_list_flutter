import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_user.body.g.dart';

@JsonSerializable()
class RegisterUserBody {
  String name;
  String email;
  String password;

  RegisterUserBody({
    @required String name,
    @required String email,
    String password,
  }) {
    this.name = name.trim();
    this.email = email.trim();
    this.password = password != null ? password.trim() : password;
  }

  factory RegisterUserBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserBodyToJson(this);
}
