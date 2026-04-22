import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_service.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/data/repos/login_repo_implement.dart';
import '../../features/auth/login/service/login_service.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo_implement.dart';
import '../../features/auth/sign_up/service/sign_up_service.dart';
import '../../features/quotes/data/repos/quotes_repo.dart';
import '../../features/quotes/data/repos/quotes_repo_implement.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<QuotesRepoImplement>(
    () => QuotesRepoImplement(
      getIt<ApiServices>(),
    ),
  );

  getIt.registerLazySingleton<QuotesRepo>(
    () => QuotesRepoImplement(
      getIt<ApiServices>(),
    ),
  );

  getIt.registerLazySingleton<LoginService>(
    () => LoginService(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<LoginRepoImplement>(
    () => LoginRepoImplement(
      getIt<LoginService>(),
    ),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImplement(
      getIt<LoginService>(),
    ),
  );

  getIt.registerLazySingleton<SignUpService>(
    () => SignUpService(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImplement(
      getIt<SignUpService>(),
    ),
  );
}
