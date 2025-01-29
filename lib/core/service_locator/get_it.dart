import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_store/core/networking/dio_factory.dart';
import 'package:my_store/my_store/dashboard/controller/dashboard_cubit.dart';
import 'package:my_store/my_store/home/controller/home_cubit.dart';
import 'package:my_store/my_store/home/data/api/home_api_service.dart';
import 'package:my_store/my_store/home/data/repository/home_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerFactory<DashboardCubit>(() => DashboardCubit());

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
