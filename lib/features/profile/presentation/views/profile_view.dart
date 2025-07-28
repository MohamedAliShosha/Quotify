import 'package:flutter/material.dart';

import 'package:starter_template/core/utils/colors_manager.dart';
import 'package:starter_template/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.kBlackColor,
        elevation: 0,
      ),
      body: const ProfileViewBody(),
    );
  }
}
