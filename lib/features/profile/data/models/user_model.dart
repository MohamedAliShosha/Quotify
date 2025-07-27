import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String? userName;

  @HiveField(1)
  final String? email;

  UserModel({required this.userName, required this.email});
}
