import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_template/core/utils/app_router.dart';
import 'package:starter_template/features/profile/presentation/manager/user_data/user_data_cubit.dart';
import 'package:starter_template/features/profile/presentation/manager/user_data/user_data_state.dart';
import 'package:starter_template/features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:starter_template/features/profile/presentation/widgets/custom_user_info_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          final user = state.userModel;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomProfileCircleAvatar(),
              const SizedBox(height: 50),
              CustomUserInfoContainer(
                rightPadding: 32,
                leftPadding: 32,
                text: user.userName ?? 'No User Name Available',
              ),
              const SizedBox(height: 50),
              CustomUserInfoContainer(
                rightPadding: 32,
                leftPadding: 32,
                text: user.email ?? 'No Email Available',
              ),
              const SizedBox(height: 200),
              GestureDetector(
                onTap: () async {
                  await context.read<UserDataCubit>().clearUser();
                  // استخدم pushReplacement لتجنب الرجوع إلى صفحة البروفايل بعد تسجيل الخروج
                  GoRouter.of(context).go(AppRouter.kSignInView);
                },
                child: const CustomUserInfoContainer(
                  text: 'Logout',
                  rightPadding: 100,
                  leftPadding: 100,
                ),
              ),
            ],
          );
        } else if (state is UserDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No user data available.'));
        }
      },
    );
  }
}
