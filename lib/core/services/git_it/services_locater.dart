import 'package:deeplinking_project/core/services/api/api_services.dart';
import 'package:deeplinking_project/core/services/api/urls.dart';
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
  //getit.registerLazySingleton<ApiServices>(() => ApiServices(getit<Dio>()));

  //repos
  //getit.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getit.get<ApiServices>()));

  //cubits
  //getit.registerFactory<HomeCubit>(() => HomeCubit(getit.get<HomeRepo>()));
}
