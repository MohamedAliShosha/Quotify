import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_template/features/profile/data/services/user_data_service.dart';
import 'package:starter_template/features/profile/presentation/manager/user_data/user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.userDataService) : super(UserDataInitial());

  final UserDataService userDataService;

  Future<void> saveUserData(
      {required String userName, required String email}) async {
    emit(UserDataLoading());
    try {
      await userDataService.saveUserData(userName: userName, email: email);
      final user = userDataService.getUser();
      if (user != null) {
        emit(UserDataSuccess(user));
      } else {
        emit(const UserDataFailure(
            'User data could not be retrieved after saving.'));
      }
    } catch (e) {
      emit(
        UserDataFailure(
          'Failed to save user${e.toString()}',
        ),
      );
    }
  }

  Future<void> getUser() async {
    emit(UserDataLoading());
    try {
      final user = userDataService.getUser();
      if (user != null) {
        emit(UserDataSuccess(user));
      } else {
        emit(const UserDataFailure('No user found.'));
      }
    } catch (e) {
      emit(
        UserDataFailure(
          'Failed to get user: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> clearUser() async {
    emit(UserDataLoading());
    try {
      await userDataService.clearUserData();
      // indicates that there is no user data currently stored after it has been cleared from Hive.
      emit(UserDataInitial());
    } catch (e) {
      emit(
        UserDataFailure(
          'Failed to clear user data: ${e.toString()}',
        ),
      );
    }
  }
}
