import 'package:equatable/equatable.dart';
import 'package:starter_template/features/profile/data/models/user_model.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object?> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataSuccess extends UserDataState {
  final UserModel userModel;

  const UserDataSuccess(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UserDataFailure extends UserDataState {
  final String errorMessage;

  const UserDataFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
