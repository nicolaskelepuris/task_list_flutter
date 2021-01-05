import 'package:hive/hive.dart';
import 'package:task_list_app/domain/core/interfaces/dao.interface.dart';

part 'user.dao.g.dart';

@HiveType(typeId: 0)
class UserDao with BaseDao<UserDao> {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  UserDao({this.id, this.name, this.email});

  @override
  String get tableId => id;
}
