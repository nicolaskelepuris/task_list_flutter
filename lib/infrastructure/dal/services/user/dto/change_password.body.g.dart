// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordBody _$ChangePasswordBodyFromJson(Map<String, dynamic> json) {
  return ChangePasswordBody(
    currentPassword: json['currentPassword'] as String,
    newPassword: json['newPassword'] as String,
  );
}

Map<String, dynamic> _$ChangePasswordBodyToJson(ChangePasswordBody instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
