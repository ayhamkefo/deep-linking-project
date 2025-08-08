import 'package:deeplinking_project/core/services/api/api_services.dart';
import 'package:deeplinking_project/core/services/api/urls.dart';
import 'package:deeplinking_project/feature/home/data/repos/home_repo.dart';
import 'package:deeplinking_project/feature/home/data/repos/home_repo_iplm.dart';
import 'package:deeplinking_project/feature/home/presentations/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getit = GetIt.instance;

void setupLocatorServices() {
  // Dio for main server
  getit.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: Urls.mainBaseUrl,
        connectTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    ),
  );

  // ApiServices
  getit.registerLazySingleton<ApiServices>(() => ApiServices(getit<Dio>()));

  //repos
  getit.registerLazySingleton<HomeRepo>(() => HomeRepoIplm(getit.get<ApiServices>()));

  //cubits
  getit.registerLazySingleton<HomeCubit>(() => HomeCubit(getit.get<HomeRepo>()));
}
