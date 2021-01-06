import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.data.g.dart';

@JsonSerializable()
class UserData {
  final String id;
  final String name, email;
  final bool isAdmin;

  UserData({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.isAdmin
  });

  factory UserData.fromJson(json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
