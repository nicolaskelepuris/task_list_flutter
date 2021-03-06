import 'package:task_list_app/infrastructure/dal/daos/user.dao.dart';
import 'package:task_list_app/infrastructure/dal/services/data/user.data.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String name, email;
  bool isAdmin;
  UserModel(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.isAdmin});

  factory UserModel.fromData(UserData data) {
    return UserModel(id: data.id, name: data.name, email: data.email, isAdmin: data.isAdmin);
  }

  factory UserModel.blank() {
    return UserModel(id: null, name: null, email: null, isAdmin: false);
  }

  UserModel clone() {
    return UserModel(
      id: id,
      name: name,
      email: email,
      isAdmin: isAdmin,
    );
  }

  
}
