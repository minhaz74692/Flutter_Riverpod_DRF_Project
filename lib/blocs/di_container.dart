import 'package:dio/dio.dart';
import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:drf_flutter_app/constants.dart';
import 'package:drf_flutter_app/repository/dio/dio_client.dart';
import 'package:drf_flutter_app/repository/dio/logging_interceptor.dart';
import 'package:drf_flutter_app/repository/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core

  sl.registerLazySingleton(
      () => DioClient(AppConstant.baseUrl, sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => AuthBloc(authRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
