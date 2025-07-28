import 'package:hive/hive.dart';
import 'package:starter_template/core/utils/constants.dart';
import 'package:starter_template/features/profile/data/models/user_model.dart';

class UserDataService {
  Future<void> saveUserData(
      {required String userName, required String email}) async {
    final box = Hive.box<UserModel>(Constants.kUserBox);
    final user = UserModel(userName: userName, email: email);
    await box.clear(); // To Save only One user
    await box.add(user);
    print('Save username: ${user.userName}');
  }

  UserModel? getUser() {
    final box = Hive.box<UserModel>(Constants.kUserBox);
    return box.isNotEmpty ? box.getAt(0) : null;
  }

  Future<void> clearUserData() async {
    final box = Hive.box<UserModel>(Constants.kUserBox);
    await box.clear();
  }
}
