import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password.body.g.dart';

@JsonSerializable()
class ChangePasswordBody {
  String currentPassword;
  String newPassword;

  ChangePasswordBody({
    @required String currentPassword,
    @required String newPassword,
  }) {
    this.currentPassword = currentPassword.trim();
    this.newPassword = newPassword.trim();
  }

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
