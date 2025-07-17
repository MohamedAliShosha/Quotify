import 'package:get_it/get_it.dart';
import 'package:starter_template/features/Auth/SignIn/data/repos/sign_in_repo_implement.dart';
import 'package:starter_template/features/Auth/SignIn/presentation/manager/Sign_In_cubit/sign_in_cubit.dart';

//  Create a global instance of GetIt to be used throughout the app
final getIt = GetIt.instance;

void setUpServiceLocator() {
  /*
    - Use registerSingleton for the repo because:
    - It has no changing state
    - One instance is enough for the whole app
  */
  getIt.registerSingleton<SignInRepoImplement>(SignInRepoImplement());

  /*
    - Use registerFactory for the cubit:
    - It holds UI state
    - We need a new instance every time 
  */
  getIt.registerFactory<SignInCubit>(
    () => SignInCubit(getIt<SignInRepoImplement>()),
  );
}
